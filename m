From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] of/irq: do irq resolution in platform_get_irq
Date: Thu, 24 Apr 2014 20:42:08 +0200
Message-ID: <20140424184207.GC27443@ulmo>
References: <1398293861-7682-1-git-send-email-robherring2@gmail.com>
 <1398293861-7682-3-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hOcCNbCCxyk/YU74"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1398293861-7682-3-git-send-email-robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jean-Jacques Hiblot <jjhiblot-dLKeG7h1OhBDOHtkgc7UlQ@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--hOcCNbCCxyk/YU74
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2014 at 05:57:41PM -0500, Rob Herring wrote:
> From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>=20
> Currently we get the following kind of errors if we try to use interrupt
> phandles to irqchips that have not yet initialized:
>=20
> irq: no irq domain found for /ocp/pinmux@48002030 !
> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 1 at drivers/of/platform.c:171 of_device_alloc+0x144=
/0x184()
> Modules linked in:
> CPU: 0 PID: 1 Comm: swapper/0 Not tainted 3.12.0-00038-g42a9708 #1012
> (show_stack+0x14/0x1c)
> (dump_stack+0x6c/0xa0)
> (warn_slowpath_common+0x64/0x84)
> (warn_slowpath_null+0x1c/0x24)
> (of_device_alloc+0x144/0x184)
> (of_platform_device_create_pdata+0x44/0x9c)
> (of_platform_bus_create+0xd0/0x170)
> (of_platform_bus_create+0x12c/0x170)
> (of_platform_populate+0x60/0x98)
>=20
> This is because we're wrongly trying to populate resources that are not
> yet available. It's perfectly valid to create irqchips dynamically, so
> let's fix up the issue by resolving the interrupt resources when
> platform_get_irq is called.
>=20
> And then we also need to accept the fact that some irqdomains do not
> exist that early on, and only get initialized later on. So we can
> make the current WARN_ON into just into a pr_debug().
>=20
> We still attempt to populate irq resources when we create the devices.
> This allows current drivers which don't use platform_get_irq to continue
> to function. Once all drivers are fixed, this code can be removed.
>=20
> Suggested-by: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Signed-off-by: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
> ---
>  drivers/base/platform.c |  7 ++++++-
>  drivers/of/irq.c        | 26 ++++++++++++++++++++++++++
>  drivers/of/platform.c   |  4 +++-
>  include/linux/of_irq.h  |  7 ++++++-
>  4 files changed, 41 insertions(+), 3 deletions(-)

Hehe... that's largely what we already had back in January[0]. Glad to
see that people could finally agree on what to do about this.

Thierry

[0]: https://lkml.org/lkml/2014/1/8/240

--hOcCNbCCxyk/YU74
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTWVr/AAoJEN0jrNd/PrOhJtEP+wZj+Ee+vrblMdwiN2ok6fRy
nBcAZQrFEKykF+NDQU/GmSDAuDdaBMpMN0dzdbxPOj+glWbTMprVlaxfDFKVdjuU
onvbkrY/om3uLEWt++16l1q1vnpTznIBcSzSuZf8WgTzeMIt+oNivNlh1mnkFugW
WuKRYQ11kfcIcUImnCN1vpy99+hSrkmDazvYsn6s1SAF18dUBgIe+R2zl4wbb7lo
6RvJXj9d/FBJH1WJbCY7J3NwvfYz8zh3KY0kgTH5lRn+YoBKdGhTuP/4jAxainum
cLguksgtBhVlSNocEYxK8OasQO2iCfc52fq2/k4So18CLflw8HlGLAzC24eTfqta
uG6Vn1jhnFKSGhDzT5MAlsKZSBHuasEXMnzgHUdZskDj55swrFBlMIZY92nVpYFV
il8lW5NaWjO2G7BpdSNqN4SNDZazsgkeHhtBMtHRu4ieS61g6x2BvQfDdC0yukvB
6vsB/4SHACOLK8iaMTireksn8EKSjsFMVlrEwWuti5F3RRHt9Q9fwglxSGzNrkyl
KSjCT8wWv87amAVenHaa99ClbNCKUkZAOjkEbFhUZ7MCjC1q0niUtsDr+4il6QYy
nLVtfoC/IGpB8WCOSH6v4x9uCDBfC0bYntG2Zzq+XdAucRqsqElHgP3P+MqZwYAs
ayF/FEjG0ulvhWUr1ZVZ
=bXg4
-----END PGP SIGNATURE-----

--hOcCNbCCxyk/YU74--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
