From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v4 00/10] Add PWM framework and device tree support.
Date: Thu, 15 Mar 2012 07:41:24 +0100
Message-ID: <20120315064124.GA20502@avionic-0098.mockup.avionic-design.de>
References: <1331740593-10807-1-git-send-email-thierry.reding@avionic-design.de>
 <ADE657CA350FB648AAC2C43247A983F0020695DB5858@AUSP01VMBX24.collaborationhost.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5568633371844536629=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <ADE657CA350FB648AAC2C43247A983F0020695DB5858-gaq956PjLg32KbjnnMDalRurcAul1UnsRrxOEX5GOmysTnJN9+BGXg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: H Hartley Sweeten <hartleys-3FF4nKcrg1dE2c76skzGb0EOCMrvLtNR@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Ryan Mallon <rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============5568633371844536629==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YiEDa0DAkWCtVeE4"
Content-Disposition: inline


--YiEDa0DAkWCtVeE4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* H Hartley Sweeten wrote:
> Are you planning on adding a sysfs interface for generic userspace access
> to the PWM devices?

I wasn't planning to, but really only because I have no need for it. You
could of course add one yourself.

> Anyway, I would be happy to convert the current driver to the new framework
> and get it out of drivers/misc and into a proper location. But, before I can do
> that, I need to be able to control the PWM from userspace somehow.

You should probably coordinate with Sascha Hauer who I think already has most
(if not all) of the PWM drivers converted to his first version of the
framework and said he was going to rebase them on top of this series.

> Maybe an interface similar to the one gpiolib provides with CONFIG_GPIO_SYSFS?

I think the most challenging part will be figuring out how to export PWM
devices via sysfs on a per-chip basis. Since the goal of the series is to
eventually get rid of the global namespace, using an export file like gpiolib
won't work in the long run. Perhaps something like the following would:

	/sys/class/pwm/
		pwmchipX/
			export
			unexport
			pwmY/
				label
				duty
				period

That way you get a reference to the device associated with a PWM chip and you
can use the new pwm_request_from_device() function to request and export the
PWM device.

Again, I have no direct use for this and you probably know the requirements
better than me so it's probably better if you add the interface. I'm happy to
review patches, though.

Thierry

--YiEDa0DAkWCtVeE4
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAk9hjxQACgkQZ+BJyKLjJp/NIQCbBAUdV2/lrw+YZOnjPgNas0zQ
PiQAnjA95Zwjr9BcOlCtorHeZPE4NecU
=cqO3
-----END PGP SIGNATURE-----

--YiEDa0DAkWCtVeE4--

--===============5568633371844536629==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============5568633371844536629==--
