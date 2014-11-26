From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 4/5] ARM: dts: sun6i: Add sun6i-a31s.dtsi
Date: Wed, 26 Nov 2014 10:05:11 +0100
Message-ID: <547597C7.5070005@redhat.com>
References: <1416747283-13489-1-git-send-email-hdegoede@redhat.com> <1416747283-13489-5-git-send-email-hdegoede@redhat.com> <20141125181829.GC25249@lukather> <CAGb2v64=M37i0WVBbjOOWCrfP5tcHMr6yE+C6rPiy-sV7__qFQ@mail.gmail.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Return-path: <linux-sunxi+bncBDRZXY4CYYORBTVP22RQKGQE2E4OSOQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <CAGb2v64=M37i0WVBbjOOWCrfP5tcHMr6yE+C6rPiy-sV7__qFQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 11/26/2014 12:45 AM, Chen-Yu Tsai wrote:
> On Wed, Nov 26, 2014 at 2:18 AM, Maxime Ripard

<snip>

>>> +             ahb1_gates: clk@01c20060 {
>>> +                     #clock-cells = <1>;
>>> +                     compatible = "allwinner,sun6i-a31-ahb1-gates-clk";
>>> +                     reg = <0x01c20060 0x8>;
>>> +                     clocks = <&ahb1>;
>>> +                     clock-output-names = "ahb1_mipidsi", "ahb1_ss",
>>> +                                     "ahb1_dma", "ahb1_mmc0", "ahb1_mmc1",
>>> +                                     "ahb1_mmc2", "ahb1_mmc3", "ahb1_nand1",
>>> +                                     "ahb1_nand0", "ahb1_sdram",
>>> +                                     "ahb1_gmac", "ahb1_ts", "ahb1_hstimer",
>>> +                                     "ahb1_spi0", "ahb1_spi1", "ahb1_spi2",
>>> +                                     "ahb1_spi3", "ahb1_otg", "ahb1_ehci0",
>>> +                                     "ahb1_ehci1", "ahb1_ohci0",
>>> +                                     "ahb1_ohci1", "ahb1_ohci2", "ahb1_ve",
>>> +                                     "ahb1_lcd0", "ahb1_lcd1", "ahb1_csi",
>>> +                                     "ahb1_hdmi", "ahb1_de0", "ahb1_de1",
>>> +                                     "ahb1_fe0", "ahb1_fe1", "ahb1_mp",
>>> +                                     "ahb1_gpu", "ahb1_deu0", "ahb1_deu1",
>>> +                                     "ahb1_drc0", "ahb1_drc1";
>>> +             };
>>
>> Are the gates really identical?
>>
>> As in not even stripped down?
>
> According to the user manuals, the AHB1 gates on the A31s don't have
> GMAC (or EMAC in the manual) and MIPI DSI listed. Though it seems
> a lot of A31s hardware out there actually use GMAC.

Hmm, interesting I was focussing on the ohci2 gate when comparing them as
the ohci2 is not listed in the pinmux.

The GMAC clock gate definitely actually is there, as I've an A31s based board
with a working GMAC.

Also Allwinner has confirmed to me that the A31 and A31s are the same die, so
there is no reason to differentiate between the 2 at this level. Either we do
no differentiation at all, or only at the pinmux level to reflect that certain
pins are simply just not there.

My vote goes to differentiating at the pinmux level.

Regards,

Hans
