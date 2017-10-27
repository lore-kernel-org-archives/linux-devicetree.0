From: icenowy-h8G6r0blFSE@public.gmane.org
Subject: Re: [PATCH 1/2] dt-bindings: add binding for A64 DE2
 CCU with SRAM section
Date: Fri, 27 Oct 2017 22:33:29 +0800
Message-ID: <b8c770bdc7a0541b8d1179598d814b75@aosc.io>
References: <20171014122925.13220-1-icenowy@aosc.io>
 <20171016091136.b4rnckh2tfi26shx@flea.lan>
 <d62ac8b8ff9073b886ceaa9ce54e6903@aosc.io>
 <20171016120912.lxu7rikhffxsu5o4@flea.lan>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBO4HZXHQKGQEQW54ALY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20171016120912.lxu7rikhffxsu5o4-ZC1Zs529Oq4@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

=E5=9C=A8 2017-10-16 20:09=EF=BC=8CMaxime Ripard =E5=86=99=E9=81=93=EF=BC=
=9A
> On Mon, Oct 16, 2017 at 05:41:10PM +0800, icenowy-h8G6r0blFSE@public.gmane.org wrote:
>> =E5=9C=A8 2017-10-16 17:11=EF=BC=8CMaxime Ripard =E5=86=99=E9=81=93=EF=
=BC=9A
>> > On Sat, Oct 14, 2017 at 08:29:24PM +0800, Icenowy Zheng wrote:
>> > > A64's Display Engine 2.0 needs a section of SRAM (SRAM C) to be
>> > > claimed.
>> >
>> > Why?
>>=20
>> Allwinner didn't document this, but if the SRAM is not claimed, the
>> DE2 MMIO zone is totally not accessible.
>=20
> Not accessible how? It generates an abort when you access it? It
> returns 0?
>=20
>> It seems that Allwinner uses the SRAM C in the DE2 internally.
>=20
> Then shouldn't it be tied to all the DE2 devices then? So mixers
> too. Either way, this should be mentionned in your commit logs. How
> you're fixing things is much less interesting than why you're doing
> them. You can tell how you're doing them from your code already.

Yes I checked and when the SRAM is not claimed any part in DE2 memory
zone can't be accessed.

Should I also add the code that claims the SRAM in the mixer code? Or
just place the device tree property is enough? (As the mixers depend
on the DE2 CCU) Or just ignore this?

>=20
> Maxime
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
