From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH v8 3/3] phy: Add Qualcomm DWC3 HS/SS PHY driver
Date: Fri, 12 Sep 2014 12:50:39 -0500
Message-ID: <20140912175039.GH8567@saruman.home>
References: <1410542986-24419-1-git-send-email-agross@codeaurora.org>
 <1410542986-24419-4-git-send-email-agross@codeaurora.org>
Reply-To: balbi@ti.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3266108396328903916=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1410542986-24419-4-git-send-email-agross@codeaurora.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andy Gross <agross@codeaurora.org>
Cc: devicetree@vger.kernel.org, Jack Pham <jackp@codeaurora.org>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Felipe Balbi <balbi@ti.com>, Kishon Vijay Abraham I <kishon@ti.com>, "Ivan T. Ivanov" <iivanov@mm-sol.com>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============3266108396328903916==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8/UBlNHSEJa6utmr"
Content-Disposition: inline

--8/UBlNHSEJa6utmr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Sep 12, 2014 at 12:29:46PM -0500, Andy Gross wrote:
> This patch adds a new driver for the Qualcomm USB 3.0 PHY that exists on =
some
> Qualcomm platforms.  This driver uses the generic PHY framework and will
> interact with the DWC3 controller.
>=20
> Signed-off-by: Andy Gross <agross@codeaurora.org>

Kishon, this looks good to my eyes. It has no direct dependency with
dwc3 glue layer. Can you still grab this for v3.18 merge window ?


Reviewed-by: Felipe Balbi <balbi@ti.com>
Acked-by: Felipe Balbi <balbi@ti.com>

cheers

--=20
balbi

--8/UBlNHSEJa6utmr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUEzJvAAoJEIaOsuA1yqRElxYP/i1b2ui1IiVqjPvaEgIdY4DK
xPuA5LQzOVe3crpXEGjrC4OWVkvIBXq3sEXc4swe+A5F8Tq7iY+vJLbEjBMWdQcu
piXnYsyzGetxuMV0/B/B6bh92k+wzicG4egVwg/HJwSIQrdErkCY77ZS1IQ/US+V
4I1fehnXd+SHxpLQjBnVTtLZbbfnQU59KpqtgMaFVOmBFmUp7h5gUKJTcWIYv6JO
bsruKcFoLRn/vQwt5hIFrSqoL8lZ8yy4DBRtkAeDhmTWEJTZOW9lnzidqqoLkDcG
zSjAVVuJz8HfKUthXO79FnITyoNDDkTWVhvucbuSKoMtiRFHlnNPL8aWxdgi6P+W
it0eZ0IHp3EGD7AI6btqAsjr0U4HAPb4ZJfJX6iswjB0kaOvnM1717QNz3RKwqTz
Sih9FYs+CnTHWXbQ4wkWFr2VjnnkPnDm14Meyig8L93a2yvFK0b/lR8Hez/UDG1J
+R+JHcZS4vOKhdDviAjznlCv6/U/p+Jz5odk37gLas0mNpk51bFTvrFX23uT43XK
DNs3mSHjPTWG3IggfQHfSPz3wffHxe/kCGbP+XsqXCQpY/vlnD8cTomOARoU20rS
iylP/PBDSxhO8Bn80pPmseNQyZ2fCxUD7+hHSqjZEnHqxZLZF4du5DDiDEidK2wd
wKyd/7gu4EOGc+20MavL
=N+hf
-----END PGP SIGNATURE-----

--8/UBlNHSEJa6utmr--


--===============3266108396328903916==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============3266108396328903916==--
