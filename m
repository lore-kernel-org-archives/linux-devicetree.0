From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Ksummit-2013-discuss] ARM topic: Is DT on ARM the solution, or
 is there something better?
Date: Thu, 24 Oct 2013 16:47:44 +0200
Message-ID: <20131024144743.GB9044@ulmo.nvidia.com>
References: <20131024095232.27BBCC4039D@trevor.secretlab.ca>
 <1382614439.6040.16.camel@sakura.staff.proxad.net>
 <1382615278.8522.72.camel@shinybook.infradead.org>
 <20131024122346.GD11296@ulmo.nvidia.com>
 <1382619655.6040.52.camel@sakura.staff.proxad.net>
 <516bfc7f9366ff3ef9187c36dd160888.squirrel@twosheds.infradead.org>
 <1382621431.6040.66.camel@sakura.staff.proxad.net>
 <af289ef3cc80be8de26274ba1f598d54.squirrel@twosheds.infradead.org>
 <20131024141955.GB25061@ulmo.nvidia.com>
 <20131024143251.GA4096@netboy>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WYTEVAkct0FjGQmd"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131024143251.GA4096@netboy>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Cochran <richardcochran-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, mbizon-MmRyKUhfbQ9GWvitb5QawA@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--WYTEVAkct0FjGQmd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2013 at 04:32:52PM +0200, Richard Cochran wrote:
> On Thu, Oct 24, 2013 at 04:19:56PM +0200, Thierry Reding wrote:
> >=20
> > While I agree that many of these screwups shouldn't have happened in the
> > first place, it's nothing that we were prepared for two years ago. At
> > some point everyone agreed that DT was the way forward, so DT is what we
> > did. Nobody said anything about stable ABI back then, so nobody cared.
>=20
> The idea of a device tree has not changed. I guess the arm crowd
> jumped on the DT bandwagon with no clue what it was about.

Yes, that's what I'm saying. I've played my part in it, too. Perhaps it
was obvious from the beginning and I just didn't notice, but no document
about DT that I read mentioned anything about ABI stability and such.
Then again I reckon none of the other DT implementations can really be
compared to Linux in terms of diversity and perhaps even number of
contributors. So perhaps a lot of the things that we now run into were
implied but never explicitly mentioned. Or I and most of the others
missed them.

> > We treated DT the same way we had treated platform data before, which
> > has inevitable lead to the current mess, which is only slightly better
> > than what we used to have.
>=20
> So, are you saying that arm/dt is a failure?

Yeah, I think it is in some regards. But I wouldn't go as far as to call
it a total failure. I still think we can make it work, and even
reasonably well. We just need to fix our process. Perhaps we need to
start by documenting things better, such as what you can and can't do to
stable bindings and point people to that documentation.

Furthermore I don't think anyone has proposed a better alternative. ACPI
or UEFI have been mentioned, but are they really any superior? From what
I can tell they have all the same problems that we now face with DT as
well, so we might as well just stick with DT.

Thierry

--WYTEVAkct0FjGQmd
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSaTMPAAoJEN0jrNd/PrOhOSAP/R80dy4PCa7yY4rEW9TAMkNo
URtZa8n9jTf6x9AgkeVPZvcqQjFHPNVQBoU/m24dQqelBGm2k0RUpycgOJfuti1x
HztXkEfCfLRrmgFmZONKFr1bXFL1X8UA8n25jo+Lv6CTjXv1gtqNg3vG2M2+/QRL
wu6eUUZ6nZYcnJiOmJLlWB6xZlrmtOft1dHTBUzOmO92MwON4xhDwP9REyAwBv6A
hqPjcY3DBu0DpTabrkw8h3GtIlz7eRMMrAA+Zk6by765X9xQ7afS/iKS55Ghnvp0
ELoUIH1ZjLGThcLDxU5wVspAG5LruuQD6tThljPywIfg/JLsADCmYqagDgr2j8CN
Rc9okGlpcXV5tZ0Kq4unXZDWBLlb8iL77jTsJo7kwXtJt7khEY+Lqa4zmj7icy1U
dsnsJAC6BZQR7CaprxcIwRHqaHkfo+9TMPASSO9Yv44vtrzOCPfF6J0HA50rJpHd
V8f50XNoV5jvaxsd2w/D0WAYIYX6tuGeGC2fsnvLxUrwBytaHimVBlgwzTBycYA8
BHSecXAeeT9p0DBMhgprqDSGm+L/ZitJe64eNryXfuYna9r4oiFk1wwXicl2uWL3
3ox+RNbsuQ9hby5q0AvIb0nBuP7WCk+dA4qQCtt4wf3Y02OEUJp6eJdEd/VEqA8u
K1oNngbvsWgvRd9Lo5gW
=bqAV
-----END PGP SIGNATURE-----

--WYTEVAkct0FjGQmd--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
