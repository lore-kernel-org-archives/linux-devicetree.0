From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: PWM and backlight devices
Date: Tue, 6 Dec 2011 16:07:49 +0100
Message-ID: <20111206150749.GA13761@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0292005752607495949=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============0292005752607495949==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7AUc2qLy4jB3hD7Z"
Content-Disposition: inline


--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I'm working on adding support for a device which is booted from a device tree
only. Currently this gets me to a login prompt on a serial console and the
device is basically functional. However, the device also has a display with a
backlight that is controlled via a PWM (supplied by the SoC). If this was a
regular board it would be simple to implement this via the pwm-backlight
driver.

Unfortunately, the pwm-backlight driver doesn't have device tree support yet
and I'm not sure how to best implement it. As far as I can see, I would first
need to have some way of representing a PWM device in the DT that I could
reference in the pwm-backlight device node and I would need to add actual DT
support to pwm-backlight. Implementing support for the data passed in the
platform data should be rather straightforward, but I don't see how the
callback functions could be represented in the DT.

For some setups it would probably be enough to just specify the used PWM, but
other boards fiddle with some GPIOs in the callbacks and I guess that could
be represented by adding a "gpios" property with a list of pins that need to
be toggled for example when the backlight power is enabled/disabled.

Has anyone done something similar yet? Am I even on the right track here?

Thierry

--7AUc2qLy4jB3hD7Z
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEUEARECAAYFAk7eL8UACgkQZ+BJyKLjJp8gcQCfYB2a6gV78wP5/uyBrLwxdmwr
L+UAljv1j2z+HkZHmMO/1xZw4BDviJA=
=JpfD
-----END PGP SIGNATURE-----

--7AUc2qLy4jB3hD7Z--

--===============0292005752607495949==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============0292005752607495949==--
