Return-Path: <SRS0=+eCa=5Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC5D5C2D0EA
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Apr 2020 06:21:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 00C802072F
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Apr 2020 06:21:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="J6O+bvGx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725283AbgDIGV1 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 9 Apr 2020 02:21:27 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.51]:27874 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726552AbgDIGV1 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 9 Apr 2020 02:21:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1586413284;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=JuzbKQX42uL8ZIJIWjmD9qTFwUL8iA4u+F2Ck54wjjI=;
        b=J6O+bvGx532k/itV13GBxOajKhcVeCgAHg4q69to6XQP6bnhD31usBVUG5K2gccSuf
        AJmX9WjD9e3k4UQrzyUyUCxlpSC2LzEpfXeIRyBsfY7wSYfynh1oILmdsQX2V8tE/M8j
        HJEVvlKgRtY8x/OL2G7hp2VxmIidpd1o9ngQzQ6LFVVAwdo4fXad97XQ0RLXUlkQsI2q
        ioFBVpywRIpmMuTx92t6bhIxfNkt013tDuHx9JHX6YJdwlStX11lgaD0OaZw/FPffnfP
        x2p0ojXCchPQ5heRQFEWrWvOIwVNqA52XFyzlANN7X0CMpCuEL82LgoyBUFOa6L1uHQM
        K2tA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/zvwDCoFnA="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.2.1 DYNA|AUTH)
        with ESMTPSA id m02241w396LGt47
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Thu, 9 Apr 2020 08:21:16 +0200 (CEST)
Subject: Re: [PATCH v2 24/36] dt-bindings: display: convert toppoly panels to DT Schema
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200408195109.32692-25-sam@ravnborg.org>
Date:   Thu, 9 Apr 2020 08:21:16 +0200
Cc:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        Maxime Ripard <mripard@kernel.org>,
        Marek Belisko <marek@goldelico.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <981A14FA-AFB0-47B6-9EEF-E1C09828976F@goldelico.com>
References: <20200408195109.32692-1-sam@ravnborg.org> <20200408195109.32692-25-sam@ravnborg.org>
To:     Sam Ravnborg <sam@ravnborg.org>
X-Mailer: Apple Mail (2.3124)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Sam,

> Am 08.04.2020 um 21:50 schrieb Sam Ravnborg <sam@ravnborg.org>:
>=20
> v2:
>  - dropped use of spi-slave.yaml (Maxime)
>  - added unevaluatedProperties (Maxime)
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Marek Belisko <marek@goldelico.com>
> Cc: H. Nikolaus Schaller <hns@goldelico.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
> .../bindings/display/panel/tpo,td.yaml        | 65 +++++++++++++++++++
> .../bindings/display/panel/tpo,td028ttec1.txt | 32 ---------
> .../bindings/display/panel/tpo,td043mtea1.txt | 33 ----------
> 3 files changed, 65 insertions(+), 65 deletions(-)
> create mode 100644 =
Documentation/devicetree/bindings/display/panel/tpo,td.yaml
> delete mode 100644 =
Documentation/devicetree/bindings/display/panel/tpo,td028ttec1.txt
> delete mode 100644 =
Documentation/devicetree/bindings/display/panel/tpo,td043mtea1.txt
>=20
> diff --git =
a/Documentation/devicetree/bindings/display/panel/tpo,td.yaml =
b/Documentation/devicetree/bindings/display/panel/tpo,td.yaml
> new file mode 100644
> index 000000000000..4aa605613445
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/tpo,td.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/tpo,td.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Toppoly TD Panels
> +
> +description: |
> +  The panel must obey the rules for a SPI slave device as specified =
in
> +  spi/spi-controller.yaml
> +
> +maintainers:
> +  - Marek Belisko <marek@goldelico.com>
> +  - H. Nikolaus Schaller <hns@goldelico.com>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +        # Toppoly TD028TTEC1 Panel
> +      - tpo,td028ttec1
> +        # Toppoly TD043MTEA1 Panel
> +      - tpo,td043mtea1
> +
> +  reg: true
> +  label: true
> +  reset-gpios: true
> +  backlight: true
> +  port: true
> +
> +required:
> +  - compatible
> +  - port
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    spi {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        panel: panel@0 {
> +            compatible =3D "tpo,td043mtea1";
> +            reg =3D <0>;
> +            spi-max-frequency =3D <100000>;
> +            spi-cpol;
> +            spi-cpha;
> +
> +            label =3D "lcd";
> +
> +            reset-gpios =3D <&gpio7 7 0>;
> +
> +            port {
> +                lcd_in: endpoint {
> +                    remote-endpoint =3D <&dpi_out>;
> +                };
> +            };
> +        };
> +    };

I think it is possible to add two examples (the one for tpo,td028ttec1)
as well. The reason is that it must also have spi-cs-high; which isn't
documented anywhere else and wasn't in tpo,td028ttec1.txt.

> +
> +...

looks ok to me.

BR and thanks,
Nikolaus

> diff --git =
a/Documentation/devicetree/bindings/display/panel/tpo,td028ttec1.txt =
b/Documentation/devicetree/bindings/display/panel/tpo,td028ttec1.txt
> deleted file mode 100644
> index 898e06ecf4ef..000000000000
> --- =
a/Documentation/devicetree/bindings/display/panel/tpo,td028ttec1.txt
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -Toppoly TD028TTEC1 Panel
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=

> -
> -Required properties:
> -- compatible: "tpo,td028ttec1"
> -
> -Optional properties:
> -- label: a symbolic name for the panel
> -- backlight: phandle of the backlight device
> -
> -Required nodes:
> -- Video port for DPI input
> -
> -Example
> --------
> -
> -lcd-panel: td028ttec1@0 {
> -	compatible =3D "tpo,td028ttec1";
> -	reg =3D <0>;
> -	spi-max-frequency =3D <100000>;
> -	spi-cpol;
> -	spi-cpha;
> -
> -	label =3D "lcd";
> -	backlight =3D <&backlight>;
> -	port {
> -		lcd_in: endpoint {
> -			remote-endpoint =3D <&dpi_out>;
> -		};
> -	};
> -};
> -
> diff --git =
a/Documentation/devicetree/bindings/display/panel/tpo,td043mtea1.txt =
b/Documentation/devicetree/bindings/display/panel/tpo,td043mtea1.txt
> deleted file mode 100644
> index ec6d62975162..000000000000
> --- =
a/Documentation/devicetree/bindings/display/panel/tpo,td043mtea1.txt
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -TPO TD043MTEA1 Panel
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -
> -Required properties:
> -- compatible: "tpo,td043mtea1"
> -- reset-gpios: panel reset gpio
> -
> -Optional properties:
> -- label: a symbolic name for the panel
> -
> -Required nodes:
> -- Video port for DPI input
> -
> -Example
> --------
> -
> -lcd-panel: panel@0 {
> -	compatible =3D "tpo,td043mtea1";
> -	reg =3D <0>;
> -	spi-max-frequency =3D <100000>;
> -	spi-cpol;
> -	spi-cpha;
> -
> -	label =3D "lcd";
> -
> -	reset-gpios =3D <&gpio7 7 0>;
> -
> -	port {
> -		lcd_in: endpoint {
> -			remote-endpoint =3D <&dpi_out>;
> -		};
> -	};
> -};
> --=20
> 2.20.1
>=20

