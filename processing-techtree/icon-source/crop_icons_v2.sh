#!/bin/bash
set -e
SRC="/c/Users/decim/Desktop/git/mobinogi/processing-techtree/icon-source"
OUT="/c/Users/decim/Desktop/git/mobinogi/processing-techtree/icons"
MASK="$SRC/graymask140.png"

SIZE=140

crop_and_mask() {
  local screenshot="$1" x="$2" y="$3" name="$4"
  ffmpeg -y -v error -i "$SRC/$screenshot" -vf "crop=$SIZE:$SIZE:$x:$y" "$OUT/_raw_tmp.png"
  ffmpeg -y -v error -i "$OUT/_raw_tmp.png" -i "$MASK" -filter_complex "alphamerge" "$OUT/${name}.png"
}

# ---- Template A (origin 665,213), DX=27 DY=44 ----
OX=665; OY=213; PX=196; PY=252; DX=27; DY=44

crop_a() {
  local screenshot="$1"; shift
  local cols="$1"; shift
  local i=0
  for name in "$@"; do
    local row=$((i / cols)); local col=$((i % cols))
    local x=$((OX + col*PX + DX)); local y=$((OY + row*PY + DY))
    crop_and_mask "$screenshot" "$x" "$y" "$name"
    i=$((i+1))
  done
}

crop_a "금속 가공.png" 5 \
  "철괴(광석)" "철괴(철 광석)" "강철괴" "합금강괴" "타르" \
  "특수강괴" "은합금괴" "운철괴" "백금강괴"

crop_a "목재 가공.png" 5 \
  "목재" "목재+" "상급 목재" "상급 목재+" "부드러운 목재" \
  "단단한 목재" "최상급 목재" "최상급 목재+" "구름결 막대" "특급 목재"

crop_a "가죽 가공.png" 5 \
  "가죽" "가죽+" "상급 가죽" "상급 가죽+" "최상급 가죽" \
  "최상급 가죽+" "특급 가죽"

crop_a "옷감 가공.png" 5 \
  "옷감" "실크" "옷감+" "상급 옷감" "두꺼운 옷감" \
  "상급 실크" "상급 옷감+" "식물 섬유" "밧줄" "최상급 옷감" \
  "최상급 실크" "튼튼한 밧줄" "최상급 옷감+" "특급 옷감" "특급 실크"

crop_a "식재료 가공.png" 5 \
  "마요네즈" "밀가루" "치즈" "면" "생크림" \
  "물에 불린 콩" "두부" "두유" "숙성된 커다란 고기" "물에 불린 쌀" \
  "밥" "말린 찻잎" "발효된 찻잎" "헤이즐넛 오일" "오트밀"

crop_a "약품 가공1.png" 5 \
  "새록 버섯 진액" "튼튼 버섯 가루" "튼튼 버섯 진액" "광휘의 결정(유령 반딧불이)" "새록 버섯 포자" \
  "튼튼 버섯 포자" "쑥쑥 버섯 포자" "쑥쑥 버섯 진액" "불꽃의 결정(석양나비)" "아교" \
  "숨숨꽃 가루" "깔끔 버섯 포자" "깔끔 버섯 진액" "얼음의 결정(흰얼음풍뎅이)" "마력 기폭제" \
  "봉인된 분노의 파편" "봉인된 망각의 파편" "봉인된 야성의 파편" "생채기꽃 가루" "증폭 버섯 포자"

echo "phase A done"

# ---- 약품 가공2.png 특수 행 (origin 665, row_top 다름), DX=45 DY=90 ----
DX2=45; DY2=90
crop_row2() {
  local rowTop="$1"; shift
  local i=0
  for name in "$@"; do
    local x=$((665 + i*196 + DX2))
    crop_and_mask "약품 가공2.png" "$x" "$((rowTop+DY2))" "$name"
    i=$((i+1))
  done
}
crop_row2 498 "증폭 버섯 진액" "전기의 결정(낙엽나방)" "진정초 가루" "솔솔 버섯 포자" "솔솔 버섯 진액"
crop_row2 750 "봉인의 결정(황혼잠자리)" "환영 가루" "끈적 풀 가루" "산뜻 버섯 포자" "산뜻 버섯 진액"
crop_row2 1002 "광휘의 결정(달무늬 사슴벌레)"

rm -f "$OUT/_raw_tmp.png"
echo "phase B done"
