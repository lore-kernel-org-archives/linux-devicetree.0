From: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v3 1/2] video: ARM CLCD: Add DT support
Date: Wed, 18 Sep 2013 17:39:23 +0100
Message-ID: <1379522363.9244.12.camel@hornet>
References: <1379351934-25415-1-git-send-email-pawel.moll@arm.com>
	 <52376180.1090001@wwwdotorg.org> <1379435799.9205.16.camel@hornet>
	 <5238CBE9.2060800@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5238CBE9.2060800-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd.bergmann-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sylwester Nawrocki <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2013-09-17 at 22:38 +0100, Stephen Warren wrote:
> >>> +Optional properties:
> >>> +
> >>> +- arm,pl11x,framebuffer-base: a pair of two values, address and =
size,
> >>> +				defining the framebuffer to be used;
> >>> +				to be used only if it is *not*
> >>> +				part of normal memory, as described
> >>> +				in /memory node
> >>
> >> If the framebuffer is part of /memory, what happens then? Is the a=
ddress
> >> not fixed (so the HW isn't yet set up) and hence a driver should
> >> allocate it?
> >=20
> > Yes, if it wants to display anything :-) And as this is a normal an=
d
> > expected behaviour, I don't think it deserves a note in the
> > documentation. I'm open to any suggestions that would make the word=
ing
> > above emphasize the "weirdness" of situations requiring the propert=
y.
>=20
> Perhaps:
>=20
> A pair of two values, address and size, defining the framebuffer to b=
e
> used. If not present, the framebuffer may be located anywhere in memo=
ry.

Works with me, thanks!

On Tue, 2013-09-17 at 22:34 +0100, Stephen Warren wrote:
> > On Tue, 2013-09-17 at 17:36 +0100, Pawel Moll wrote:
> >> On Mon, 2013-09-16 at 20:52 +0100, Stephen Warren wrote:
> >>>> +- arm,pl11x,panel-data-pads: array of 24 cells, each of them de=
scribing
> >>>> +				a function of one of the CLD pads,
> >>>> +				starting from 0 up to 23; each pad can
> >>>> +				be described by one of the following values:
> >>>> +	- 0: reserved (not connected)
> >>>> +	- 0x100-0x107: color upper STN panel data 0 to 7
> >>> ...
> >>>
> >>> I assume those are the raw values that go into the HW?
> >=20
> > No, they can be considered "labels", defining the way pads are used
> > (wired). Then, basing on this information, the driver is configurin=
g the
> > cell, eg. selecting STN or TFT mode (thus switching the output betw=
een
> > panel formatter and raw RGB data source).
>=20
> Oh, why not just use the raw values from the HW registers for this?

How do you mean? Based on the the way the "LCD data" lines are wired up=
,
the driver has to decide whether to select STN (LCDControl &=3D ~(1<<5)=
)
or TFT mode (LCDControl |=3D 1<<5), then figures out what memory pixel
formats are possible (based on this will set LCDControl[3..1] in
runtime, depending on the mode selected by the user). There isn't a
separate register as such configuring output pads. It's just the way
they can used depends on the way they're wired up.

Pawe=C5=82


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
