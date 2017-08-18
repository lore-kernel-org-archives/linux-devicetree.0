From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH 2/4] drivers: soc: sunxi: fix error
 processing on base address when claiming
Date: Fri, 18 Aug 2017 14:23:34 +0800
Message-ID: <94408FC0-D7F8-4050-936E-F350029DAB9F@aosc.io>
References: <20170809085627.32687-1-icenowy@aosc.io> <20170809085627.32687-3-icenowy@aosc.io> <CAGb2v67F6xUOE9sJsBgpOn2kRoG2S-aoWrtTsjON64o2pzeXjA@mail.gmail.com>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRB3MP3LGAKGQECLWL5TY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAGb2v67F6xUOE9sJsBgpOn2kRoG2S-aoWrtTsjON64o2pzeXjA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: wens-jdAy2FN1RRM@public.gmane.orgChen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org



=E4=BA=8E 2017=E5=B9=B48=E6=9C=8818=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=882:=
21:07, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> =E5=86=99=E5=88=B0:
>Hi,
>
>On Wed, Aug 9, 2017 at 4:56 PM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
>> When claiming SRAM, if the base is set to an error, it means that the
>> SRAM controller has been probed, but failed to remap the controller
>> memory zone. If the base is zero, thus the SRAM controller should be
>not
>> probed at all, and it should return -EPROBE_DEFER. However, currently
>we
>> returned -EPROBE_DEFER in the former situation, and ignored the
>latter
>> situation (which will lead to the kernel to panic).
>>
>> Fix the behavior on abnormal base address processing when claiming.
>
>Could you describe how you actually ran into this? The failure seems
>unlikely for a properly written device tree.

In fact it's possible, as the probe defering used to be broken.

On the A64 situation, the SRAM is referenced by the DE2 CCU driver, which w=
ill be probed very early -- before SRAM is probed, and the problem happens.

>
>Thanks
>ChenYu

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
