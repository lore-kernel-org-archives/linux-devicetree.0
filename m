From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 1/4] phy: sun4i-usb: support PHY0 on H3 in
 MUSB mode
Date: Wed, 18 Jan 2017 04:09:32 +0800
Message-ID: <CAGb2v67kYtrTdw9YMS7wvRa=2MWYJ=BEc9SmUOds7hNYZKOz9g@mail.gmail.com>
References: <20170116191449.50397-1-icenowy@aosc.xyz> <20170116191449.50397-2-icenowy@aosc.xyz>
 <20170117080611.tn7s7ddj2csqr27m@lukather> <3866431484672228@web20j.yandex.ru>
 <20170117200658.gcrcxeanthdtwg26@lukather>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBFHU7HBQKGQEMN7K5XA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170117200658.gcrcxeanthdtwg26@lukather>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Bin Liu <b-liu-l0cyMroinI0@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Wed, Jan 18, 2017 at 4:06 AM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> On Wed, Jan 18, 2017 at 12:57:08AM +0800, Icenowy Zheng wrote:
>>
>>
>> 17.01.2017, 16:06, "Maxime Ripard" <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>:
>> > On Tue, Jan 17, 2017 at 03:14:46AM +0800, Icenowy Zheng wrote:
>> >>  The PHY0 on H3 can be wired either to MUSB controller or OHCI/EHCI
>> >>  controller.
>> >>
>> >>  The original driver wired it to OHCI/EHCI controller; however, as the
>> >>  code to use PHY0 as OHCI/EHCI is missing, it makes the PHY fully
>> >>  unusable.
>> >>
>> >>  Rename the register (according to its function and the name in BSP
>> >>  driver), and remove the code which wires the PHY0 to OHCI/EHCI, as MUSB
>> >>  can support both peripheral and host mode (although the host mode of
>> >>  MUSB is buggy).
>> >
>> > Can you elaborate on that? What's wrong with it?
>>
>> The configuration is at bit 0 of register 0x20 in PHY.
>>
>> When the PHY is reseted, it defaults as MUSB mode.
>>
>> However, the original author of the H3 PHY code seems to be lack of
>> this knowledge (He named it PHY_UNK_H3), and changed the PHY to HCI
>> mode.
>>
>> I just removed the code that wires it to HCI mode, thus it will work
>> in MUSB mode, with my sun8i-h3-musb patch.
>
> I have no idea what you mean by MUSB mode.
>
> Do you mean that the previous code was only working in host mode, and
> now it only works in peripheral?

>From what I understand, with the H3, Allwinner has put a mux
in front of the MUSB controller. The mux can send the USB data
to/from the MUSB controller, or a standard EHCI/OHCI pair.
This register controls said mux.

This means we can use a proper USB host for host mode,
instead of the limited support in MUSB.

ChenYu

>
> Maxime
>
> --
> Maxime Ripard, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
