From: Stefan Wahren <info@lategoodbye.de>
Subject: strange dtc errors after adding sram node
Date: Sat, 23 Apr 2016 09:46:07 +0200
Message-ID: <571B283F.8010707@lategoodbye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <kernelnewbies-bounces@kernelnewbies.org>
List-Unsubscribe: <http://lists.kernelnewbies.org/mailman/listinfo/kernelnewbies>,
	<mailto:kernelnewbies-request@kernelnewbies.org?subject=unsubscribe>
List-Archive: <http://lists.kernelnewbies.org/pipermail/kernelnewbies>
List-Post: <mailto:kernelnewbies@kernelnewbies.org>
List-Help: <mailto:kernelnewbies-request@kernelnewbies.org?subject=help>
List-Subscribe: <http://lists.kernelnewbies.org/mailman/listinfo/kernelnewbies>,
	<mailto:kernelnewbies-request@kernelnewbies.org?subject=subscribe>
Sender: kernelnewbies-bounces@kernelnewbies.org
Errors-To: kernelnewbies-bounces@kernelnewbies.org
To: kernelnewbies@kernelnewbies.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: =?UTF-8?Q?J=c3=b6rg_Krause?= <joerg.krause@embedded.rocks>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>
List-Id: devicetree@vger.kernel.org

Hi,

i want to add an sram node to arch/arm/boot/dts/imx28.dtsi. According to 
the reference manual [1] the On-Chip RAM is connected to AHB, start 
address 0 and has a size of 128 KB.

So i modified the imx28.dtsi based on the patch below. Unfortunately the 
dtc give me some strang errors:

ERROR (duplicate_label): Duplicate label 'mac0' on 
/ahb@80080000/ethernet@800f0000 and /ahb@00000000/ethernet@800f0000
ERROR: Input tree has errors, aborting (use -f to force output)

What's wrong with my patch or does it reveal another issue?

Regards
Stefan

[1] - http://cache.freescale.com/files/dsp/doc/ref_manual/MCIMX28RM.pdf
i.MX28 Applications Processor Reference Manual, Rev. 2, 08/2013
Chapter 4.1 Memory Map Overview

-------------------------->8---------------------------------------
--- a/arch/arm/boot/dts/imx28.dtsi
+++ b/arch/arm/boot/dts/imx28.dtsi
@@ -1311,13 +1311,18 @@
  		};
  	};

-	ahb@80080000 {
+	ahb@00000000 {
  		compatible = "simple-bus";
  		#address-cells = <1>;
  		#size-cells = <1>;
-		reg = <0x80080000 0x80000>;
+		reg = <0x00000000 0x20000>, <0x80080000 0x80000>;
  		ranges;

+		ocram: sram@00000000 {
+			compatible = "mmio-sram";
+			reg = <0x00000000 0x20000>;
+		};
+
  		usb0: usb@80080000 {
  			compatible = "fsl,imx28-usb", "fsl,imx27-usb";
  			reg = <0x80080000 0x10000>;
