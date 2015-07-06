From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 0/3] dwc2 patches to allow wakeup on Rockchip rk3288
Date: Mon, 6 Jul 2015 12:48:38 -0500
Message-ID: <20150706174838.GD20779@saruman.tx.rr.com>
References: <1435017144-2971-1-git-send-email-dianders@chromium.org>
Reply-To: balbi-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4406327196233960582=="
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1435017144-2971-1-git-send-email-dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Petr Mladek <pmladek-AlSwsSmVLrQ@public.gmane.org>, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Pratyush Anand <pratyush.anand-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, lyz-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandru Stan <amstan-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matthew Garrett <mjg59-JW9irJGTvgXQT0dZR+AlfA@public.gmane.org>, Robert Schlabbach <Robert.Schlabbach-hi6Y0CQ0nG0@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Zhuang Jin Can <jin.can.zhuang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Gregory Herrero <gregory.herrero-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb@
List-Id: devicetree@vger.kernel.org

--===============4406327196233960582==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="M38YqGLZlgb6RLPS"
Content-Disposition: inline

--M38YqGLZlgb6RLPS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 22, 2015 at 04:52:21PM -0700, Douglas Anderson wrote:
> This series of patches, together with
> <https://patchwork.kernel.org/patch/6652341/> from Chris Zhong and a
> dts change allow us to wake up from a USB device on rk3288 boards.
> The patches were tested on rk3288-jerry in the chromeos-3.14 kernel.
> The chromeos-3.14 kernel tested included a full set of dwc2 backports
> from upstream, so this is expected to function upstream once we get
> everything setup there.
>=20
>=20
> Douglas Anderson (3):
>   USB: Export usb_wakeup_enabled_descendants()
>   Documentation: dt-bindings: Add snps,need-phy-for-wake for dwc2 USB

I didn't get 2/3 :-(

--=20
balbi

--M38YqGLZlgb6RLPS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVmr92AAoJEIaOsuA1yqREKuoQALOULNfJ8txhSHI7L3MCsQT0
A/osvYOhlN3d75hgD2s/TtaHhR2YyhKgEMqwPdmkyEIaJGKXnfyKMmNK9C6/V8l2
Odx5W6Qt3OUJ5GaXecK8FdgBpewJ2sUD6IdTHhKmDZlzAE4d1dh5KuZ9NNpyh7zo
k+ZBzXy6moxDlp1OLePWPcXQC3SYS6+sgQM13qXcfVuODYYy1JqVgxoUkC5SXz93
34RTIcuVEJmI4dfjhwJHHBHI8jylJc8+4jCzj3TE95X0A8x1sfLTRSRSKAadZJ26
6doaEx3blo+Nf1nq0svA2NTT+FgiaRLqJKvRTtkv6bXLbh0/huE+kmjELK1E9nN3
MobmHeExIAYVNSELt9VritRNmTkGhWybVdq8P+ElbdZBakNm3+P6go5VtotiipY3
vzzkhRR5EGRAoWuN/8rAqUkYuv0lH4n+ZUl9qrkFyTGmV2ZOYB4/UFbbFD99CAjI
xTGEd01t+lATyEdZhvdabFAj2zHnqHDYN+v8lG8pRRKFVRxoHl+tKwTWIsyiBLPt
v6E6PcxMgeTSZ3wcg00Cpx9MuQbWeyOQIoGgvHZ5Eu51knb6PO6he8Vmcs2JjRRb
1oiK+7LJAWuAROtOMTyGFxSh/3rMu8Dhm1clayhqQ0NPrsGcSJdMmIWDAVWEC2k2
0WexqwzFtOh5JN5YhajY
=cEP3
-----END PGP SIGNATURE-----

--M38YqGLZlgb6RLPS--


--===============4406327196233960582==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-rockchip mailing list
Linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
http://lists.infradead.org/mailman/listinfo/linux-rockchip

--===============4406327196233960582==--
