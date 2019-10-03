From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v2] ARM: dts: rockchip: Use interpolated brightness tables for
 veyron
Date: Thu,  3 Oct 2019 09:41:52 -0700
Message-ID: <20191003094137.v2.1.Ic9fd698810ea569c465350154da40b85d24f805b@changeid>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Matthias Kaehlcke <mka@chromium.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Use interpolated brightness tables (added by commit 573fe6d1c25
("backlight: pwm_bl: Linear interpolation between
brightness-levels") for veyron, instead of specifying every single
step. Some devices/panels have intervals that are smaller than
the specified 'num-interpolated-steps', the driver interprets
these intervals as a single step.

Another option would be to switch to a perceptual brightness curve
(CIE 1931), with the caveat that it would change the behavior of
the backlight. Also the concept of a minimum brightness level is
currently not supported for CIE 1931 curves.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---

Changes in v2:
- added 0 as first step for devices/panels that require a minimum
  PWM duty cycle
- increased 'num-interpolated-steps' values by one, it's not the
  number of steps between levels, but that number +1

 arch/arm/boot/dts/rk3288-veyron-edp.dtsi   | 35 ++--------------------
 arch/arm/boot/dts/rk3288-veyron-jaq.dts    | 35 ++--------------------
 arch/arm/boot/dts/rk3288-veyron-minnie.dts | 35 ++--------------------
 arch/arm/boot/dts/rk3288-veyron-tiger.dts  | 35 ++--------------------
 4 files changed, 8 insertions(+), 132 deletions(-)

diff --git a/arch/arm/boot/dts/rk3288-veyron-edp.dtsi b/arch/arm/boot/dts/rk3288-veyron-edp.dtsi
index b12e061c5f7f..300a7e32c978 100644
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
+		num-interpolated-steps = <255>;
 		default-brightness-level = <128>;
 		enable-gpios = <&gpio7 RK_PA2 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/rk3288-veyron-jaq.dts b/arch/arm/boot/dts/rk3288-veyron-jaq.dts
index 80386203e85b..a4966e505a2f 100644
--- a/arch/arm/boot/dts/rk3288-veyron-jaq.dts
+++ b/arch/arm/boot/dts/rk3288-veyron-jaq.dts
@@ -20,39 +20,8 @@
 
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
+	brightness-levels = <0 8 255>;
+	num-interpolated-steps = <247>;
 };
 
 &rk808 {
diff --git a/arch/arm/boot/dts/rk3288-veyron-minnie.dts b/arch/arm/boot/dts/rk3288-veyron-minnie.dts
index 55955b082501..c833716dbe48 100644
--- a/arch/arm/boot/dts/rk3288-veyron-minnie.dts
+++ b/arch/arm/boot/dts/rk3288-veyron-minnie.dts
@@ -38,39 +38,8 @@
 
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
+	brightness-levels = <0 3 255>;
+	num-interpolated-steps = <252>;
 };
 
 &i2c_tunnel {
diff --git a/arch/arm/boot/dts/rk3288-veyron-tiger.dts b/arch/arm/boot/dts/rk3288-veyron-tiger.dts
index 27557203ae33..bebb230e592f 100644
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
+	brightness-levels = <0 3 255>;
+	num-interpolated-steps = <252>;
 };
 
 &backlight_regulator {
-- 
2.23.0.444.g18eeb5a265-goog
