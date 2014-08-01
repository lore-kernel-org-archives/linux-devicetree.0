From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv10 2/4] mailbox: Introduce framework for mailbox
Date: Fri, 1 Aug 2014 19:37:48 +0100
Message-ID: <20140801183748.GL30458@sirena.org.uk>
References: <1406896194-4667-1-git-send-email-jaswinder.singh@linaro.org>
 <1406896296-4863-1-git-send-email-jaswinder.singh@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mg8cdxx98+SFDaXr"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1406896296-4863-1-git-send-email-jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ks.giri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, courtney.cavin-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org, mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org, lftan.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, loic.pallardy-qxv4g6HH51o@public.gmane.org, s-anna-l0cyMroinI0@public.gmane.org, ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, bjorn-UYDU3/A3LUY@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mollie.wu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, t.takinishi-+CUm20s59erQFUHtdCDX3A@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org


--mg8cdxx98+SFDaXr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 01, 2014 at 06:01:36PM +0530, Jassi Brar wrote:
> Introduce common framework for client/protocol drivers and
> controller drivers of Inter-Processor-Communication (IPC).
>=20
> Client driver developers should have a look at
>  include/linux/mailbox_client.h to understand the part of
> the API exposed to client drivers.
> Similarly controller driver developers should have a look
> at include/linux/mailbox_controller.h

Reviewed-by: Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

One very minor thing:

> +	t =3D add_to_rbuf(chan, mssg);
> +	if (t < 0) {
> +		pr_err("Try increasing MBOX_TX_QUEUE_LEN\n");
> +		return t;
> +	}

In this and the other error messages it's probably worth doing something
like a dev_ print with the device in the mbox_controller - if there's
more than one mailbox controller in the system it may well make
someone's life easier to get a hint about which one is running into
trouble.  Similarly if there were some identification for the channels
that might be useful to display that (perhaps add a name field people
can initialize if they like in the struct?).

This is clearly not a blocker for merge though.

--mg8cdxx98+SFDaXr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT2954AAoJELSic+t+oim9zPEP+QEM6LF0SOtWziD/zBcqBiEj
HIzqg85pz3BKkSmCjer36r7xkIgbyBm9ZR2IwPWaArtTZKzbV/04m1vsHnuX93Tj
EiX+oa3c04YDFyBbOZkdAptgh2K3H+SDeDtmYRYUenvdJsMUDcQAqYe1fNK/qqZI
zl2LQSvOT7IZmkqXB7YM2ztCiqMs1kXTKGmKy+19p5n/1HmoLBhY/uGSmAxL3Nh2
q3NVXQ7RBLKvBKEUUPEP13zTqca1I6qFReAW5YIIF2KabhLlyZM/THn4ZMRxuPn5
Q6KYBEE2eRcxrJlvZVehhRw5Tf/G8FGMJIebIKiFwLdqidY1hB82p2HX7DwRQtlz
Jk18m53o749KaO+wqVDLgSTPbupd2hUSwOpWe2OTWHVkicznWXBlzqeVD2kUHEcw
kG5gWZMVq8n+0+YzpQmI/evUJknlG6snoRHkakxJT3rtiU3m3G2Gp/y18RShLCtg
zNWPROgit8+tK8Fn6Xpdc1f0tAd4jnCgg3fEvLs5G3kZlUx+nkN4So+f8cncSXlK
COsO28D0n4JMCJ7TdbEjgNzPsYOvr8JNuxl67OKi7q/Gx/HwcewLxDLs3c60kb/5
XC5BcZvw34c9oQQ5OE0piflx5uQph66HE2Gwd4OnQGqZUlTROGd2fh0Uyq+n/WYF
bfg6k9fuJjyIQfVU8h0x
=AQq1
-----END PGP SIGNATURE-----

--mg8cdxx98+SFDaXr--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
