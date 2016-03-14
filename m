From: Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/5] ARM: dts: sunxi: Add the SPDIF to the
 A10 and A20
Date: Mon, 14 Mar 2016 17:29:37 +0100
Message-ID: <CAEKpxBm4bs7sNSbDjomdP6XS2ApvfDT-s942DBb3JWv1iOZJ0w@mail.gmail.com>
References: <1456589909-2428-1-git-send-email-codekipper@gmail.com>
	<1456589909-2428-4-git-send-email-codekipper@gmail.com>
	<20160313215043.GJ8418@lukather>
Reply-To: codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCHNXO4F7MHBB4WNTO3QKGQE4EYPSTQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20160313215043.GJ8418@lukather>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Andrea Venturi <ennesimamail.av-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 13 March 2016 at 22:50, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> Hi,
>
> On Sat, Feb 27, 2016 at 05:18:27PM +0100, codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
>> From: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>
>> Add the SPDIF transceiver controller and clock to the A10 and
>> A20 dtsi.
>>
>> Signed-off-by: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/sun4i-a10.dtsi | 23 +++++++++++++++++++++++
>>  arch/arm/boot/dts/sun7i-a20.dtsi | 23 +++++++++++++++++++++++
>>  2 files changed, 46 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/sun4i-a10.dtsi b/arch/arm/boot/dts/sun4i-a10.dtsi
>> index 0483640..83d46b2 100644
>> --- a/arch/arm/boot/dts/sun4i-a10.dtsi
>> +++ b/arch/arm/boot/dts/sun4i-a10.dtsi
>> @@ -477,6 +477,17 @@
>>                       clock-output-names = "ir1";
>>               };
>>
>> +             spdif_clk: clk@01c200c0 {
>> +                     #clock-cells = <0>;
>> +                     compatible = "allwinner,sun4i-a10-mod1-clk";
>> +                     reg = <0x01c200c0 0x4>;
>> +                     clocks = <&pll2 SUN4I_A10_PLL2_8X>,
>> +                              <&pll2 SUN4I_A10_PLL2_4X>,
>> +                              <&pll2 SUN4I_A10_PLL2_2X>,
>> +                              <&pll2 SUN4I_A10_PLL2_1X>;
>> +                     clock-output-names = "spdif";
>> +             };
>> +
>>               usb_clk: clk@01c200cc {
>>                       #clock-cells = <1>;
>>                       #reset-cells = <1>;
>> @@ -1055,6 +1066,18 @@
>>                       status = "disabled";
>>               };
>>
>> +             spdif: spdif@01c21000 {
>> +                     #sound-dai-cells = <0>;
>> +                     compatible = "allwinner,sun4i-a10-spdif";
>> +                     reg = <0x01c21000 0x40>;
>
> It only takes 64 bytes?
Yep(just like the audio codec!)
http://linux-sunxi.org/SPDIF#SUNXI_SPDIF_DEFAULT_VALUES
>
>> +                     interrupts = <13>;
>> +                     clocks = <&apb0_gates 1>, <&spdif_clk>;
>> +                     clock-names = "apb", "spdif";
>> +                     dmas = <&dma 0 2>, <&dma 0 2>;
>
> Please use the defines here.
ACK...will resend.
Thanks,
CK
>
> Thanks!
> Maxime
>
> --
> Maxime Ripard, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
