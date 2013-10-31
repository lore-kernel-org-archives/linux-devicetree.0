From: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCHv4] video: backlight: gpio-backlight: Add DT support.
Date: Fri, 01 Nov 2013 08:37:23 +0900
Message-ID: <001e01ced692$267a6d90$736f48b0$%han@samsung.com>
References: <20131019104555.GI18477@ns203013.ovh.net>
 <1382346813-8449-1-git-send-email-denis@eukrea.com>
 <20131022045833.GB17512@ns203013.ovh.net>
 <20131022072307.GA8681@ulmo.nvidia.com>
 <20131022153445.GD17512@ns203013.ovh.net> <20131022200141.GA8037@mithrandir>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20131022200141.GA8037@mithrandir>
Content-language: ko
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Thierry Reding' <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, 'Jean-Christophe PLAGNIOL-VILLARD' <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Cc: 'Denis Carikli' <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, 'Mark Rutland' <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, 'Ian Campbell' <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, 'Eric B??nard' <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, 'Pawel Moll' <pawel.moll-5wv7dgnIgG8@public.gmane.org>, 'Stephen Warren' <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, 'Rob Herring' <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, 'Richard Purdie' <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, 'Laurent Pinchart' <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, 'Sascha Hauer' <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, 'Lothar Wa??mann' <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>, 'Jingoo Han' <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wednesday, October 23, 2013 5:02 AM, Thierry Reding wrote:
> On Tue, Oct 22, 2013 at 05:34:45PM +0200, Jean-Christophe PLAGNIOL-VI=
LLARD wrote:
> > On 09:23 Tue 22 Oct     , Thierry Reding wrote:
> > > On Tue, Oct 22, 2013 at 06:58:33AM +0200, Jean-Christophe PLAGNIO=
L-VILLARD wrote:
> > > > On 11:13 Mon 21 Oct     , Denis Carikli wrote:
> > > > > Cc: Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>
> > > > > Cc: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> > > > > Cc: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
> > > > > Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> > > > > Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> > > > > Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> > > > > Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> > > > > Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
> > > > > Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > > > > Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > > > > Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> > > > > Cc: Lothar Wa=C3=9Fmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
> > > > > Cc: Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
> > > > > Cc: Eric B=C3=A9nard <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
> > > > > Signed-off-by: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
> > > > > ---
> > > > > ChangeLog v3->v4:
> > > > > - The default-brightness property is now optional, it default=
s to 1 if not set.
> > > > by default we set OFF not ON
> > > >
> > > > do not actiate driver or properti by default you can not known =
to consequence
> > > > on the hw
> > >
> > > Turning on a backlight by default is what pretty much every backl=
ight
> > > driver does. I personally think that's the wrong default, I even =
tried
> > > to get some discussion started recently about how we could change=
 this.
> > > However, given that this has been the case for possibly as long a=
s the
> > > subsystem has existed, suddenly changing it might cause quite a f=
ew of
> > > our users to boot the new kernel and not see their display come u=
p. As
> > > with any other ABI, this isn't something we can just change witho=
ut a
> > > very good migration path.
> >
> > I'm sorry but the blacklight descibe in DT have nothing to do with =
the common
> > pratice that the current driver have today
>=20
> That's not at all what I said. What I said was that the majority of
> backlight drivers currently default to turning the backlight on when
> probed. Therefore I think it would be consistent if this driver did t=
he
> same.
>=20
> I also said that I don't think it's a very good default, but at the s=
ame
> time we can't just go and change the default behaviour at will becaus=
e
> people may rely on it.

I agree with your opinion.
But, I can't decide how to change it.

>=20
> > put on by default if wrong specially without the property define. E=
ven put it
> > on by default it wrong as the bootloader may have set it already fo=
r splash
> > screen and to avoid glitch the drivers need to detect this.
>=20
> I agree that would be preferable, but I don't know of any way to dete=
ct
> what value the bootloader set a GPIO to. The GPIO API requires that y=
ou
> call gpio_direction_output(), and that requires a value parameter whi=
ch
> will be used as the output level of the GPIO.

Jean-Christophe's point is right.

We may need to discuss 'the way to detect what value the bootloader
set a GPIO to'.

> > For me this should not even be a property but handled by the driver=
 them
> > selves in C.
>=20
> Agreed. There has been some discussion recently about whether devicet=
ree
> should be extended (or supplemented) to allow defining behaviour as w=
ell
> (in addition to just hardware). But that's not immediately relevant h=
ere
> at this time.

Agreed.

Best regards,
Jingoo Han

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
