From: <linux-kernel-dev@beckhoff.com>
Subject: Re: [PATCH] ARM: dts: imx53: fix EIM_D27/29 pad UART2 configuration
Date: Mon, 7 Dec 2015 14:48:04 +0100
Message-ID: <1449496084-11122-1-git-send-email-linux-kernel-dev@beckhoff.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org, kernel@pengutronix.de
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Patrick=20Br=C3=BCnn?= <p.bruenn@beckhoff.com>
List-Id: devicetree@vger.kernel.org

=46rom: Patrick Br=C3=BCnn <p.bruenn@beckhoff.com>

On Tue, Dec 1, 2015 at 20:52:25 PST, shawnguo@kernel.org wrote:
> On Thu, Nov 26, 2015 at 11:59:15AM +0100, linux-kernel-dev@beckhoff.c=
om wrote:
>> MX53_PAD_EIM_D27__UART2_RXD_MUX and MX53_PAD_EIM_D29__UART2_RTS inpu=
t_val must be configured as 0 instead of 1 to have UART2 muxed on EIM p=
ins working
>
> I'm not sure why you think that.  But the i.MX53 Reference Manual in =
my hands doesn't agree with that.  It says ...
>>=20
>> Signed-off-by: Patrick Br=C3=BCnn <p.bruenn@beckhoff.com>
>> ---
>>  arch/arm/boot/dts/imx53-pinfunc.h | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/arch/arm/boot/dts/imx53-pinfunc.h b/arch/arm/boot/dts/i=
mx53-pinfunc.h
>> index aec406b..a4c973d 100644
>> --- a/arch/arm/boot/dts/imx53-pinfunc.h
>> +++ b/arch/arm/boot/dts/imx53-pinfunc.h
>> @@ -532,7 +532,7 @@
>>  #define MX53_PAD_EIM_D26__IPU_DISP1_DAT_22			0x144 0x48c 0x000 0x7 =
0x0
>>  #define MX53_PAD_EIM_D27__EMI_WEIM_D_27				0x148 0x490 0x000 0x0 0x=
0
>>  #define MX53_PAD_EIM_D27__GPIO3_27				0x148 0x490 0x000 0x1 0x0
>> -#define MX53_PAD_EIM_D27__UART2_RXD_MUX				0x148 0x490 0x880 0x2 0x=
1
>> +#define MX53_PAD_EIM_D27__UART2_RXD_MUX				0x148 0x490 0x880 0x2 0x=
0
>
> IOMUXC_UART2_IPP_UART_RXD_MUX_SELECT_INPUT DAISY field descriptions
>
> 000 - Selecting Pad: EIM_D26 for Mode: ALT2.
> 001 - Selecting Pad: EIM_D27 for Mode: ALT2.
> 010 - Selecting Pad: PATA_DMARQ for Mode: ALT3.
> 011 - Selecting Pad: PATA_BUFFER_EN for Mode: ALT3.
> 100 - Selecting Pad: GPIO_7 for Mode: ALT4.
> 101 - Selecting Pad: GPIO_8 for Mode: ALT4.


Thanks for the hint. I had a closer look at the reference manual and ou=
r schematics. Of course, you are right. The defines are good as they ar=
e, my patch was stupid.

I just realized RXD and TXD are inverted on our hardware (CX9020 Embedd=
ed PC). Which requires a pinmux configuration like this:
EIM_D26->UART2_RXD
EIM_D27->UART2_TXD
EIM_D28->UART2_RTS
EIM_D29->UART2_CTS

In my opinion the reference manual allows such a configuration, but I a=
m not sure if it's appropriate for mainline.

Would you accept a patch like the following:

>8------------------------------------------------------8<
ARM: dts: imx53: add EIM pad config for UART2

Add another pinmux configuration to mux UART2 on EIM pads:

EIM_D26->UART2_RXD
EIM_D27->UART2_TXD
EIM_D28->UART2_RTS
EIM_D29->UART2_CTS

Signed-off-by: Patrick Br=C3=BCnn <p.bruenn@beckhoff.com>
---
 arch/arm/boot/dts/imx53-pinfunc.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/imx53-pinfunc.h b/arch/arm/boot/dts/imx5=
3-pinfunc.h
index aec406b..7d26d16 100644
--- a/arch/arm/boot/dts/imx53-pinfunc.h
+++ b/arch/arm/boot/dts/imx53-pinfunc.h
@@ -525,6 +525,7 @@
 #define MX53_PAD_EIM_D26__EMI_WEIM_D_26                               =
 0x144 0x48c 0x000 0x0 0x0
 #define MX53_PAD_EIM_D26__GPIO3_26                             0x144 0=
x48c 0x000 0x1 0x0
 #define MX53_PAD_EIM_D26__UART2_TXD_MUX                               =
 0x144 0x48c 0x000 0x2 0x0
+#define MX53_PAD_EIM_D26__UART2_RXD_MUX                               =
 0x144 0x48c 0x880 0x2 0x0
 #define MX53_PAD_EIM_D26__FIRI_RXD                             0x144 0=
x48c 0x80c 0x3 0x0
 #define MX53_PAD_EIM_D26__IPU_CSI0_D_1                         0x144 0=
x48c 0x000 0x4 0x0
 #define MX53_PAD_EIM_D26__IPU_DI1_PIN11                               =
 0x144 0x48c 0x000 0x5 0x0
@@ -532,6 +533,7 @@
 #define MX53_PAD_EIM_D26__IPU_DISP1_DAT_22                     0x144 0=
x48c 0x000 0x7 0x0
 #define MX53_PAD_EIM_D27__EMI_WEIM_D_27                               =
 0x148 0x490 0x000 0x0 0x0
 #define MX53_PAD_EIM_D27__GPIO3_27                             0x148 0=
x490 0x000 0x1 0x0
+#define MX53_PAD_EIM_D27__UART2_TXD_MUX                               =
 0x148 0x490 0x000 0x2 0x0
 #define MX53_PAD_EIM_D27__UART2_RXD_MUX                               =
 0x148 0x490 0x880 0x2 0x1
 #define MX53_PAD_EIM_D27__FIRI_TXD                             0x148 0=
x490 0x000 0x3 0x0
 #define MX53_PAD_EIM_D27__IPU_CSI0_D_0                         0x148 0=
x490 0x000 0x4 0x0
@@ -541,6 +543,7 @@
 #define MX53_PAD_EIM_D28__EMI_WEIM_D_28                               =
 0x14c 0x494 0x000 0x0 0x0
 #define MX53_PAD_EIM_D28__GPIO3_28                             0x14c 0=
x494 0x000 0x1 0x0
 #define MX53_PAD_EIM_D28__UART2_CTS                            0x14c 0=
x494 0x000 0x2 0x0
+#define MX53_PAD_EIM_D28__UART2_RTS                            0x14c 0=
x494 0x87c 0x2 0x0
 #define MX53_PAD_EIM_D28__IPU_DISPB0_SER_DIO                   0x14c 0=
x494 0x82c 0x3 0x1
 #define MX53_PAD_EIM_D28__CSPI_MOSI                            0x14c 0=
x494 0x788 0x4 0x1
 #define MX53_PAD_EIM_D28__I2C1_SDA                             0x14c 0=
x494 0x818 0x5 0x1
@@ -548,6 +551,7 @@
 #define MX53_PAD_EIM_D28__IPU_DI0_PIN13                               =
 0x14c 0x494 0x000 0x7 0x0
 #define MX53_PAD_EIM_D29__EMI_WEIM_D_29                               =
 0x150 0x498 0x000 0x0 0x0
 #define MX53_PAD_EIM_D29__GPIO3_29                             0x150 0=
x498 0x000 0x1 0x0
+#define MX53_PAD_EIM_D29__UART2_CTS                            0x150 0=
x498 0x000 0x2 0x0
 #define MX53_PAD_EIM_D29__UART2_RTS                            0x150 0=
x498 0x87c 0x2 0x1
 #define MX53_PAD_EIM_D29__IPU_DISPB0_SER_RS                    0x150 0=
x498 0x000 0x3 0x0
 #define MX53_PAD_EIM_D29__CSPI_SS0                             0x150 0=
x498 0x78c 0x4 0x2
--
1.9.1
