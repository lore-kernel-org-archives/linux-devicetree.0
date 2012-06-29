From: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH V2] MXS: Add DT binding support into stmp3xxx-rtc
Date: Fri, 29 Jun 2012 13:32:09 +0200
Message-ID: <4FED9239.5050805@pengutronix.de>
References: <1339181804-22822-1-git-send-email-marex@denx.de>
 <20120625043711.GA18156@S2101-09.ap.freescale.net>
 <4FED8CA1.5000800@pengutronix.de>
 <20120629113047.GD29197@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6849498895997310568=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120629113047.GD29197-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--===============6849498895997310568==
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig51AA8EFB8078D7BB0AB4CE2C"

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig51AA8EFB8078D7BB0AB4CE2C
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 06/29/2012 01:30 PM, Shawn Guo wrote:
> On Fri, Jun 29, 2012 at 01:08:17PM +0200, Marc Kleine-Budde wrote:
>> On 06/25/2012 06:37 AM, Shawn Guo wrote:
>>> On Fri, Jun 08, 2012 at 08:56:44PM +0200, Marek Vasut wrote:
>>>> Add simple binding for the stmp3xxx-rtc.
>>>>
>>>> Signed-off-by: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
>>>> Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>
>>>
>>> Hi Alessandro,
>>>
>>> The patch has some changes on arch/arm/boot/dts/imx28.dtsi, and also =
we
>>> need the patch to convert some board files over to device tree.  May =
I
>>> have your ack to queue the patch on my tree?
>>
>> The interrupt numbers are not as the driver expects them..
>>
> Right.  I sent a v3 fixing it.

Oh, I missed that.

> http://article.gmane.org/gmane.linux.drivers.devicetree/17133

Sorry for the noise,
Marc

--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--------------enig51AA8EFB8078D7BB0AB4CE2C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk/tkjkACgkQjTAFq1RaXHMVPgCeJGoUzsUI9Zs5yCncnSRceUbT
9BwAn0saOQ9xFPtQ4qoBi8SuQoSvenlI
=kas7
-----END PGP SIGNATURE-----

--------------enig51AA8EFB8078D7BB0AB4CE2C--

--===============6849498895997310568==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============6849498895997310568==--
