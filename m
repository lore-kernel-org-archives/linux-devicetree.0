From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH v5 1/6] spmi: Linux driver framework for SPMI
Date: Sat, 15 Feb 2014 17:47:48 -0600
Message-ID: <20140215234748.GA26494@saruman.home>
References: <1391468739-20987-1-git-send-email-joshc@codeaurora.org>
 <1391468739-20987-2-git-send-email-joshc@codeaurora.org>
Reply-To: <balbi@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wRRV7LY7NUeQGEoC"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1391468739-20987-2-git-send-email-joshc@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Josh Cartwright <joshc@codeaurora.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, Sagar Dharia <sdharia@codeaurora.org>, Gilad Avidov <gavidov@codeaurora.org>, Michael Bohan <mbohan@codeaurora.org>, Kenneth Heitke <kheitke@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

--wRRV7LY7NUeQGEoC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Feb 03, 2014 at 05:05:33PM -0600, Josh Cartwright wrote:

[ snip ]

> +#ifdef CONFIG_PM_RUNTIME
> +static int spmi_runtime_suspend(struct device *dev)
> +{
> +	struct spmi_device *sdev =3D to_spmi_device(dev);
> +	int err;
> +
> +	err =3D pm_generic_runtime_suspend(dev);
> +	if (err)
> +		return err;
> +
> +	return spmi_command_sleep(sdev);

shouldn't this too calls be swapped ? I mean, some pm_runtime
implementations could be gating clocks at the driver's
->runtime_suspend() callback.

--=20
balbi

--wRRV7LY7NUeQGEoC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJS//ykAAoJEIaOsuA1yqREcpcQAKwE8hajiRzBBbFwMxszTE5w
zMwRFR3vNP3fQfgbwPJrx3M5c+cUzISkW4Jr+SoBCifiYi2Das+h5/9bdCzbqMav
4rihjDIN+yGaxHEYWwjZ4WnMKp2zf6UOYayjIvXTKQ7WkB6hFoe3gIwIlWJ3cOLl
cQGGCvuc/W2Bj/u7tkPcAnhwu9/NKNJw3Zh7LRDFTyaJFddgu/+5sV/h41B6E847
2Cj2s3DyF9SUbnDFywi3GhGaqYE58r9L5VhOqlXZAtDodkff0ZX5bK2eEaCQ9lQP
Ou4hNtNUHmIfn5p/vLysuUyRveGl/L6ItM3VvgJH0sCJCyq8enBIXAfVt5eX7vU3
i3Wrr/1ECgGaIFoBVovuhxLR8A3A8iDFFM5MrnLB8s8NLfnRa1hsodYvTTHqKZW2
n6rocO4HaFRP0Yo4JHqaQM4THEvrOvZK7gxWu9DubsZKsDT5Fh+YRNSy8/rE2OrS
L5OnpWsZXoKP+KUFlWKen3u8hwViMf7VJK8EhVFemOH89rabrRfpJzuhA/Up6U5m
yZausLt02cGjnY6T4nHhl111hEcWKcIEe8O+ZMs9+tugZKN0YpCYivg2hg5cuWwA
NQUZKvjnDsTB+zK/Y/x9nnmz8AlPRgvVuNLwzaAtMq3wMYux5FMIWmnECPAg4v+j
hyvAKdriNGeJuPrXIQj2
=92Za
-----END PGP SIGNATURE-----

--wRRV7LY7NUeQGEoC--
