From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 0/3] dwc2 patches to allow wakeup on Rockchip rk3288
Date: Mon, 6 Jul 2015 13:12:41 -0500
Message-ID: <20150706181241.GH20779@saruman.tx.rr.com>
References: <1435017144-2971-1-git-send-email-dianders@chromium.org>
 <20150706174838.GD20779@saruman.tx.rr.com>
 <CAD=FV=U4egHAPtUHc6Lvtfr+Uvad2YkBuW=wiTH1eg_XH_zz4w@mail.gmail.com>
Reply-To: balbi-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4534432670945666325=="
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <CAD=FV=U4egHAPtUHc6Lvtfr+Uvad2YkBuW=wiTH1eg_XH_zz4w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Petr Mladek <pmladek-AlSwsSmVLrQ@public.gmane.org>, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Pratyush Anand <pratyush.anand-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, lyz <lyz-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexandru Stan <amstan-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matthew Garrett <mjg59-JW9irJGTvgXQT0dZR+AlfA@public.gmane.org>, Robert Schlabbach <Robert.Schlabbach-hi6Y0CQ0nG0@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Zhuang Jin Can <jin.can.zhuang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Gregory Herrero <gregory.herrero>
List-Id: devicetree@vger.kernel.org

--===============4534432670945666325==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LYw3s/afESlflPpp"
Content-Disposition: inline

--LYw3s/afESlflPpp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 06, 2015 at 11:06:35AM -0700, Doug Anderson wrote:
> Felipe,
>=20
> On Mon, Jul 6, 2015 at 10:48 AM, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org> wrote:
> > On Mon, Jun 22, 2015 at 04:52:21PM -0700, Douglas Anderson wrote:
> >> This series of patches, together with
> >> <https://patchwork.kernel.org/patch/6652341/> from Chris Zhong and a
> >> dts change allow us to wake up from a USB device on rk3288 boards.
> >> The patches were tested on rk3288-jerry in the chromeos-3.14 kernel.
> >> The chromeos-3.14 kernel tested included a full set of dwc2 backports
> >> from upstream, so this is expected to function upstream once we get
> >> everything setup there.
> >>
> >>
> >> Douglas Anderson (3):
> >>   USB: Export usb_wakeup_enabled_descendants()
> >>   Documentation: dt-bindings: Add snps,need-phy-for-wake for dwc2 USB
> >
> > I didn't get 2/3 :-(
>=20
> Odd.  I'm happy to repost the series, but you were certainly on the
> "To" for the whole series.  You can see the Headers at
> <https://patchwork.kernel.org/patch/6658421/>
>=20
> ...please let me know if you'd like me to repost and we can hope the
> email system works better next time...

If you can, that would help me. Just make sure to Cc linux-usb on all
patches, since that's where I tend to get my patches from.

Thanks and sorry for the extra step resending this.

ps: dropping Paul Z as he's not in SNPS anymore

--=20
balbi

--LYw3s/afESlflPpp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVmsUZAAoJEIaOsuA1yqRE9RgP/i7daUsJRv8y6izIKUeYK0g4
g+mPtzm9i+ILnEmAdzcJFZ8xh+2xSjmfRG/qJCM9sM++T95k06DT7PqGno9urpRi
PpbC8Wa9yzYEe5Ujo+i0TGnvn6dEnilyweDNCC9SY3EKcqugNKtKZ7OlKPDNv6VM
6xjyaHJlszVsGrP/9KcQJmGca5O3W7yvj+Ckjr2jgq6n5W6QEqU6aWqzrM/vtros
fzBLZW00N31ZB1M0zNfbJC/BybFjEcNxqXNv6ZWgHiUbEGoxdOnQDYBd3WIBozsO
3yJv1O+Cv5IzYCxh3yizWfuweJQvC6UOH1d7Grp84vmMESWAfc0+93q3MScNOba+
8x5WHrRJDe0FH0uj+7mqP+gLWZCJS7GJrK2P4VrPyQ+Gs5SLeFqwzg6vr4fHK/mP
MiLklJRu9z+EG65qyXK6OYrl/nV11kZe/2ojL+sTdJ7afpWsqvRoinHyeEzp8YrH
3d5rsVsabYHfFPFKOnD25hYPL/K+yiimw/Jn4T9WFHEG8ZFcZGgsPkBV6elENgYu
JYjjivpUmGvvWKY74I0MxpeGf8nejoULli1os6bSvOPsj2X7dCMHoXrwggGIayTB
85AkQofmVng7NdVEUu6tE4e5xcwPFL5wlJmuYwTnmrPFHZiZdMEKAOtDwMD0rz0j
lj2XIPTtQprrKRU1PjS+
=+tcC
-----END PGP SIGNATURE-----

--LYw3s/afESlflPpp--


--===============4534432670945666325==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-rockchip mailing list
Linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
http://lists.infradead.org/mailman/listinfo/linux-rockchip

--===============4534432670945666325==--
