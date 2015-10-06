From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH][RESEND] drm: panel-simple: add URT UMSH-8596MD-xT panel
 support
Date: Tue, 6 Oct 2015 11:10:28 +0200
Message-ID: <20151006091028.GB22087@ulmo.nvidia.com>
References: <55E5AD23.8070309@maciej.szmigiero.name>
 <560EF9C0.7080407@maciej.szmigiero.name>
 <20151005110112.GA16920@ulmo>
 <5612966D.3090507@maciej.szmigiero.name>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0159935319=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <5612966D.3090507@maciej.szmigiero.name>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org


--===============0159935319==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XOIedfhf+7KOe/yw"
Content-Disposition: inline


--XOIedfhf+7KOe/yw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 05, 2015 at 05:25:33PM +0200, Maciej S. Szmigiero wrote:
> Hi Thierry,
>=20
> On 05.10.2015 13:01, Thierry Reding wrote:
> >> On 01.09.2015 15:50, Maciej S. Szmigiero wrote:
> >>> This patch adds support for United Radiant Technology
> >>> UMSH-8596MD-xT 7.0" WVGA TFT LCD panels
> >>> (both LVDS and parallel versions) to DRM
> >>> panel-simple driver.
> >>>
> >>> Signed-off-by: Maciej Szmigiero <mail@maciej.szmigiero.name>
> >>> ---
> >>> This is a resend without changes.
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/panel/urt,umsh-8596md.=
txt b/Documentation/devicetree/bindings/panel/urt,umsh-8596md.txt
> >>> new file mode 100644
> >>> index 0000000..2990e6b
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/panel/urt,umsh-8596md.txt
> >>> @@ -0,0 +1,11 @@
> >>> +United Radiant Technology UMSH-8596MD-xT 7.0" WVGA TFT LCD panel
> >>> +
> >>> +Supported are LVDS versions (-11T, -19T) and parallel ones
> >>> +(-T, -1T, -7T, -20T).
> >=20
> > Please don't use this kind of wildcard compatible values. If these are
> > different models then each of them deserves a separate compatible
> > string.
>=20
> The differences between these revisions are like different maximum backli=
ght
> luminance or presence / absence of touch panel.
>=20
> None of this changes panel timings - should they be split into different
> compatible values anyway?

Yes, absolutely. The compatible doesn't only define what the video
timings are, it defines the specific piece of hardware. While it is true
that the panel-simple driver currently doesn't use any other information
the DT compatible value characterizes the full hardware and therefore
should take into account all of the device's properties.

Presence of a touch panel sounds like a very important property and the
maximum backlight brightness might also become important at some ponit.

> >>> You might want to
> >>> split the DT binding and vendor prefix to separate patches.
> >>
> >> Do you mean to first submit new vendor prefix then panel patch with do=
cs?
> >> Or even docs separately?
> >=20
> > This should be three patches: the vendor prefix is usually a separate
> > patch and needs an Acked-by from one of the device tree bindings
> > maintainers. The binding itself should also be a separate patch and the
> > driver changes should come last.
>=20
> I will split the patch and first submit DT binding docs.

Thanks,
Thierry

--XOIedfhf+7KOe/yw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWE5ABAAoJEN0jrNd/PrOhITsP/AjEHJJ5pRpL8b+yifGB4QqO
Xjwiim+reoPP5KEatQq+7LhVXPer7PDaMZ9K7MRmmdIq6A0tOxrbF7JMNbOjfFt1
otDIXX7IxgsZwodfBTM5mKn7WbZoJXXnlQA1TL11iDmU6vTiCC5XHeGY8M2tckKJ
9dEh0GYx7u72GGfcRz9wF69/WTTb3uCdm8Y4duPsl0/MqnZZoiuuf/PACPkhyYsj
jhmOzpfRGbH1aYHBDyUoSKilY1Ai8vbJcoQ8/YNbMaY7/lIl4zWnuHHV2AcB3Bpw
Sisowu0sUdNX8EcIpFjTPojj2HfLmtfpU4KTZUnOiZotBF20DmiS7qLUX6/MSA/O
GqKj5P4qdI+UNRnG3QRe0JB2jVYaZbi1tOZpJltJQ1FW/pl2onsidRwKh1ih8HVW
0dzy1fEK8+rMNmLXHi+pt4l1PO59YvAxpK2swGhf7lHuD2ZPgX12E3J/b3tpzP3Q
czilL4RDNmmoH0zixFCa3+YjY7sj/NEYYafsRdKGiOHSwbWF2Nf8JvV29IgD2xjH
WfXXnvZGSP/1KKQCpgUd/6F1MTSw9+PnHXSy/lJ9dnz9F5UGq7Y2M8gf4I8v5I4e
dTdPbc+J3q6RTRzyJAX8h17pnejp1+nuIqu4b6K0nWpE1Ca/9e4/y8UB1PvoEQE5
p3Yq43i6wThAkzq0/73J
=fgIr
-----END PGP SIGNATURE-----

--XOIedfhf+7KOe/yw--

--===============0159935319==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============0159935319==--
