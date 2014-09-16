From: Felipe Balbi <balbi@ti.com>
Subject: Re: [Patch v9 1/3] usb: dwc3: qcom: Add device tree binding
Date: Tue, 16 Sep 2014 13:29:21 -0500
Message-ID: <20140916182920.GF19010@saruman.home>
References: <1410550088-8754-1-git-send-email-agross@codeaurora.org>
 <1410550088-8754-2-git-send-email-agross@codeaurora.org>
 <20140916181543.GA19101@usblab-sd-06.qualcomm.com>
Reply-To: balbi@ti.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9039060505831805718=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20140916181543.GA19101@usblab-sd-06.qualcomm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jack Pham <jackp@codeaurora.org>
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org, Bjorn Andersson <bjorn.andersson@sonymobile.com>, linux-arm-msm@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, Felipe Balbi <balbi@ti.com>, Kishon Vijay Abraham I <kishon@ti.com>, "Ivan T.
 Ivanov" <iivanov@mm-sol.com>, Andy Gross <agross@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============9039060505831805718==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GV0iVqYguTV4Q9ER"
Content-Disposition: inline

--GV0iVqYguTV4Q9ER
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Sep 16, 2014 at 11:15:43AM -0700, Jack Pham wrote:
> Hi Andy,
>=20
> On Fri, Sep 12, 2014 at 02:28:06PM -0500, Andy Gross wrote:
> > +Example device nodes:
> > +
> > +		hs_phy: phy@100f8800 {
> > +			compatible =3D "qcom,dwc3-hs-usb-phy";
> > +			reg =3D <0x100f8800 0x30>;
>=20
> Just wanted to point out that in our downstream code, the glue
> device/driver, i.e. "qcom,dwc3", does claim an entire register region
> that encompasses the same registers used by these PHYs. I noticed you're
> not adding a reg resource to the glue node below in this patchset. In
> order to allow multiple devices to use the overlapping regions, we avoid
> calling devm_ioremap_resource() and instead call devm_ioremap_nocache()
> directly which bypasses the request_mem_region() call, which I don't
> think is an entirely correct thing to do.
>=20
> On the other hand I'm trying to think of use cases on our other SOCs
> (MSM8974, APQ8084) where the glue actually would need access to the same
> or adjacent IO registers that couldn't just be handled directly by these
> PHY drivers. Should we accommodate for the potential of overlapping
> regions or should we just hold the line here and maybe only expose with
> finer granularity the registers that will actually be needed by the PHYs
> & glue respectively?

I prefer to keep things separated. Glue only needs to access whatever
belongs to glue. If a register related to PHY settings, it should be in
the PHY address space.

cheers

--=20
balbi

--GV0iVqYguTV4Q9ER
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUGIGAAAoJEIaOsuA1yqREFMMQAKzDm2voLdtaZavbPW0yaKtn
qnkPxiwaxNTqmG7glc/SYXcWftpgS4djTAbk+AVO5X3fqrVo+gI+oyrK8nMOxbgL
nTR9hGhQbVf+PB5XHPwpG0/Iw3SgWzyFmyqqHHrh33SSWO6FgMl7uAm8pUUVnZ/G
52LOwCNZKorymcZBvvVgghoqF+3eEI/YrjedaICSmZ5l/kdgvzY22p6G1YBPOyXH
y9rfBcyS6Lqx1/IyfBXiOS3METTSz2i6oLW7/GJo2m1/5nn1SqwgVtI7AnZVUoZu
+cUMhlluX/D/SxZoXiOglbN3g9yz7MDE75OjN6hvS3SS07sK9qfHRRs5UzlvfIo6
R/hGNu2arkXwCi+P3KZnwvYgm3KarXddLYa1T+Blq9OSDioo+CDzfAv00b2X8P+q
N9/MSHGeIFOpAuCoF62buSYvFur19AXu8cVI6tBAquitkeJgWp1CAWdmiE5r/rj4
5T0KScM7vCoi9x6M4VTGgPSHxzK3eZIh7FMru7/4u8we1DozsurbVtmlrvufCDgL
Egk/408apu+8Vi4qLDQDDEwfGtr3TKCAaZ8lfBH9MXSWs+nItVTLI8Hayd7Cl3xU
BQ99ikq0XeaROrtWuJI7UOzFFM0SIAyOE+bOi+w/9YsQH0cV6ubd33d7GJ+KDIp6
0UfHiOckTFbwzFGkLdIJ
=RdvM
-----END PGP SIGNATURE-----

--GV0iVqYguTV4Q9ER--


--===============9039060505831805718==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============9039060505831805718==--
