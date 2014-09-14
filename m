From: Felipe Balbi <balbi@ti.com>
Subject: Re: [Patch v9 3/3] phy: Add Qualcomm DWC3 HS/SS PHY driver
Date: Sat, 13 Sep 2014 21:24:52 -0500
Message-ID: <20140914022452.GA16652@saruman.home>
References: <1410550088-8754-1-git-send-email-agross@codeaurora.org>
 <1410550088-8754-4-git-send-email-agross@codeaurora.org>
 <5413E829.8020804@ti.com>
Reply-To: balbi@ti.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0921756718265377133=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5413E829.8020804@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: devicetree@vger.kernel.org, Jack Pham <jackp@codeaurora.org>, linux-usb@vger.kernel.org, Bjorn Andersson <bjorn.andersson@sonymobile.com>, linux-arm-msm@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, Felipe Balbi <balbi@ti.com>, "Ivan T. Ivanov" <iivanov@mm-sol.com>, Andy Gross <agross@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============0921756718265377133==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MGYHOYXEY6WxJCY8"
Content-Disposition: inline

--MGYHOYXEY6WxJCY8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Sep 13, 2014 at 12:16:01PM +0530, Kishon Vijay Abraham I wrote:
> On Saturday 13 September 2014 12:58 AM, Andy Gross wrote:
> > This patch adds a new driver for the Qualcomm USB 3.0 PHY that exists o=
n some
> > Qualcomm platforms.  This driver uses the generic PHY framework and will
> > interact with the DWC3 controller.
>=20
> Do you have dt documentation for this driver?

see patch 1

> > +static inline void qcom_dwc3_phy_write_readback(
> > +	struct qcom_dwc3_usb_phy *phy_dwc3, u32 offset,
> > +	const u32 mask, u32 val)
> > +{
> > +	u32 write_val, tmp =3D readl(phy_dwc3->base + offset);
> > +
> > +	tmp &=3D ~mask;		/* retain other bits */
> > +	write_val =3D tmp | val;
> > +
> > +	writel(write_val, phy_dwc3->base + offset);
> > +
> > +	/* Read back to see if val was written */
>=20
> Does it fail sometime? I'm not sure if this should be present in the
> driver since this looks more of a debug code.

this was mentioned before. Silicon bug.

> > +	writel_relaxed(data | SSUSB_CTRL_SS_PHY_RESET,
> > +		phy_dwc3->base + SSUSB_PHY_CTRL_REG);
> > +	usleep_range(2000, 2200);
>=20
> use msleep here..

why ? usleep_range() gives the scheduler oportunity to group timers.

--=20
balbi

--MGYHOYXEY6WxJCY8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUFPx0AAoJEIaOsuA1yqRE+9wP/jgUkSQfawiG2UAtz29uFiRk
8ukQVJjYHMDnklLr0IXYHFUKiBxLxycDwBZBW1gciwiabJAyAFu1sovWGLJ0mJmG
F1v/NnYThwC6cpEzMi0qtw8FXT6N3QJ7oGFFLqqV4Sw4WKbSocnKq0jXfwc1PqMH
VTTCpV2hgcQzwiNvx0CQ/kpTHExtwDKxFsfcXBUR6xbtYRY8duv4TsoY7k8rdUnC
cW9eaVXfhgj6cdKYaobH45t26BVx/l2TKeCO9HazaOn4PjvFSA0nr3nkOyqYE9Hz
yNjBNofOd1LRJM+O/QXOGRF6KjRq+V0HxvkGbgAworlfOrgWKhcMUKZjKjwSSU5a
cNo0Ac5KvX4pBXxNGJCds+9vPtoleqpQQa/QC5j3cemei+JGnWIiANkO5BDXlFk7
q1dDxA5MWjG1Wpo4rqpqu6vxX1/0kCoieVqwWVWQ96jYVC/ezakyP10a/CRfF01K
uT4CKT46gtx0IUN+x4pWLCeh84Cts1HAIVC6N0B4JEoTbpfBzIkvmTdBEksxdnFW
kxEQxsnk7OXZw9E8dXqTUREBVditeP1flpGxqJTUmL5wAPXGNWPKDWT/UQ71oYTK
NVIsb+NBLnRkthI72ur3Bwwf1AamTqNmJmrx61xcfUK1tc3bHLUvybjWSEDLJVjS
dhD13DFs9biOKDKFWX8j
=5gl2
-----END PGP SIGNATURE-----

--MGYHOYXEY6WxJCY8--


--===============0921756718265377133==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0921756718265377133==--
