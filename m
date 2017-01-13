From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: Re: [PATCH 2/5] clk: sunxi-ng: add support for V3s CCU
Date: Fri, 13 Jan 2017 12:36:47 +0800
Message-ID: <895011484282207@web8g.yandex.ru>
References: <20170112203149.VhtuR9dM@smtp3j.mail.yandex.net> <20170112174122.iqzrcyytfefqspwq@lukather>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBBYNS4HBQKGQEOSPQ4HA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170112174122.iqzrcyytfefqspwq@lukather>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "	linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "	linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "	linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "	linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
List-Id: devicetree@vger.kernel.org



13.01.2017, 01:41, "Maxime Ripard" <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>:
> On Fri, Jan 13, 2017 at 01:31:41AM +0800, Icenowy Zheng wrote:
>> =C2=A02017=E5=B9=B41=E6=9C=8813=E6=97=A5 01:19=E4=BA=8E Maxime Ripard <m=
axime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>=E5=86=99=E9=81=93=EF=BC=9A
>> =C2=A0>
>> =C2=A0> On Thu, Jan 12, 2017 at 03:44:53AM +0800, Icenowy Zheng wrote:
>> =C2=A0> >
>> =C2=A0> >
>> =C2=A0> > 12.01.2017, 03:40, "Icenowy Zheng" <icenowy-ymACFijhrKM@public.gmane.org>:
>> =C2=A0> > > 11.01.2017, 02:10, "Maxime Ripard" <maxime.ripard@free-elect=
rons.com>:
>> =C2=A0> > >> =C2=A0On Tue, Jan 03, 2017 at 11:16:26PM +0800, Icenowy Zhe=
ng wrote:
>> =C2=A0> > >>> =C2=A0=C2=A0V3s has a similar but cut-down CCU to H3.
>> =C2=A0> > >>>
>> =C2=A0> > >>> =C2=A0=C2=A0Add support for it.
>> =C2=A0> > >>>
>> =C2=A0> > >>> =C2=A0=C2=A0Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org=
>
>> =C2=A0> > >>
>> =C2=A0> > >> =C2=A0It looks like there's nothing different but the clock=
s that you
>> =C2=A0> > >> =C2=A0register with the H3, please just use the H3 driver.
>> =C2=A0> > >
>> =C2=A0> > > Nope.
>> =C2=A0> > >
>> =C2=A0> > > It has a different PLL (PLL_ISP) at different address, and s=
ome
>> =C2=A0> > > different muxes.
>> =C2=A0> >
>> =C2=A0> > Forgot to mention the missing of PLL_DE and related misses.
>> =C2=A0>
>> =C2=A0> Those are not conflicting, it's just a slightly different set of
>> =C2=A0> clocks.
>>
>> =C2=A0If saying so, we can have only one ccu driver, and make every ccu
>> =C2=A0register different set ;-)
>>
>> =C2=A0V3s itself is a totally different SoC with H3.
>>
>> =C2=A0The relationship of V3s and H3 can be farther than the relationshi=
p
>> =C2=A0of A33 and H3=F0=9F=98=83
>
> A33 and H3 are an entirely different story. The H3 and A33 have
> conflicting clocks (ie same clocks with different parameters). This is
> not your case.

I think V3s and H3 has also conflicting clocks, e.g. CLK_DE.

The mux of CLK_DE in V3s is PLL_PERIPHx2 and PLL_VIDEO, but on H3
it's PLL_PERIPHx2 and PLL_DE (V3s lacks PLL_DE).

(What I say that there's a PLL missing means that there will also be mux
changes... I think you can understand this... sorry.)

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
