From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dts: bcm283x: Move arm-pmu out of soc node
Date: Mon, 26 Feb 2018 10:26:59 -0800
Message-ID: <87fu5nppxo.fsf@anholt.net>
References: <1519481722-22738-1-git-send-email-stefan.wahren@i2se.com>
 <1519481722-22738-3-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4158322138796800159=="
Return-path: <linux-rpi-kernel-bounces+glkr-linux-rpi-kernel=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1519481722-22738-3-git-send-email-stefan.wahren-eS4NqCHxEME@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rpi-kernel>,
 <mailto:linux-rpi-kernel-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rpi-kernel/>
List-Post: <mailto:linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rpi-kernel-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rpi-kernel>,
 <mailto:linux-rpi-kernel-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "linux-rpi-kernel" <linux-rpi-kernel-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rpi-kernel-bounces+glkr-linux-rpi-kernel=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============4158322138796800159==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org> writes:

> The ARM PMU doesn't have a reg address, so fix the following DTC warning
> (requires W=1):
> Node /soc/arm-pmu missing or empty reg/ranges property
>
> Signed-off-by: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>

These seem good to me, I justed wanted to be sure: Does the PMU still
probe when the node is at this level of the hierarchy?  If it does, then
these get my r-b.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlqUUXMACgkQtdYpNtH8
nujr6hAAsuX3E/vZb5CtnCiWuqYd+UygqEm6Tgeha+hk9HcMKe+FQoJyb+06aimo
keGXu605KgR83w+7vR3ItqSzMGxWSyyY9R4/zSRQa1DEQMWEWTkJ6cPpy69U6i1N
tFQhmHqItI+nvPKURa+itNGwrXDftESdFAnDNogT95OKyQGIEsMOy9p3RA/UQGIb
qhL57kLdzSZlQ9bYiWS43yxfPCHqQDb9g0It7/1ZY0Ib+TP+7tja9KIfPbGXJ5Ze
yQ/JqhrW9FnRAtgzRB2uYaz1wrvoPcB218lNpOgs/5hSvhH9529hQPpAMRdBYFzp
7/P5Rfvm66jqCwUmJQDMvXAh2Je96WtYfGpacCMpScplRAi87bUkv7FwD4wMsZhE
CEQwfRNxQ1im6kTX8J/K9HUVH99jEtyGhsVzBYd2rgAEtaAqJC50q616cMxM/oQi
Ms153Gxvb399CC7FisgzEYWETMjsEoVopcKzSqOw26lW4RsrDIzCaZL6gVEzLhzW
539Ryn9VUTYy8nQNvYlth/Ylbp6o418rWb/8du3qNX6abnjUITUSHLvK664FoW8S
N88YtqUI2Zeg6ED+vqTPjrxRmRtZcLvq3qG1In+dZJztJ5tmke5VBDGkdqqNuEuA
rJY5O93c8FvjWi6H28Whg3bRj8hLYRK7Zdy0WytUkTFLIcdKG0o=
=PkeU
-----END PGP SIGNATURE-----
--=-=-=--


--===============4158322138796800159==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-rpi-kernel mailing list
linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
http://lists.infradead.org/mailman/listinfo/linux-rpi-kernel

--===============4158322138796800159==--
