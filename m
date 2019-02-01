From: Harald Geyer <harald@ccbib.org>
Subject: [PATCH RFC] arm64: dts: allwinner: a64: teres-i: Enable audio
Date: Fri,  1 Feb 2019 11:37:43 +0000
Message-ID: <20190201113743.10058-1-harald@ccbib.org>
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
To: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, info@olimex.com, Mark Brown <broonie@kernel.org>, Harald Geyer <harald@ccbib.org>, ibu@radempa.de, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The TERES-I has internal speakers (left, right), internal microphone
and a headset combo jack (headphones + mic).

The headphone lines are multiplexed with the debug console.
The headphone and mic detect lines of the A64 are connected properly,
but AFAIK currently unsupported by the driver.

Signed-off-by: Harald Geyer <harald@ccbib.org>
---
Hi all,

a couple of issues make this patch RFC:

hpvcc-supply vs. cpvdd-supply:
On the A64 manual the pin is called CPVDD and the binding documents
requires a cpvdd-supply property. However in the actual driver and
devicetrees so far hpvcc-supply is used. This is a very new binding,
so we have the luxury to decide either way, I think. Any input from
the devicetree maintainers would be appreciated.

debug console multiplexing:
Olimex have a userspace script that controls gpio PL9 during boot,
to select between HP and serial console. I guess this is not acceptable
for mainline.

The best solution I can see is to switch the HP jack from serial console
to audio once the audio drivers load. With this people can still capture
the bootlogs but everybody gets audio once the system is up and
switching back to console output is as simple as unloading the audio
drivers.

However the current implementation with a pinctrl group doesn't work:
The audio card device correctly claims the pin (ie I can't export the
gpio in sysfs anymore), but the pinctrl driver doesn't set the pin
to output.

Testing:
I don't have a headset with combo connector, so I could only test the
headphones output, but not the headset mic. If somebody happens to
have a TERES-I and a suitable headset, testing this would be nice.

TIA,
Harald

 .../boot/dts/allwinner/sun50i-a64-teres-i.dts | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
index f9eede0a8bd3..d57049fbdaca 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
@@ -70,6 +70,26 @@
 		compatible = "mmc-pwrseq-simple";
 		reset-gpios = <&r_pio 0 2 GPIO_ACTIVE_LOW>; /* PL2 */
 	};
+
+	speaker_amp: audio-amplifier {
+		compatible = "simple-audio-amplifier";
+		enable-gpios = <&r_pio 0 12 GPIO_ACTIVE_HIGH>; /* PL12 */
+		sound-name-prefix = "Speaker Amp";
+	};
+};
+
+&codec {
+	status = "okay";
+};
+
+&codec_analog {
+	hpvcc-supply = <&reg_eldo1>; /* TODO: Use only one of these */
+	cpvdd-supply = <&reg_eldo1>;
+	status = "okay";
+};
+
+&dai {
+	status = "okay";
 };
 
 &ehci1 {
@@ -131,6 +151,14 @@
 	status = "okay";
 };
 
+&r_pio {
+	r_debug_select_pin: debug-select {
+		pins = "PL9";
+		function = "gpio_out";
+		output-high;
+	};
+};
+
 &r_rsb {
 	status = "okay";
 
@@ -258,6 +286,31 @@
 	vcc-hdmi-supply = <&reg_dldo1>;
 };
 
+&sound {
+	pinctrl-names = "default";
+	pinctrl-0 = <&r_debug_select_pin>;
+	simple-audio-card,aux-devs = <&codec_analog>, <&speaker_amp>;
+	simple-audio-card,widgets = "Headphone", "Headphone Jack",
+				    "Microphone", "Headset Microphone",
+				    "Microphone", "Internal Microphone",
+				    "Speaker", "Internal Speaker";
+	simple-audio-card,routing =
+			"Left DAC", "AIF1 Slot 0 Left",
+			"Right DAC", "AIF1 Slot 0 Right",
+			"AIF1 Slot 0 Left ADC", "Left ADC",
+			"AIF1 Slot 0 Right ADC", "Right ADC",
+			"Headphone Jack", "HP",
+			"Speaker Amp INL", "LINEOUT",
+			"Speaker Amp INR", "LINEOUT",
+			"Internal Speaker", "Speaker Amp OUTL",
+			"Internal Speaker", "Speaker Amp OUTR",
+			"Internal Microphone", "MBIAS",
+			"MIC1", "Internal Microphone",
+			"Headset Microphone", "HBIAS",
+			"MIC2", "Headset Microphone";
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pb_pins>;
-- 
2.20.1
