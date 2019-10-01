From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH 0/3] Pine64+ specific hacks for RTL8211E
 Ethernet PHY
Date: Wed, 02 Oct 2019 00:31:25 +0800
Message-ID: <D1124458-D5CB-4AFF-B106-C6EA1A98100F@aosc.io>
References: <20191001082912.12905-1-icenowy@aosc.io> <20191001.090651.796983023328992596.davem@davemloft.net> <2CCD0856-433E-4602-A079-9F7F5F2E00D6@aosc.io> <20191001.093000.372726574458067639.davem@davemloft.net>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBM77ZXWAKGQEGMSSFCY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20191001.093000.372726574458067639.davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mripard-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org



=E4=BA=8E 2019=E5=B9=B410=E6=9C=882=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=8812=
:30:00, David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org> =E5=86=99=E5=88=B0:
>From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>Date: Wed, 02 Oct 2019 00:08:39 +0800
>
>>=20
>>=20
>> =E4=BA=8E 2019=E5=B9=B410=E6=9C=882=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=
=8812:06:51, David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
>=E5=86=99=E5=88=B0:
>>>From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>>>Date: Tue,  1 Oct 2019 16:29:09 +0800
>>>
>>>> There're some Pine64+ boards known to have broken RTL8211E chips,
>and
>>>> a hack is given by Pine64+, which is said to be from Realtek.
>>>>=20
>>>> This patchset adds the hack.
>>>>=20
>>>> The hack is taken from U-Boot, and it contains magic numbers
>without
>>>> any document.
>>>
>>>Please contact Realtek and try to get an explanation about this.
>>=20
>> Sorry, but Realtek never shows any idea to add more infomation about
>this.
>>=20
>> These hacks had existed and worked for years.
>
>Have you actually tried to communicate with an appropriate contact
>yourself?
>
>If not, I am asking you to do so.

I have tried to ask via TL Lim from Pine64, because I have no way
to communicate directly to Realtek. However TL cannot get anything
more from Realtek.

>
>_______________________________________________
>linux-arm-kernel mailing list
>linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--=20
=E4=BD=BF=E7=94=A8 K-9 Mail =E5=8F=91=E9=80=81=E8=87=AA=E6=88=91=E7=9A=84An=
droid=E8=AE=BE=E5=A4=87=E3=80=82

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
To view this discussion on the web, visit https://groups.google.com/d/msgid=
/linux-sunxi/D1124458-D5CB-4AFF-B106-C6EA1A98100F%40aosc.io.
