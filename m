From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: Re: Re: [RFC PATCH] ARM: dts: sun8i: add simplefb node
 for H3
Date: Thu, 01 Dec 2016 10:02:59 +0800
Message-ID: <1777251480557779@web18m.yandex.ru>
References: <20161130220324.3Kg4VPEw@smtp1m.mail.yandex.net>
	 <2717236.xBNAaGdqdc@jernej-laptop>
	 <20161130203724.a390595df0199ed19069f91d@free.fr>
	 <185067972.ij8nq5Ea6J@jernej-laptop> <20161130205233.mwfqlfuqg4cefink@lukather>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBBVMJ73AQKGQEFH443HY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20161130205233.mwfqlfuqg4cefink@lukather>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, =?utf-8?B?SmVybmVqIMWga3JhYmVj?= <jernej.skrabec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "wens-jdAy2FN1RRM@public.gmane.org" <wens-jdAy2FN1RRM@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org



01.12.2016, 04:52, "Maxime Ripard" <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>:
> On Wed, Nov 30, 2016 at 09:41:26PM +0100, Jernej =C5=A0krabec wrote:
>> =C2=A0> > > > The only
>> =C2=A0> > > > code left from you is for DE2. HDMI stuff is basically cop=
ied from
>> =C2=A0> > > > Rockhip
>> =C2=A0> > > > driver (including EDID reading), TCON code is now reverted=
 to the same
>> =C2=A0> > > > as
>> =C2=A0> > > > it is in sunxi_display.c. I think it is worth to take a lo=
ok at EDID
>> =C2=A0> > > > code
>> =C2=A0> > > > and compare it.
>> =C2=A0> > >
>> =C2=A0> > > So is the TCON of DE 2.0 identical to the original TCON?
>> =C2=A0> > >
>> =C2=A0> > > If so, we should reuse sun4i-tcon ...
>> =C2=A0> >
>> =C2=A0> > Well, TCON is splitted in two parts (two base addresses), one =
for HDMI and
>> =C2=A0> > one for TV. However, register offsets are same as before, so I=
 guess
>> =C2=A0> > driver reusage make sense. I think that there are few addition=
al
>> =C2=A0> > registers, but they can be ignored for simplefb.
>> =C2=A0>
>> =C2=A0> The TCON1 of the H3 is not usable (no ckock). Analog TV has its =
own
>> =C2=A0> clock and I/O area.
>> =C2=A0>
>>
>> =C2=A0True, H3 user manual can be misleading sometimes. But this doesn't=
 change the
>> =C2=A0fact that TCON0 has same register offsets with same meaning.
>
> Then yes, we should definitely share the drivers too. So, in the end,
> the only thing that is actually new is the display-engine?

And HDMI PHY on H3 ;-)

In my opinion, we should just put sun8i-de2-drm related code into drivers/g=
pu/drm/sun4i/ .
(Or rename the directory to sunxi)

>
> Maxime
>
> --
> Maxime Ripard, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
