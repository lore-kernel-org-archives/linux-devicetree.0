From: =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [RFC PATCH 4/5] arm64: dts: sunxi: add SCPI driven
 clocks and nodes for A64 MMC
Date: Thu, 11 Aug 2016 00:19:16 +0100
Message-ID: <205c8041-9294-449d-b918-f6f5757b90b3@arm.com>
References: <20160809115303.17032-1-andre.przywara@arm.com>
 <20160809115303.17032-5-andre.przywara@arm.com>
 <1241311470841308@web22g.yandex.ru>
Reply-To: andre.przywara-5wv7dgnIgG8@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDNZNK75ZIKRBKXNV26QKGQEIIJO2MA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <1241311470841308-rOnvOMecT25xpj1cXAZ9Bg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 10/08/16 16:01, Icenowy Zheng wrote:

Hi,

> 09.08.2016, 19:58, "Andre Przywara" <andre.przywara-5wv7dgnIgG8@public.gmane.org>:
>>  The MMC controllers in the Allwinner A64 SoC are somewhat compatible
>>  with the versions used in other Allwinner SoCs.
>>  Tell Linux about the three MMC clocks that the firmware implements and
>>  add nodes to represent the MMC controllers.
>>  The actual hardware is capable of new transfer modes, which the driver
>>  does not fully support yet, also the clock part has changed, but it
>>  works like this at least for SD card accesses.
>>
>>  Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
>>  ---
>>   arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 61 +++++++++++++++++++++++++++
>>   1 file changed, 61 insertions(+)
>>
>>  diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
>>  index 9fc540e..0f6044b 100644
>>  --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
>>  +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
>>  @@ -157,6 +157,19 @@
>>                   compatible = "arm,scpi";
>>                   mboxes = <&mailbox 0>;
>>                   shmem = <&cpu_scp_mem>;
>>  +
>>  + clocks {
>>  + compatible = "arm,scpi-clocks";
>>  +
>>  + scpi_clk: scpi_clocks {
>>  + compatible = "arm,scpi-variable-clocks";
>>  + #clock-cells = <1>;
>>  + clock-indices = <0>, <1>,
> 
> 
> I found a problem of the "standardize" process.
> There cannot be an authority to keep the clock ID standardized, in both 

Why would this need to be standardized? All we would need to take care
of is matching firmware and DT. Ideally firmware generates (or provides)
that part of the DT, so it just puts in the bits and IDs it actually
implements.
Actually I am more for exploiting the "name" field for a clock that SCPI
provides. It allows clocks to be identified without knowing any ID in
advance, up to the point where we have something like "Ethernet" as a
clock identifier. I wonder if Linux could make use of that somehow.

Cheers,
Andre

> 
>>  + <2>;
>>  + clock-output-names = "mmc0_clk", "mmc1_clk",
>>  + "mmc2_clk";
>>  + };
>>  + };
>>           };
>>
>>           soc {
>>  @@ -165,6 +178,54 @@
>>                   #size-cells = <1>;
>>                   ranges;
>>
>>  + mmc0: mmc@1c0f000 {
>>  + compatible = "allwinner,sun50i-a64-mmc",
>>  + "allwinner,sun5i-a13-mmc";
>>  + reg = <0x01c0f000 0x1000>;
>>  + clocks = <&bus_gates 8>, <&scpi_clk 0>,
>>  + <&scpi_clk 0>, <&scpi_clk 0>;
>>  + clock-names = "ahb", "mmc",
>>  + "output", "sample";
>>  + resets = <&ahb_rst 8>;
>>  + reset-names = "ahb";
>>  + interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
>>  + status = "disabled";
>>  + #address-cells = <1>;
>>  + #size-cells = <0>;
>>  + };
>>  +
>>  + mmc1: mmc@1c10000 {
>>  + compatible = "allwinner,sun50i-a64-mmc",
>>  + "allwinner,sun5i-a13-mmc";
>>  + reg = <0x01c10000 0x1000>;
>>  + clocks = <&bus_gates 9>, <&scpi_clk 1>,
>>  + <&scpi_clk 1>, <&scpi_clk 1>;
>>  + clock-names = "ahb", "mmc",
>>  + "output", "sample";
>>  + resets = <&ahb_rst 9>;
>>  + reset-names = "ahb";
>>  + interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
>>  + status = "disabled";
>>  + #address-cells = <1>;
>>  + #size-cells = <0>;
>>  + };
>>  +
>>  + mmc2: mmc@1c11000 {
>>  + compatible = "allwinner,sun50i-a64-mmc",
>>  + "allwinner,sun5i-a13-mmc";
>>  + reg = <0x01c11000 0x1000>;
>>  + clocks = <&bus_gates 10>, <&scpi_clk 2>,
>>  + <&scpi_clk 2>, <&scpi_clk 2>;
>>  + clock-names = "ahb", "mmc",
>>  + "output", "sample";
>>  + resets = <&ahb_rst 10>;
>>  + reset-names = "ahb";
>>  + interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
>>  + status = "disabled";
>>  + #address-cells = <1>;
>>  + #size-cells = <0>;
>>  + };
>>  +
>>                   pio: pinctrl@1c20800 {
>>                           compatible = "allwinner,sun50i-a64-pinctrl";
>>                           reg = <0x01c20800 0x400>;
>>  --
>>  2.9.0
>>
>>  _______________________________________________
>>  linux-arm-kernel mailing list
>>  linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>>  http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 
