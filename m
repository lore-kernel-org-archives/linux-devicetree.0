From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: st_fdma: Firmware filename in DT?
Date: Sat, 5 Sep 2015 11:25:43 +0200
Message-ID: <201509051125.43527.arnd@arndb.de>
References: <20150903144944.GC7093@griffinp-ThinkPad-X1-Carbon-2nd> <5E0DCAA5-DB90-4682-92F2-061A07FE973E@bsdimp.com> <CAL_Jsq+bw1TcXt0c8L4BSvwWK82L2cG-qdw369EkvxWe-5RXbQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq+bw1TcXt0c8L4BSvwWK82L2cG-qdw369EkvxWe-5RXbQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Warner Losh <imp-uzTCJ5RojNnQT0dZR+AlfA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Friday 04 September 2015, Rob Herring wrote:
> On Fri, Sep 4, 2015 at 9:27 AM, Warner Losh <imp-uzTCJ5RojNnQT0dZR+AlfA@public.gmane.org> wrote:
> >> On Sep 4, 2015, at 4:21 AM, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote=
:
> >>>>>> We could do it by parsing the node name e.g. fdma0-audio, or b=
y adding
> > FreeBSD would generally put these things in /boot/firmware and
> > it has a generalized mechanism to load the firmware at run time
> > that=E2=80=99s based on this. While the path names are flexible, ha=
ving
> > the firmware live in a central place is useful from an automation
> > point of view. Having just a name, and not a full path, enables
> > this policy, while still allowing others to have other policies.
> >
> > Linux distributions would be free to do whatever they wanted
> > and implement other policies than FreeBSD.
> >
> > So a property like this, with the semantics discussed, seems to
> > meet the OS independent test.
>=20
> Good. I'll await a binding to review...
>=20
> I would suggest "firmware-names" to be consistent with other naming
> convention and because their can be more than one (either at the same
> time or as fallback). It also leaves "firmware" available if we want
> to have phandle's to firmware embedded in the DT at some point later.

Having list of strings would certainly make this more flexible than
just a single string, for the same reason as taking the list of
compatible values as the base, so +1 for "firmware-names" over "firmwar=
e".

If we decide to create a proper binding for standardizing this, we
might also want to standardize inline firmware blobs. I've worked
with systems in the past that wanted to include a device firmware blob
in their system firmware, and that blob was not freely distributable
While nondistributable device firmware is not something we want to enco=
urage,
people are going to do it anyway and standardizing the method may be be=
tter
than not.

See drivers/net/ethernet/toshiba/spider_net.c for a particular example
I was thinking of. In this case, the system firmware can provide a blob
to the kernel driver in a propery, but the driver will first look at
the local file system for an updated image.

	Arnd.
