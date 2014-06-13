From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv7 2/5] mailbox: Introduce framework for mailbox
Date: Fri, 13 Jun 2014 21:40:27 +0100
Message-ID: <20140613204027.GC5099@sirena.org.uk>
References: <1402592317-7043-1-git-send-email-jaswinder.singh@linaro.org>
 <1402592479-7244-1-git-send-email-jaswinder.singh@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5T0u2c3sp8KJuygI"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1402592479-7244-1-git-send-email-jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, bjorn-UYDU3/A3LUY@public.gmane.org, ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, s-anna-l0cyMroinI0@public.gmane.org, loic.pallardy-qxv4g6HH51o@public.gmane.org, lftan.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org, courtney.cavin-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, joshc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, ks.giri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--5T0u2c3sp8KJuygI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 12, 2014 at 10:31:19PM +0530, Jassi Brar wrote:

A couple of tiny nits, I'll send followup patches for these.

> +bool mbox_client_peek_data(struct mbox_chan *chan)
> +{
> +	if (chan->mbox->ops->peek_data)
> +		return chan->mbox->ops->peek_data(chan);
> +
> +	return false;
> +}
> +EXPORT_SYMBOL_GPL(mbox_client_peek_data);

This isn't declared in the header to allow users to use it.

> +struct mbox_chan *mbox_request_channel(const struct mbox_client *cl)

> +	spin_lock_irqsave(&chan->lock, flags);
> +	chan->msg_free = 0;
> +	chan->msg_count = 0;
> +	chan->active_req = NULL;
> +	chan->cl = cl;

chan->cl is non-const but cl is const so this assignment is invalid.

--5T0u2c3sp8KJuygI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTm2GxAAoJELSic+t+oim9MRMQAIjwPm+6lqwQRhpeQVvnqPIa
xFnyXQEKyd5fx1s0N3mIvVGero3xmdpzSB7rDegKFVdpKxQhSCp3J+FBwDFySyYu
l+iwQx1fiWPGwtHHeTEEI+1HJf4FDXBaqf6Z0p/VyDNkYy4vYGmmzS+2ZaFqY38U
siPUJ7r75ANFgWG+XNyzgcpZIQc5zrMx5DWIWIIuBXJrAlIAgz/fCwUOKAG8vTLH
BrXpbTQRyKfDA+az4JSa7z26veznHscT/9WbUVdlKhepxcP3rSVrrVcnJJcjzvYk
gjlNAz4nHteq4Kv4NITpyKtfpK5vsuT6ZFouq8d2xb1yAIRFEZ9CzjePCfeSkJ11
4e+5XF9yqzFG7bAuCYnkzeCAp8VT9Os0BkeGuhm+sXmqhChtn4pDYKFuSt+4YW8y
LAyxooVy/0z/vSmN0OkT/uwRnQgXbgstGwo9MJ+uS1ziEABjD/HmpZoqwU9V/8t8
JFlK0E/QEltf5aLw4p9mTBbqLaLVtkYO4EVBDDW6lLh4Cqcke9OShtCPpi8al8cf
dmBzlvHp/z0yaAhS1bY72B0+zPVwWk8KHE22gzDhq6M+KQLBQT/aB6s3kSftgIjF
Na29tSV1IlRaAsOr2plIV7/atHS/wAgkVhJZvkwaMWmPXPKsRx5nVLgVP42XuZLR
aANBmh9MBs+bWA7h0F6i
=YKrX
-----END PGP SIGNATURE-----

--5T0u2c3sp8KJuygI--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
