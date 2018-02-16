From: Govind Singh <govinds-Rm6X0d1/PG5y9aJCnZT0Uw@public.gmane.org>
Subject: RE: [PATCH 13/13] dt: bindings: add bindings for wcn3990 wifi block
Date: Fri, 16 Feb 2018 04:35:26 +0000
Message-ID: <02165443f67d4e938ae4fdf69edbd1b7@aphydexm01b.ap.qualcomm.com>
References: <1518684977-14607-1-git-send-email-govinds@codeaurora.org>
 <CAGRGNgVtOuPwejDi-1Bux+1mGTTup0Mcf4ED-OBcn3z8=atpNQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGRGNgVtOuPwejDi-1Bux+1mGTTup0Mcf4ED-OBcn3z8=atpNQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Julian Calaby <julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

>> You've omitted the "qcom," you specify above.
Thanks, Julian, I will correct this in v2 revision.

Thanks,
Govind

-----Original Message-----
From: ath10k [mailto:ath10k-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org] On Behalf Of Julia=
n Calaby
Sent: Thursday, February 15, 2018 7:36 PM
To: Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>; linux-wireless <linux-wireless=
@vger.kernel.org>; ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Subject: Re: [PATCH 13/13] dt: bindings: add bindings for wcn3990 wifi bloc=
k

Hi Govind,

On Thu, Feb 15, 2018 at 7:56 PM, Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrot=
e:
> Add device tree binding documentation details for wcn3990 wifi block=20
> present in Qualcomm SDM845/APQ8098 SoC into "qcom,ath10k.txt".
>
> Signed-off-by: Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> ---
>  .../bindings/net/wireless/qcom,ath10k.txt          | 35 ++++++++++++++++=
++++++
>  1 file changed, 35 insertions(+)
>
> diff --git=20
> a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt=20
> b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> index 3d2a031..07b0f13 100644
> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> @@ -4,6 +4,7 @@ Required properties:
>  - compatible: Should be one of the following:
>         * "qcom,ath10k"
>         * "qcom,ipq4019-wifi"
> +       * "qcom,wcn3990-wifi"
>
>  PCI based devices uses compatible string "qcom,ath10k" and takes=20
> calibration  data along with board specific data via "qcom,ath10k-calibra=
tion-data".
> @@ -18,8 +19,11 @@ In general, entry=20
> "qcom,ath10k-pre-calibration-data" and  "qcom,ath10k-calibration-data"=20
> conflict with each other and only one  can be provided per device.
>
> +SNOC based devices (i.e. wcn3990) uses compatible string "qcom,wcn3990-w=
ifi".
> +
>  Optional properties:
>  - reg: Address and length of the register set for the device.
> +- reg-names: Names of the memory regions defined in reg entry.
>  - resets: Must contain an entry for each entry in reset-names.
>            See ../reset/reseti.txt for details.
>  - reset-names: Must include the list of following reset names, @@=20
> -49,6 +53,12 @@ Optional properties:
>                                  hw versions.
>  - qcom,ath10k-pre-calibration-data : pre calibration data as an array,
>                                      the length can vary between hw versi=
ons.
> +- qcom,<supply-name>-supply: handle to the regulator device tree node
> +                          optional "supply-name" is "vdd-0.8-cx-mx".
> +- qcom,<supply>-config: Specifies voltage levels for supply. Should be
> +                         specified in pairs (min, max), units uV.  There=
 can
> +                          be optional load in uA and Regulator settle de=
lay in
> +                          uS.
>
>  Example (to supply the calibration data alone):
>
> @@ -119,3 +129,28 @@ wifi0: wifi@a000000 {
>         qcom,msi_base =3D <0x40>;
>         qcom,ath10k-pre-calibration-data =3D [ 01 02 03 ... ];  };
> +
> +Example (to supply wcn3990 SoC wifi block details):
> +
> +qcom,msm_ath10k@18000000 {
> +               compatible =3D "qcom,wcn3990-wifi";
> +               reg =3D <0x18800000 0x800000>;
> +               reg-names =3D "membase";
> +               clocks =3D <&clock_gcc clk_aggre2_noc_clk>;
> +               clock-names =3D "smmu_aggre2_noc_clk"
> +               interrupts =3D
> +                          <0 130 0 /* CE0 */ >,
> +                          <0 131 0 /* CE1 */ >,
> +                          <0 132 0 /* CE2 */ >,
> +                          <0 133 0 /* CE3 */ >,
> +                          <0 134 0 /* CE4 */ >,
> +                          <0 135 0 /* CE5 */ >,
> +                          <0 136 0 /* CE6 */ >,
> +                          <0 137 0 /* CE7 */ >,
> +                          <0 138 0 /* CE8 */ >,
> +                          <0 139 0 /* CE9 */ >,
> +                          <0 140 0 /* CE10 */ >,
> +                          <0 141 0 /* CE11 */ >;
> +               vdd-0.8-cx-mx-supply =3D <&pm8998_l5>;

You've omitted the "qcom," you specify above.

> +               qcom,vdd-0.8-cx-mx-config =3D <800000 800000 2400 1000>;=
=20
> +};
> --
> 1.9.1
>

Thanks,

--
Julian Calaby

Email: julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Profile: http://www.google.com/profiles/julian.calaby/

_______________________________________________
ath10k mailing list
ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
http://lists.infradead.org/mailman/listinfo/ath10k
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
