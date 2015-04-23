From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 3/4] base/platform: Continue on insert_resource() error
Date: Thu, 23 Apr 2015 18:54:41 +0200
Message-ID: <20150423165439.GA2455@ulmo.nvidia.com>
References: <1429719261-18024-1-git-send-email-ricardo.ribalda@gmail.com>
 <1429719261-18024-4-git-send-email-ricardo.ribalda@gmail.com>
 <20150422164457.GI20701@google.com>
 <CAPybu_3Wfngh_gh_pa33dWF_nfUh0He1GKe26kJ49w-Sdn604Q@mail.gmail.com>
 <20150423132637.GK20701@google.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SLDf9lqlvOQaIe6s"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150423132637.GK20701-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Jakub Sitnicki <jsitnicki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Vivek Goyal <vgoyal-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Jiang Liu <jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mike Travis <travis-sJ/iWh9BUns@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--SLDf9lqlvOQaIe6s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 23, 2015 at 08:26:37AM -0500, Bjorn Helgaas wrote:
> On Thu, Apr 23, 2015 at 09:55:13AM +0200, Ricardo Ribalda Delgado wrote:
> > Hi Bjorn:
> >=20
> > On Wed, Apr 22, 2015 at 6:44 PM, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org> wr=
ote:
> >=20
> > > Usual style for referencing a commit is "(see 02bbde7849e6 ('Revert "=
of:
> > > use platform_device_add"'))".
> >=20
> > Do you make that reference manually or there is a magic git command
> > for printing it in that style?
>=20
> I used to do it mostly by hand, but thanks to your prompting, I fiddled
> around and came up with this alias:
>=20
> gsr is aliased to `git show -s --abbrev-commit --abbrev=3D12 --pretty=3Df=
ormat:"%h (\"%s\")%n"'

There's also git log --format=3Dfixes, though that includes the "Fixes: "
prefix. That works with git show as well.

Thierry

--SLDf9lqlvOQaIe6s
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVOSPMAAoJEN0jrNd/PrOh/d0QAKjybxruo4v/zDm4pbwGvzvY
eCsA7pCmQWzxMNYxeAXAqlO60xK4BAyoAAgHqBBHqwbCk9PN4EvWp5FzwlnMX4WN
aAfYFMaF8mVymvGEVgOfH7qmluSaIQ1pgWvPdHAYasHhbXvVuIynudX8EYM9BEc/
q4gkkEl8UpxHuB/xSJ4NLwQGBDuoFVX7P7Eifg03SGcjBAqNUEPvTLoUNGX2C3nT
dth35MalMOpmQer09cH/jocPgbR0iXCcQkgobT6N7FHsU65TDE4ZlChRVr9/5569
npjYM13lZU886E8vrn1D5znsNWQxgTJ41+xGqyKFGbulkZaoEqP0Yh9PP9nqo3+/
uPJkJKs2EXICEcB70T4Q0LyuB7LLTwemkQOpQM3afceGHDPGwDj129w4Bw/X/M+D
GQ38fOSsnJ4gpULaZOI+jzJURECVpXPLkgDBrzitKNjCc4EXl7uM51ytt1O+YyK/
9H0GwWD6QD7LRK1XPMynFZlw1J0tPHpPj8vsj12UihsZZ+DqCQqFK9TO/vc07Ovu
15OFeA7zxrSLEI8ewG8bzDK4wc7Vlb+48OLVhH9pkMAPEpC6tzM+9eoPuCmgRIMT
atOVOisCbJ3U65eGw7/18IZkJCEjQqbhFyv6xNOj+TpBHllAh2XEMhAQoZHY+ZGo
YpABqCf8opsRBWOBQdoS
=9j/s
-----END PGP SIGNATURE-----

--SLDf9lqlvOQaIe6s--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
