From: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH 1/2] ARM: dts: modify rk3288 jaq backlight-level
Date: Mon,  7 Dec 2015 21:11:08 +0800
Message-ID: <1449493869-32151-1-git-send-email-wxt@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

the panel which jaq use require the pwm duty cycle larger than 3%,
when the backlight status from power off to power on, otherwise the
backlight will flush, so we modify the second brightness-level to 8,
and when the backlight from power off to power on the pwm duty cycle
will larger than 3%.

Signed-off-by: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---

Changes in v1: None

 arch/arm/boot/dts/rk3288-veyron-jaq.dts | 37 +++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288-veyron-jaq.dts b/arch/arm/boot/dts/rk3288-veyron-jaq.dts
index c2f52cf..991b717 100644
--- a/arch/arm/boot/dts/rk3288-veyron-jaq.dts
+++ b/arch/arm/boot/dts/rk3288-veyron-jaq.dts
@@ -88,6 +88,43 @@
 	};
 };
 
+&backlight {
+	/* Jaq panel PWM must be >= 3%, so start non-zero brightness at 8 */
+	brightness-levels = <
+		  0
+		  8   9  10  11  12  13  14  15
+		 16  17  18  19  20  21  22  23
+		 24  25  26  27  28  29  30  31
+		 32  33  34  35  36  37  38  39
+		 40  41  42  43  44  45  46  47
+		 48  49  50  51  52  53  54  55
+		 56  57  58  59  60  61  62  63
+		 64  65  66  67  68  69  70  71
+		 72  73  74  75  76  77  78  79
+		 80  81  82  83  84  85  86  87
+		 88  89  90  91  92  93  94  95
+		 96  97  98  99 100 101 102 103
+		104 105 106 107 108 109 110 111
+		112 113 114 115 116 117 118 119
+		120 121 122 123 124 125 126 127
+		128 129 130 131 132 133 134 135
+		136 137 138 139 140 141 142 143
+		144 145 146 147 148 149 150 151
+		152 153 154 155 156 157 158 159
+		160 161 162 163 164 165 166 167
+		168 169 170 171 172 173 174 175
+		176 177 178 179 180 181 182 183
+		184 185 186 187 188 189 190 191
+		192 193 194 195 196 197 198 199
+		200 201 202 203 204 205 206 207
+		208 209 210 211 212 213 214 215
+		216 217 218 219 220 221 222 223
+		224 225 226 227 228 229 230 231
+		232 233 234 235 236 237 238 239
+		240 241 242 243 244 245 246 247
+		248 249 250 251 252 253 254 255>;
+};
+
 &rk808 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pmic_int_l &dvs_1 &dvs_2>;
-- 
1.9.1
