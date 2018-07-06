Return-Path: <SRS0=WJ9a=JW=collabora.co.uk=sebastian.reichel@kernel.org>
Date: Fri, 6 Jul 2018 15:57:59 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Subject: Re: [PATCH v5 1/6] dt-bindings: power: reset: Add qcom pon binding
Message-ID: <20180706135759.tbx2gcyr647nnh6n@earth.universe>
References: <20180628150850.15358-1-vkoul@kernel.org>
 <20180628150850.15358-2-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bcjkrolc3xyfbg6y"
Content-Disposition: inline
In-Reply-To: <20180628150850.15358-2-vkoul@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: linux-input@vger.kernel.org, linux-pm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--bcjkrolc3xyfbg6y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jun 28, 2018 at 08:38:45PM +0530, Vinod Koul wrote:
> The Power On device for Qcom PM 8xxx is a MFD supporting pwrkey and
> resin along with the Android reboot-mode.
>=20
> Add the binding describing this.
>=20
> Suggested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---

Thanks, queued to power-supply-next.

-- Sebastian

>  .../devicetree/bindings/power/reset/qcom,pon.txt   | 35 ++++++++++++++++=
++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/reset/qcom,po=
n.txt
>=20
> diff --git a/Documentation/devicetree/bindings/power/reset/qcom,pon.txt b=
/Documentation/devicetree/bindings/power/reset/qcom,pon.txt
> new file mode 100644
> index 000000000000..f32cdd358267
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/reset/qcom,pon.txt
> @@ -0,0 +1,35 @@
> +Qualcomm PON Device
> +
> +The Power On device for Qualcomm PM8xxx is MFD supporting pwrkey
> +along with the Android reboot-mode.
> +
> +This DT node has pwrkey as sub node.
> +
> +Required Properties:
> +-compatible: "qcom,pm8916-pon"
> +-reg: Specifies the physical address of the pon register
> +
> +Optional subnode:
> +-pwrkey: Specifies the subnode pwrkey and should follow the
> + qcom,pm8941-pwrkey.txt description.
> +
> +The rest of the properties should follow the generic reboot-mode descrip=
tion
> +found in reboot-mode.txt
> +
> +Example:
> +
> +	pon@800 {
> +		compatible =3D "qcom,pm8916-pon";
> +
> +		reg =3D <0x800>;
> +		mode-bootloader =3D <0x2>;
> +		mode-recovery =3D <0x1>;
> +
> +		pwrkey {
> +			compatible =3D "qcom,pm8941-pwrkey";
> +			interrupts =3D <0x0 0x8 0 IRQ_TYPE_EDGE_BOTH>;
> +			debounce =3D <15625>;
> +			bias-pull-up;
> +			linux,code =3D <KEY_POWER>;
> +		};
> +	};
> --=20
> 2.14.4
>=20

--bcjkrolc3xyfbg6y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAls/dWcACgkQ2O7X88g7
+prYQQ//YgUj2vynTIkm73iFjZhb6jRrvB25nDKb5+RcUb9tLt3CsBP8Bgno2KNv
5PEUmz3Nm8i/0eeLoiMNFCDbSpeXhNgZGh5YKVcWctXdTO29tDs8Jxrl9YpWL0d7
v6FII6RWdAaXYaSpfV6OWiSAaTeplVDIjeIj+tF1i7e2vwagsKr4D0AVI85skBqS
4oeMJokMUuqgmTbuiSgIwgBY9fnSQmJ97wkFr8e+psfIwDdcAkXHGUUT1k5q/MKC
qW/Oc7ivKIWPp0LNLVriMtdHgyH5/hE+ActNLyXvpQS6y1UMcaeMGcpuP4nvGmfK
mJvM+M0gvDqs2hJV/7xa5+hI/SisSG2Aj4GJc9NILm8AlJHNpaB0bWa+ksF6vie5
MgyeFndgUiWsNgew/asphnLhWplgD2MKLidBSDkbZlq7PQkkHRdwTg85YlpcSVEn
f5G2hcGj98o5/SGXz05yMMn7CzP+lcObOPQZnonj5mV2VUOq+DPwpLngWz8fcZBR
t1lF3DOXX8je31k/kANKTb8wFukbPmK6b33wyC+xQcc4RC4Cz8d8CK20WsFokfO5
luuPFW6TznU8e/YoOLlCDvR33+0hFrYfudtVcTm9+L14tX1M8zqCPsjiWZgdO1af
lQLFnOFFfpZeLCzUtZocu+X3lPtEgFtspJ0UFjqjQJVmqmz4y6s=
=eHrn
-----END PGP SIGNATURE-----

--bcjkrolc3xyfbg6y--
