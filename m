From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun8i: r40/v40: rewrite BPi M2
 Berry DTS to rebase on M2 Ultra
Date: Thu, 26 Jul 2018 20:47:34 +0800
Message-ID: <BA51039A-02DD-42C2-A7A9-E1B866074CA6@aosc.io>
References: <20180724163655.61365-1-icenowy@aosc.io> <20180726124119.dwne2sncws2p3sdi@flea>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRB7UF47NAKGQEWDT6TTA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180726124119.dwne2sncws2p3sdi@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



=E4=BA=8E 2018=E5=B9=B47=E6=9C=8826=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=888:=
41:19, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> =E5=86=99=E5=88=B0:
>On Wed, Jul 25, 2018 at 12:36:55AM +0800, Icenowy Zheng wrote:
>> Banana Pi designs the BPi M2 Berry board to be software compatible
>with
>> BPi M2 Ultra,
>
>Do you have a reference for this?

See [1], it says "BPI-M2U and BPI-M2 Berry share the same image".

[1] http://www.banana-pi.org/download.html

>
>> so it's based on M2 Ultra with some function cuts, including:
>>=20
>> - 2048MiB DRAM -> 1024MiB (this should be proceed by the bootloader);
>> - dropped a LED;
>> - dropped eMMC;
>> - dropped USB2 and connect USB1 to a 4-port HUB.
>
>Is it the exhaustive list?

Sorry, but I forgot one thing -- LiPo battery connector.

The list can be examined with [2], except LED difference.

[2] https://bananapi.gitbooks.io/bpi-m2-ultra-open-source-single-board-comp=
uter/content/

>
>I'm a bit reluctant to merge that kind of patches usually, since that
>would also imply that each time someone will commit something to the
>M2-Ultra, it would automatically apply to the M2-Berry, without any
>easy way to tell and / or test.
>
>Maxime

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
