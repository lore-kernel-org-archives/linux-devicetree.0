From: Ben Hutchings <ben-/+tVBieCtBitmTQ+vhA3Yw@public.gmane.org>
Subject: Re: [Ksummit-2013-discuss] ARM topic: Is DT on ARM the solution, or
 is there something better?
Date: Thu, 24 Oct 2013 00:29:23 +0100
Message-ID: <1382570963.6315.48.camel@deadeye.wl.decadent.org.uk>
References: <alpine.LFD.2.03.1310201911190.1951@syhkavp.arg>
	 <52658EBC.8020800@wwwdotorg.org>
	 <alpine.LFD.2.03.1310211632460.1951@syhkavp.arg>
	 <20131022093923.GC15640@ulmo.nvidia.com> <20131022150426.GF29341@beef>
	 <20131022171346.GE4061@obsidianresearch.com>
	 <20131023080630.GA14413@netboy>
	 <20131023172955.GA17145@obsidianresearch.com>
	 <20131023180108.GA23728@roeck-us.net>
	 <20131023182502.GC32563@obsidianresearch.com>
	 <20131023183041.GH5208@netboy>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-h0BBCjMHoDo1aSa9ogkV"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131023183041.GH5208@netboy>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Cochran <richardcochran-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--=-h0BBCjMHoDo1aSa9ogkV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2013-10-23 at 20:30 +0200, Richard Cochran wrote:
> On Wed, Oct 23, 2013 at 12:25:02PM -0600, Jason Gunthorpe wrote:
>=20
> > What they want is one vmlinux/z, and a package of 'stuff' that they
> > can assemble a boot image for all hardware out of.
>=20
> ...
>=20
> > On ARM the package of 'stuff' can very reasonably include dtb. Distro
> > scripts can package modules+DTB+vmlinuz into something the bootloader
> > can understand. (The next pain point will be to standardize that)
> >=20
> > The DTB doesn't have to be 'outside' the distro/kernel to give users a
> > seamless upgrade experience.
>=20
> How can a distro possibly provide me a DTB?
>=20
> They don't know what hardware I am using. Only I know that.

This is what Debian runs when installing a kernel on most ARM systems:
http://sources.debian.net/src/flash-kernel/3.11/functions

It starts by looking up the machine ID (in procfs, but may be overridden
because some board vendors don't set it correctly).  If the machine is
supported using FDT then there is an associated DTB file which will have
been installed with the kernel.  The script copies/appends this to the
appropriate place for the boot loader.

Ben.

--=20
Ben Hutchings
Teamwork is essential - it allows you to blame someone else.

--=-h0BBCjMHoDo1aSa9ogkV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIVAwUAUmhb0+e/yOyVhhEJAQomwA//awXPBquOyzYEU17WqOOSRtkl6p+JMrJ6
8DgK7Xea1VS19hSlkLX6+bsCm+8KeLVtIqqPdIr3goYCvzwFpxXJNjf+fCugw7U0
FhuemBYF+vy5j6Fccy98BFU6aYGeRh5P4Ryi7WbAC+DQTFD0IL3dXFrt3T3xZ518
dczX2C7F2AkvmJK2AjhCv81MSuO+QS5zsTUwAXkqOFbTOmIMAdIbpQDdTJ34ZJKq
Fxs0vFTemqD78AmIhTDuPnAezQzBxjIyj65cFK2P2SowQbIhBB1OXMV1SEkdljp6
IGJmC70iTW6ya1a6oRA/h52nBa+MVgKVuAXQH6X6EdPuyfrPHd3DVdWvGVT3+yrn
458rask/CUuUQasJRZDA4//GHcuT4ag4AuRQ4so4LCcmQTCMPwoZ7LvVRcOHwX7s
o8GK2CgxWxflgGjb6DabeC3P1yOX5UGV2aVpDvSHFKMzuFvvRGx4ZS8atPGKeLED
fXE16VAWs08puhkLJgicssIjWSDTMwERuI1xQ69zNAShm0XIr4blfynbdKaLv0EW
soDuy8U6MlbUnbuI/JlNFAQHzygcDni6meuAzIWMngOduYrpXgNtGdolH+QvsFWl
RyvM0A1cjdOvrTCai1XxVKlH17bt0k+4rmBlegN/5K/6MFH/9a+6TS8FtPWXED6g
S7IpU2Dmwws=
=J9sB
-----END PGP SIGNATURE-----

--=-h0BBCjMHoDo1aSa9ogkV--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
