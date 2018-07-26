From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun8i: r40/v40: rewrite BPi M2
 Berry DTS to rebase on M2 Ultra
Date: Thu, 26 Jul 2018 23:26:19 +0800
Message-ID: <7A9506F1-7052-4801-B735-296370EBBA7C@aosc.io>
References: <20180724163655.61365-1-icenowy@aosc.io> <20180726124119.dwne2sncws2p3sdi@flea> <BA51039A-02DD-42C2-A7A9-E1B866074CA6@aosc.io> <20180726152427.cjji4ymwfjifja4q@flea>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBQGQ47NAKGQEVC3JSBQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180726152427.cjji4ymwfjifja4q@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



=E4=BA=8E 2018=E5=B9=B47=E6=9C=8826=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=8811=
:24:27, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> =E5=86=99=E5=88=B0:
>On Thu, Jul 26, 2018 at 08:47:34PM +0800, Icenowy Zheng wrote:
>>=20
>>=20
>> =E4=BA=8E 2018=E5=B9=B47=E6=9C=8826=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=
=888:41:19, Maxime Ripard
><maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> =E5=86=99=E5=88=B0:
>> >On Wed, Jul 25, 2018 at 12:36:55AM +0800, Icenowy Zheng wrote:
>> >> Banana Pi designs the BPi M2 Berry board to be software compatible
>> >with
>> >> BPi M2 Ultra,
>> >
>> >Do you have a reference for this?
>>=20
>> See [1], it says "BPI-M2U and BPI-M2 Berry share the same image".
>>=20
>> [1] http://www.banana-pi.org/download.html
>
>Debian supports different SoC from different vendor using the same
>image, so it's not really a good argument to share the device tree. I
>mean, you can even boot an H3 to a shell using an A33 device tree.

Please note that the vendor image is fully functional BSP
image, neither a function limited one nor one without
HW configuration.

>
>Maxime

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
