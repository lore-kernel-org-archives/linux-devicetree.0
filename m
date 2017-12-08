From: Kalle Valo <kvalo-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org>
Subject: Re: [PATCH 2/2] ath10k: search DT for qcom,ath10k-calibration-variant
Date: Fri, 8 Dec 2017 09:27:52 +0000
Message-ID: <87fu8ltvqg.fsf@kamboji.qca.qualcomm.com>
References: <20170310080615.22958-1-sven.eckelmann@openmesh.com>
        <20170310080615.22958-2-sven.eckelmann@openmesh.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170310080615.22958-2-sven.eckelmann-lv6y7wLVQPlWk0Htik3J/w@public.gmane.org> (Sven
        Eckelmann's message of "Fri, 10 Mar 2017 09:06:15 +0100")
Content-Language: en-US
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sven Eckelmann <sven.eckelmann-lv6y7wLVQPlWk0Htik3J/w@public.gmane.org>
Cc: "ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "ext.waldemar.rymarkiewicz-++hxYGjEMp0AvxtiuMwx3w@public.gmane.org" <ext.waldemar.rymarkiewicz-++hxYGjEMp0AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Sven Eckelmann <sven.eckelmann-lv6y7wLVQPlWk0Htik3J/w@public.gmane.org> writes:

> Board Data File (BDF) is loaded upon driver boot-up procedure. The right
> board data file is identified on QCA4019 using bus, bmi-chip-id and
> bmi-board-id.
>
> The problem, however, can occur when the (default) board data file cannot
> fulfill with the vendor requirements and it is necessary to use a differe=
nt
> board data file.
>
> This problem was solved for SMBIOS by adding a special SMBIOS type 0xF8.
> Something similar has to be provided for systems without SMBIOS but with
> device trees. No solution was specified by QCA and therefore a new one ha=
s
> to be found for ath10k.
>
> The device tree requires addition strings to define the variant name
>
>     wifi@a000000 {
>     	status =3D "okay";
>     	qcom,ath10k-calibration-variant =3D "RT-AC58U";
>     };
>
>     wifi@a800000 {
>     	status =3D "okay";
>     	qcom,ath10k-calibration-variant =3D "RT-AC58U";
>     };
>
> This would create the boarddata identifiers for the board-2.bin search
>
>  *  bus=3Dahb,bmi-chip-id=3D0,bmi-board-id=3D16,variant=3DRT-AC58U
>  *  bus=3Dahb,bmi-chip-id=3D0,bmi-board-id=3D17,variant=3DRT-AC58U
>
> Signed-off-by: Sven Eckelmann <sven.eckelmann-lv6y7wLVQPlWk0Htik3J/w@public.gmane.org>
> ---
> Since RFC:
>
>  - initialize variant pointer to have it initialized to NULL when
>    of_property_read_string fails (thanks Christian Lamparter)
>  - Only print warning that DT doesn't contain string ones (thanks Christi=
an
>    Lamparter)
>  - Split patch in DT doc and ath10k part (thanks Christian Lamparter)
>  - Allow to overwrite the variant string via DT and ignore that SMBIOS ha=
d
>    written anything to it

[...]

> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -779,6 +779,25 @@ static int ath10k_core_check_smbios(struct ath10k *a=
r)
>  	return 0;
>  }
> =20
> +static int ath10k_core_check_dt(struct ath10k *ar)
> +{
> +	struct device_node *node;
> +	const char *variant =3D NULL;
> +
> +	node =3D ar->dev->of_node;
> +	if (!node)
> +		return -ENOENT;
> +
> +	of_property_read_string(node, "qcom,ath10k-calibration-variant",
> +				&variant);
> +	if (!variant)
> +		return -ENODATA;
> +
> +	strscpy(ar->id.bdf_ext, variant, sizeof(ar->id.bdf_ext));

Kbuild bot found a warning here:

   drivers/net/wireless/ath/ath10k/core.c: In function 'ath10k_core_check_d=
t':
>> drivers/net/wireless/ath/ath10k/core.c:877:2: warning: ignoring return v=
alue of 'strscpy', declared with attribute warn_unused_result [-Wunused-res=
ult]
     strscpy(ar->id.bdf_ext, variant, sizeof(ar->id.bdf_ext));
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

I guess warn_unused_result in strscpy() is a recent addition and that's
why you didn't see it.

--=20
Kalle Valo=
