From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH v3 2/2] arch: arm: Show the serial number from devicetree
 in cpuinfo
Date: Wed, 6 May 2015 10:01:05 +0100
Message-ID: <20150506090105.GC2067@n2100.arm.linux.org.uk>
References: <1429351135-11842-1-git-send-email-contact@paulk.fr>
 <1429351135-11842-2-git-send-email-contact@paulk.fr>
 <CAL_JsqKkw7n5p1ZH345BeKkyU=GKDrhaLef__0ET7t90Cm0Eog@mail.gmail.com>
 <1430145747.3081.5.camel@collins>
 <20150428160910.GE12732@n2100.arm.linux.org.uk>
 <1430581582.5339.0.camel@collins>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1430581582.5339.0.camel@collins>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans De Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, May 02, 2015 at 05:46:22PM +0200, Paul Kocialkowski wrote:
> Le mardi 28 avril 2015 =E0 17:09 +0100, Russell King - ARM Linux a =E9=
crit :
> > On Mon, Apr 27, 2015 at 04:42:27PM +0200, Paul Kocialkowski wrote:
> > > Well, of_property_read_string is only defined when CONFIG_OF is s=
et
> > > (base.c is always built in drivers/of but the directory is only i=
ncluded
> > > when CONFIG_OF is set).
> > >=20
> > > Of course, on ARM, we now expect that it is the case, but it seem=
s like
> > > good practice to check for it, since it could theoretically be di=
sabled.
> >=20
> > That is _not_ "is the case" - there are a number of non-OF platform=
s...
> > including some which will probably never be converted.
>=20
> Right, so I think v4 should be fine too, given the empty functions in
> case CONFIG_OF is not set.

Yes, can you please put them in my patch system so we can get this
applied?

Rob - does your ack apply to the v4 patch?

Thanks.

--=20
=46TTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps u=
p
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
