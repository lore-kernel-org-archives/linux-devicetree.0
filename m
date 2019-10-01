From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH] ARM: dts: rockchip: Use interpolated brightness tables for veyron
Date: Tue,  1 Oct 2019 16:07:43 -0700
Message-ID: <20191001160735.1.Ic9fd698810ea569c465350154da40b85d24f805b@changeid>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Douglas Anderson <dianders@chromium.org>, Matthias Kaehlcke <mka@chromium.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Use interpolated brightness tables (added by commit 573fe6d1c25
("backlight: pwm_bl: Linear interpolation between
brightness-levels") for veyron, instead of specifying every single
step.

Another option would be to switch to a perceptual brightness curve
(CIE 1931), with the caveat that it would change the behavior of
the backlight. Also the concept of a minimum brightness level is
currently not supported for CIE 1931 curves.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---

 arch/arm/boot/dts/rk3288-veyron-edp.dtsi   | 35 ++--------------------
 arch/arm/boot/dts/rk3288-veyron-jaq.dts    | 35 ++--------------------
 arch/arm/boot/dts/rk3288-veyron-minnie.dts | 35 ++--------------------
 arch/arm/boot/dts/rk3288-veyron-tiger.dts  | 35 ++--------------------
 4 files changed, 8 insertions(+), 132 deletions(-)

diff --git a/arch/arm/boot/dts/rk3288-veyron-edp.dtsi b/arch/arm/boot/dts/rk3288-veyron-edp.dtsi
index 773bedca872f..e95c89fe0545 100644
--- a/arch/arm/boot/dts/rk3288-veyron-edp.dtsi
+++ b/arch/arm/boot/dts/rk3288-veyron-edp.dtsi
@@ -41,39 +41,8 @@
 
 	backlight: backlight {
 		compatible = "pwm-backlight";
-		brightness-levels = <
-			  0   1   2   3   4   5   6   7
-			  8   9  10  11  12  13  14  15
-			 16  17  18  19  20  21  22  23
-			 24  25  26  27  28  29  30  31
-			 32  33  34  35  36  37  38  39
-			 40  41  42  43  44  45  46  47
-			 48  49  50  51  52  53  54  55
-			 56  57  58  59  60  61  62  63
-			 64  65  66  67  68  69  70  71
-			 72  73  74  75  76  77  78  79
-			 80  81  82  83  84  85  86  87
-			 88  89  90  91  92  93  94  95
-			 96  97  98  99 100 101 102 103
-			104 105 106 107 108 109 110 111
-			112 113 114 115 116 117 118 119
-			120 121 122 123 124 125 126 127
-			128 129 130 131 132 133 134 135
-			136 137 138 139 140 141 142 143
-			144 145 146 147 148 149 150 151
-			152 153 154 155 156 157 158 159
-			160 161 162 163 164 165 166 167
-			168 169 170 171 172 173 174 175
-			176 177 178 179 180 181 182 183
-			184 185 186 187 188 189 190 191
-			192 193 194 195 196 197 198 199
-			200 201 202 203 204 205 206 207
-			208 209 210 211 212 213 214 215
-			216 217 218 219 220 221 222 223
-			224 225 226 227 228 229 230 231
-			232 233 234 235 236 237 238 239
-			240 241 242 243 244 245 246 247
-			248 249 250 251 252 253 254 255>;
+		brightness-levels = <0 255>;
+		num-interpolated-steps = <254>;
 		default-brightness-level = <128>;
 		enable-gpios = <&gpio7 RK_PA2 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/rk3288-veyron-jaq.dts b/arch/arm/boot/dts/rk3288-veyron-jaq.dts
index 56ad9a43a6c2..5e10cc644875 100644
--- a/arch/arm/boot/dts/rk3288-veyron-jaq.dts
+++ b/arch/arm/boot/dts/rk3288-veyron-jaq.dts
@@ -21,39 +21,8 @@
 
 &backlight {
 	/* Jaq panel PWM must be >= 3%, so start non-zero brightness at 8 */
-	brightness-levels = <
-		  0
-		  8   9  10  11  12  13  14  15
-		 16  17  18  19  20  21  22  23
-		 24  25  26  27  28  29  30  31
-		 32  33  34  35  36  37  38  39
-		 40  41  42  43  44  45  46  47
-		 48  49  50  51  52  53  54  55
-		 56  57  58  59  60  61  62  63
-		 64  65  66  67  68  69  70  71
-		 72  73  74  75  76  77  78  79
-		 80  81  82  83  84  85  86  87
-		 88  89  90  91  92  93  94  95
-		 96  97  98  99 100 101 102 103
-		104 105 106 107 108 109 110 111
-		112 113 114 115 116 117 118 119
-		120 121 122 123 124 125 126 127
-		128 129 130 131 132 133 134 135
-		136 137 138 139 140 141 142 143
-		144 145 146 147 148 149 150 151
-		152 153 154 155 156 157 158 159
-		160 161 162 163 164 165 166 167
-		168 169 170 171 172 173 174 175
-		176 177 178 179 180 181 182 183
-		184 185 186 187 188 189 190 191
-		192 193 194 195 196 197 198 199
-		200 201 202 203 204 205 206 207
-		208 209 210 211 212 213 214 215
-		216 217 218 219 220 221 222 223
-		224 225 226 227 228 229 230 231
-		232 233 234 235 236 237 238 239
-		240 241 242 243 244 245 246 247
-		248 249 250 251 252 253 254 255>;
+	brightness-levels = <8 255>;
+	num-interpolated-steps = <246>;
 };
 
 &rk808 {
diff --git a/arch/arm/boot/dts/rk3288-veyron-minnie.dts b/arch/arm/boot/dts/rk3288-veyron-minnie.dts
index 6b0e1cb1f681..503278e60d6b 100644
--- a/arch/arm/boot/dts/rk3288-veyron-minnie.dts
+++ b/arch/arm/boot/dts/rk3288-veyron-minnie.dts
@@ -39,39 +39,8 @@
 
 &backlight {
 	/* Minnie panel PWM must be >= 1%, so start non-zero brightness at 3 */
-	brightness-levels = <
-			  0   3   4   5   6   7
-			  8   9  10  11  12  13  14  15
-			 16  17  18  19  20  21  22  23
-			 24  25  26  27  28  29  30  31
-			 32  33  34  35  36  37  38  39
-			 40  41  42  43  44  45  46  47
-			 48  49  50  51  52  53  54  55
-			 56  57  58  59  60  61  62  63
-			 64  65  66  67  68  69  70  71
-			 72  73  74  75  76  77  78  79
-			 80  81  82  83  84  85  86  87
-			 88  89  90  91  92  93  94  95
-			 96  97  98  99 100 101 102 103
-			104 105 106 107 108 109 110 111
-			112 113 114 115 116 117 118 119
-			120 121 122 123 124 125 126 127
-			128 129 130 131 132 133 134 135
-			136 137 138 139 140 141 142 143
-			144 145 146 147 148 149 150 151
-			152 153 154 155 156 157 158 159
-			160 161 162 163 164 165 166 167
-			168 169 170 171 172 173 174 175
-			176 177 178 179 180 181 182 183
-			184 185 186 187 188 189 190 191
-			192 193 194 195 196 197 198 199
-			200 201 202 203 204 205 206 207
-			208 209 210 211 212 213 214 215
-			216 217 218 219 220 221 222 223
-			224 225 226 227 228 229 230 231
-			232 233 234 235 236 237 238 239
-			240 241 242 243 244 245 246 247
-			248 249 250 251 252 253 254 255>;
+	brightness-levels = <3 255>;
+	num-interpolated-steps = <251>;
 };
 
 &i2c_tunnel {
diff --git a/arch/arm/boot/dts/rk3288-veyron-tiger.dts b/arch/arm/boot/dts/rk3288-veyron-tiger.dts
index 27557203ae33..e50367564dc6 100644
--- a/arch/arm/boot/dts/rk3288-veyron-tiger.dts
+++ b/arch/arm/boot/dts/rk3288-veyron-tiger.dts
@@ -23,39 +23,8 @@
 
 &backlight {
 	/* Tiger panel PWM must be >= 1%, so start non-zero brightness at 3 */
-	brightness-levels = <
-		  0   3   4   5   6   7
-		  8   9  10  11  12  13  14  15
-		 16  17  18  19  20  21  22  23
-		 24  25  26  27  28  29  30  31
-		 32  33  34  35  36  37  38  39
-		 40  41  42  43  44  45  46  47
-		 48  49  50  51  52  53  54  55
-		 56  57  58  59  60  61  62  63
-		 64  65  66  67  68  69  70  71
-		 72  73  74  75  76  77  78  79
-		 80  81  82  83  84  85  86  87
-		 88  89  90  91  92  93  94  95
-		 96  97  98  99 100 101 102 103
-		104 105 106 107 108 109 110 111
-		112 113 114 115 116 117 118 119
-		120 121 122 123 124 125 126 127
-		128 129 130 131 132 133 134 135
-		136 137 138 139 140 141 142 143
-		144 145 146 147 148 149 150 151
-		152 153 154 155 156 157 158 159
-		160 161 162 163 164 165 166 167
-		168 169 170 171 172 173 174 175
-		176 177 178 179 180 181 182 183
-		184 185 186 187 188 189 190 191
-		192 193 194 195 196 197 198 199
-		200 201 202 203 204 205 206 207
-		208 209 210 211 212 213 214 215
-		216 217 218 219 220 221 222 223
-		224 225 226 227 228 229 230 231
-		232 233 234 235 236 237 238 239
-		240 241 242 243 244 245 246 247
-		248 249 250 251 252 253 254 255>;
+	brightness-levels = <3 255>;
+	num-interpolated-steps = <251>;
 };
 
 &backlight_regulator {
-- 
2.23.0.444.g18eeb5a265-goog
