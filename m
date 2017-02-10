From: Jon Mason <jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH for-4.11 2/2] Revert "dt-bindings: phy: Add documentation
 for NSP USB3 PHY"
Date: Thu, 9 Feb 2017 19:30:06 -0500
Message-ID: <CAC3K-4oju7mEAhaTM3VaF_NGt1agsuN8Reb6XzxM5qo54Eo0dA@mail.gmail.com>
References: <20170208233023.31922-1-zajec5@gmail.com> <20170208233023.31922-2-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170208233023.31922-2-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Yendapally Reddy Dhananjaya Reddy <yendapally.reddy-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 8, 2017 at 6:30 PM, Rafa=C5=82 Mi=C5=82ecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> =
wrote:
> From: Rafa=C5=82 Mi=C5=82ecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
>
> This reverts commit c8ca631f9480 ("dt-bindings: phy: Add documentation
> for NSP USB3 PHY") to match reverting commit adding the new PHY driver.
> Please note we revert this commit before it reached stable release.
>
> If new compatible string is needed it should be added to the existing
> bcm-ns-usb3-phy.txt which already describes this PHY.
>
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>

(previous email got caught in HTML filters)

Per the discussion with Rafal, this is acceptable

Acked-by: Jon Mason <jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>

> ---
>  .../devicetree/bindings/phy/brcm,nsp-usb3-phy.txt  | 39 ----------------=
------
>  1 file changed, 39 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/phy/brcm,nsp-usb3-p=
hy.txt
>
> diff --git a/Documentation/devicetree/bindings/phy/brcm,nsp-usb3-phy.txt =
b/Documentation/devicetree/bindings/phy/brcm,nsp-usb3-phy.txt
> deleted file mode 100644
> index e68ae5dec9c9..000000000000
> --- a/Documentation/devicetree/bindings/phy/brcm,nsp-usb3-phy.txt
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -Broadcom USB3 phy binding for northstar plus SoC
> -The USB3 phy is internal to the SoC and is accessed using mdio interface=
.
> -
> -Required mdio bus properties:
> -- reg: Should be 0x0 for SoC internal USB3 phy
> -- #address-cells: must be 1
> -- #size-cells: must be 0
> -
> -Required USB3 PHY properties:
> -- compatible: should be "brcm,nsp-usb3-phy"
> -- reg: USB3 Phy address on SoC internal MDIO bus and it should be 0x10.
> -- usb3-ctrl-syscon: handler of syscon node defining physical address
> -  of usb3 control register.
> -- #phy-cells: must be 0
> -
> -Required usb3 control properties:
> -- compatible: should be "brcm,nsp-usb3-ctrl"
> -- reg: offset and length of the control registers
> -
> -Example:
> -
> -       mdio@0 {
> -               reg =3D <0x0>;
> -               #address-cells =3D <1>;
> -               #size-cells =3D <0>;
> -
> -               usb3_phy: usb-phy@10 {
> -                       compatible =3D "brcm,nsp-usb3-phy";
> -                       reg =3D <0x10>;
> -                       usb3-ctrl-syscon =3D <&usb3_ctrl>;
> -                       #phy-cells =3D <0>;
> -                       status =3D "disabled";
> -               };
> -       };
> -
> -       usb3_ctrl: syscon@104408 {
> -               compatible =3D "brcm,nsp-usb3-ctrl", "syscon";
> -               reg =3D <0x104408 0x3fc>;
> -       };
> --
> 2.11.0
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
