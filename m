From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v3 06/10] ARM: dts: sun9i: Add USB host
 controller nodes to a80 dtsi
Date: Sun, 1 Feb 2015 15:31:06 +0100
Message-ID: <CAGb2v67cSq4oWWy4POR8uMruG_2cvdv8PPrzOTOx2JUJ=uBH+A@mail.gmail.com>
References: <1422388455-25923-1-git-send-email-wens@csie.org>
 <1422388455-25923-7-git-send-email-wens@csie.org> <20150201141750.GG4827@lukather>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBP7RXCTAKGQEWZXYODA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20150201141750.GG4827@lukather>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Sun, Feb 1, 2015 at 3:17 PM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> On Wed, Jan 28, 2015 at 03:54:11AM +0800, Chen-Yu Tsai wrote:
>> The A80 has 3 EHCI/OHCI USB controllers.
>>
>> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/sun9i-a80.dtsi | 70 ++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 70 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/sun9i-a80.dtsi b/arch/arm/boot/dts/sun9i-a80.dtsi
>> index d7ebd9390b01..9483b15bfda7 100644
>> --- a/arch/arm/boot/dts/sun9i-a80.dtsi
>> +++ b/arch/arm/boot/dts/sun9i-a80.dtsi
>> @@ -355,6 +355,28 @@
>>                */
>>               ranges = <0 0 0 0x20000000>;
>>
>> +             ehci0: usb@00a00000 {
>> +                     compatible = "allwinner,sun9i-a80-ehci", "generic-ehci";
>> +                     reg = <0x00a00000 0x100>;
>> +                     interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
>> +                     clocks = <&usb_mod_clk 1>;
>> +                     resets = <&usb_mod_clk 17>;
>> +                     phys = <&usbphy1>;
>> +                     phy-names = "usb";
>> +                     status = "disabled";
>> +             };
>> +
>> +             ohci0: usb@00a00400 {
>> +                     compatible = "allwinner,sun9i-a80-ohci", "generic-ohci";
>> +                     reg = <0x00a00400 0x100>;
>> +                     interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
>> +                     clocks = <&usb_mod_clk 1>, <&usb_mod_clk 2>;
>> +                     resets = <&usb_mod_clk 17>;
>> +                     phys = <&usbphy1>;
>> +                     phy-names = "usb";
>> +                     status = "disabled";
>> +             };
>> +
>>               usbphy1: phy@00a00800 {
>>                       compatible = "allwinner,sun9i-a80-usb-phy";
>>                       reg = <0x00a00800 0x4>;
>> @@ -366,6 +388,32 @@
>>                       #phy-cells = <0>;
>>               };
>>
>> +             ehci1: usb@00a01000 {
>> +                     compatible = "allwinner,sun9i-a80-ehci", "generic-ehci";
>> +                     reg = <0x00a01000 0x100>;
>> +                     interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
>> +                     clocks = <&usb_mod_clk 3>;
>> +                     resets = <&usb_mod_clk 18>;
>> +                     phys = <&usbphy2>;
>> +                     phy-names = "usb";
>> +                     status = "disabled";
>> +             };
>> +
>> +             /*
>> +              * Even though ohci1 exists, it is never used as
>> +              * usb1 only has HSIC pins routed externally
>> +              */
>> +             ohci1: usb@00a01400 {
>> +                     compatible = "allwinner,sun9i-a80-ohci", "generic-ohci";
>> +                     reg = <0x00a01400 0x100>;
>> +                     interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
>> +                     clocks = <&usb_mod_clk 3>, <&usb_mod_clk 4>;
>> +                     resets = <&usb_mod_clk 18>;
>> +                     phys = <&usbphy2>;
>> +                     phy-names = "usb";
>> +                     status = "disabled";
>> +             };
>> +
>
> Is it worth declaring it then? If it's not never ever going to be used
> since no pins are routed outside of the SoC, I don't think it should
> be declared in the DTSI.

You have a point. Also the user manual doesn't even list OHCI1. I did
this work before the manual was available. I will update this patch.

ChenYu
