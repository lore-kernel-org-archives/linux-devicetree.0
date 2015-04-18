From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH v2 2/2] arch: arm: Show the serial number from devicetree
 in cpuinfo
Date: Sat, 18 Apr 2015 13:27:59 +0100
Message-ID: <20150418122758.GJ12732@n2100.arm.linux.org.uk>
References: <1429296235-14123-1-git-send-email-contact@paulk.fr>
 <1429296235-14123-2-git-send-email-contact@paulk.fr>
 <20150418091310.GI12732@n2100.arm.linux.org.uk>
 <1429350313.2424.1.camel@collins>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1429350313.2424.1.camel@collins>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans De Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Apr 18, 2015 at 11:45:13AM +0200, Paul Kocialkowski wrote:
> Le samedi 18 avril 2015 =E0 10:13 +0100, Russell King - ARM Linux a
> =E9crit :
> > Hi,
> >=20
> > On Fri, Apr 17, 2015 at 08:43:55PM +0200, Paul Kocialkowski wrote:
> > >  static int __init init_machine_late(void)
> > >  {
> > > +#ifdef CONFIG_OF
> > > +	unsigned long dt_root;
> > > +	int size;
> > > +
> > > +	dt_root =3D of_get_flat_dt_root();
> > > +
> > > +	/* Scan for serial number */
> > > +	system_serial =3D of_get_flat_dt_prop(dt_root, "serial-number",=
 &size);
> >=20
> > I was really hoping for:
> >=20
> > 	if (of_property_read_string(of_root, "serial-number", &system_seri=
al))
> > 		system_serial =3D NULL;
> >=20
> > here.  I can't see a reason to use the flattened DT at this point a=
s
> > we've already parsed it.
>=20
> Good point -- I'm not very used to using device-tree so I didn't thin=
k
> of it, thanks for mentioning it.
>=20
> At this point, I guess I can also add your Signed-Off-By to the patch=
=2E

No - Signed-off-by is to indicate the path by which it was committed
into the git tree, not for review, etc.

I'm assuming you'll be submitting this to my patch system eventually,
which means when I apply the patch, it'll have my S-o-b automatically
added.

--=20
=46TTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps u=
p
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
