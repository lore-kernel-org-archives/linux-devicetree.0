From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v4 1/1] drm/panel: simple: Add nvd9128 as a simple panel
Date: Wed, 19 Oct 2016 14:36:26 +0200
Message-ID: <20161019123626.GD16158@ulmo.ba.sec>
References: <1473844182-18201-1-git-send-email-fabien.lahoudere@collabora.co.uk>
 <1476697081-27044-1-git-send-email-fabien.lahoudere@collabora.co.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1002696033=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1476697081-27044-1-git-send-email-fabien.lahoudere@collabora.co.uk>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
Cc: mark.rutland@arm.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--===============1002696033==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="F8dlzb82+Fcn6AgP"
Content-Disposition: inline


--F8dlzb82+Fcn6AgP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 17, 2016 at 11:38:01AM +0200, Fabien Lahoudere wrote:
> Add New Vision Display 7.0" 800 RGB x 480 TFT LCD panel
>=20
> Signed-off-by: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/display/panel/nvd,9128.txt |  7 ++++++
>  .../devicetree/bindings/vendor-prefixes.txt        |  1 +
>  drivers/gpu/drm/panel/panel-simple.c               | 26 ++++++++++++++++=
++++++
>  3 files changed, 34 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/nvd,9=
128.txt

Applied, thanks.

Thierry

--F8dlzb82+Fcn6AgP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYB2jJAAoJEN0jrNd/PrOhXzcQAI62o5QwNwsEusDmDiCAAzg0
760GhdV7mleDUYozd7cgU9oTIAV4czWvgPWXiZQIiVK73wUm6fZrdaIQolMnS8VM
lKClG7EZJQAfI8OCbbUVsk0TxXzNGV+bPCio/ZOOo3hA+eCtuvU12llhvHobfi79
FZOO17vab+b8O7gpXvZYpNrgIVCzQI0m8QphPGu084WicsmjXVdpVYiftyhhjNf3
qdgT/W/uHEOi2OAiZFd0VNe0JGyekgs7iVvp45bD/nWh6+dHjUS3xLb3KdkBppks
K+YTUE25iU1ta224fioYGQ97dFyFzvtErPbJvzQGwPnNYheEZVZoH7Wtm/EBOeoJ
Dl+rM38ybrDzV9eyGmLSUTZbgWNwIkGvR/E9NhwZqpzCTs4fVqDhX8XZNBSYj8nb
0aMUAaFEwHGU/FXZyYmKlw5Og776hhUSYM85b0LVkVn2TvjsVVrjq7frWPqUTuuJ
dQMO9eCg9/891HSjm4mqSYcHlwAO+OTtzdA0pXBmwyaiYgg8qZiAbIax0q+THTtm
Gnkpqwnu62gO/j1HxibYvOECCJdwTIiPGQ6QOUEjsnH/nt/X/3kGaZ5JrRLHP6Sv
EDKUlLVm9cbpR8LTsq3wCowCeECVFn4OdpQYmHqiFukEMefhckuKBIBAxFbXAuKw
eGsUqZwG3R/P02LfUBTK
=tjzy
-----END PGP SIGNATURE-----

--F8dlzb82+Fcn6AgP--

--===============1002696033==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1002696033==--
