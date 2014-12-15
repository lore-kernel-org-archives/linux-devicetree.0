From: "Kuankuan.Yang" <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [RFC PATCH 0/6] Those patches is used for dw_hdmi audio.
Date: Mon, 15 Dec 2014 20:46:22 +0800
Message-ID: <548ED81E.2000108@rock-chips.com>
References: <1418609494-15820-1-git-send-email-ykk@rock-chips.com> <20141215103830.GD11285@n2100.arm.linux.org.uk> <548EC9E1.5040206@rock-chips.com> <548ECB66.70004@rock-chips.com> <20141215120013.GH11285@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141215120013.GH11285-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Sonny Rao <sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Xu Jianqun <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, =?UTF-8?B?U3TDqXBoYW5lIE1hcmNoZXNpbg==?= <marcheu-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Brian Austin <brian.austin-jGc1dHjMKG3QT0dZR+AlfA@public.gmane.org>, Bard Liao <bardliao-Rasf1IRRPZFBDgjK7y7TUQ@public.gmane.org>, Max Filippov <jcmvbkbc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Oder Chiou <oder_chiou-Rasf1IRRPZFBDgjK7y7TUQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Sean Cross <xobs-nXMMniAx+RbQT0dZR+AlfA@public.gmane.org>, Grant Likely <grant.likely@linar>
List-Id: devicetree@vger.kernel.org

Hi Russell:

I got an idea that we can split the pcm dma part code out, after that w=
e=20
can chose the buffer transmit way (AUD_DMA or I2S).
In that way i will make another i2s driver to transmit those buffer, bu=
t=20
in the mainline kernel already lanched an rockchip i2s driver
(rockchip_i2s.c), so seams it maybe not an good way.

what's your opinion, russell?

Best Regards.

=E5=9C=A8 2014=E5=B9=B412=E6=9C=8815=E6=97=A5 20:00, Russell King - ARM=
 Linux =E5=86=99=E9=81=93:
> On Mon, Dec 15, 2014 at 07:52:06PM +0800, Kuankuan.Yang wrote:
>>   Hi Russell:
>>
>>       thks for your replay, actually you also have send me those
>> dw-hdmi-audio.c patches, and I also agree it's an beautiful way to m=
ake
>> hdmi-audio works. Beside,
>>   I try to reuse it into our platform, and actually the system have =
created
>> the DW_HDMI sound card successfully, but i cannot play any sound  wi=
th this
>> sound card.
>>       After dump the registers, I found the part of "Audio DMA Regis=
ters"
>> cannot write and always read with 0x00.  So I searching the document
>> "Designware Core
>>   HDMI Transmitter Controller Databook", and found that  "Audio DMA
>> Registers" only present when the hardware configuration parameter AU=
DIO_IF
>> is set to
>>   AHBAUDDMA. Than I communicate with our IC colleagues, they told me=
 that our
>> cpu rk3288 only support two way to  transmit audio data( I2S & SPDIF=
 ), in
>> that
>> way we do not support AHB_DMA, it's very sad, and this it why i give=
 up this
>> way, also it's my bad that i should replay to u first in the before =
mail.
> Okay, that means there is some work to be done to figure out how to
> support this correctly so that both the iMX and Rockchip code can
> co-exist together in the mainline kernel - that means we _both_ need
> to work together on this problem _before_ this code gets merged, so
> that we have a common approach between the two code bases.
>
> I really don't want to end up in another cocked up situation like
> what happened with the Dove audio, where it became politically
> impossible for the SolidRun platform to be properly supported by
> mainline kernels.
>


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
