From: Stephen Boyd <swboyd-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v3 2/3] dts: arm64/sdm845: Add WCN3990 WLAN module device node
Date: Wed, 17 Oct 2018 00:33:48 -0700
Message-ID: <153976162862.5275.4810472671573539341@swboyd.mtv.corp.google.com>
References: <1539172376-19269-1-git-send-email-govinds@codeaurora.org>
 <1539172376-19269-3-git-send-email-govinds@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1539172376-19269-3-git-send-email-govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Quoting Govind Singh (2018-10-10 04:52:55)
> @@ -1403,5 +1408,26 @@
>                                 status =3D "disabled";
>                         };
>                 };
> +
> +               wifi: wifi@18800000 {
> +                       compatible =3D "qcom,wcn3990-wifi";
> +                       status =3D "disabled";
> +                       reg =3D <0x18800000 0x800000>;
> +                       reg-names =3D "membase";
> +                       memory-region =3D <&wlan_msa_mem>;
> +                       interrupts =3D
> +                               <0 413 0 /* CE0 */ >,

Please specify these as GIC_SPI and give trigger types (level high I
guess?). I'd also drop the comment and add interrupt-names to match the
comment. It's self documenting that way.

> +                               <0 414 0 /* CE1 */ >,
> +                               <0 415 0 /* CE2 */ >,
> +                               <0 416 0 /* CE3 */ >,
> +                               <0 417 0 /* CE4 */ >,
> +                               <0 418 0 /* CE5 */ >,
> +                               <0 420 0 /* CE6 */ >,
> +                               <0 421 0 /* CE7 */ >,
> +                               <0 422 0 /* CE8 */ >,
> +                               <0 423 0 /* CE9 */ >,
> +                               <0 424 0 /* CE10 */ >,
> +                               <0 425 0 /* CE11 */ >;
