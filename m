Return-Path: <SRS0=x5QR=37=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93CEDC352A3
	for <linux-devicetree@archiver.kernel.org>; Tue, 11 Feb 2020 08:57:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 687562070A
	for <linux-devicetree@archiver.kernel.org>; Tue, 11 Feb 2020 08:57:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727609AbgBKI5R (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 11 Feb 2020 03:57:17 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:45633 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727608AbgBKI5Q (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 11 Feb 2020 03:57:16 -0500
Received: by mail-wr1-f65.google.com with SMTP id g3so10118483wrs.12
        for <devicetree@vger.kernel.org>; Tue, 11 Feb 2020 00:57:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=GOJP770Tiah9k34K1i4D0mmMCals5hmtcP+1Vo4a7x8=;
        b=A+P5eW4I7Cn5WV6qHnYhDMcfnoxY4QLKE573Hf5Q08twMm9A735FsB3WhzbtBjyJtc
         KbVezDQD7PSdxcOOUKuvi8exxMUl0pphsRie5ZhKwJ/hC0CSPcvQFRayTUth7PUt0L6C
         3BWbSZhiAln3Y92esr6o1vyVSzTgaOhSfcrxH1oMPN1ACeYE02wpd6IDymCrsIlxwLcZ
         71zSc4+iC0dy+ku6lLM1EQCRzEYOW4U6Jrtg7XE5l4O3PZ04VU9in3MniF8Ii6S3/qRr
         h/pIhOtRObnEvTSo8boFrvtQrFb8+qmg0xK9tXdIcv5S7GN1rC5BoiK6Wm3b2bXLp2In
         LWtg==
X-Gm-Message-State: APjAAAVSZ0yTeovkJgh1Y+m8IBHnBhTTMAne6qUNZcokexwBcri3tNLO
        ZZOYBRdZglv78f5Z1E6X644=
X-Google-Smtp-Source: APXvYqzsrr7j7rXdroEd/UAK3WbLfUA/Hqi/3P6/pXxf0KxG2etFKeQoDoB4a8RlkFJ2eyUywasuCQ==
X-Received: by 2002:adf:df0e:: with SMTP id y14mr7056612wrl.377.1581411434574;
        Tue, 11 Feb 2020 00:57:14 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
        by smtp.gmail.com with ESMTPSA id l131sm2902199wmf.31.2020.02.11.00.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2020 00:57:13 -0800 (PST)
Message-ID: <de946127eb530c23395f7c882deb127c2e4bbffa.camel@andred.net>
Subject: Re: [PATCH RESEND 1/1] ARM: dts: imx7s: Add power domain for imx7d
 HSIC
From:   =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To:     Peter Chen <peter.chen@nxp.com>, shawnguo@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de, linux-imx@nxp.com
Date:   Tue, 11 Feb 2020 08:57:12 +0000
In-Reply-To: <1575342112-14702-1-git-send-email-peter.chen@nxp.com>
References: <1575342112-14702-1-git-send-email-peter.chen@nxp.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 2019-12-03 at 11:01 +0800, Peter Chen wrote:
> Otherwise, the system will hang if USB driver try to access
> portsc register.
> 
> Cc: André Draszik <git@andred.net>
> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> ---
>  arch/arm/boot/dts/imx7s.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
> index c1a4fff5ceda..a5b380f530f8 100644
> --- a/arch/arm/boot/dts/imx7s.dtsi
> +++ b/arch/arm/boot/dts/imx7s.dtsi
> @@ -658,6 +658,12 @@
>  						reg = <1>;
>  						power-supply = <&reg_1p0d>;
>  					};
> +
> +					pgc_hsic_phy: power-domain@2 {
> +						#power-domain-cells = <0>;
> +						reg = <2>;
> +						power-supply = <&reg_1p2>;
> +					};
>  				};
>  			};
>  		};
> @@ -1101,6 +1107,7 @@
>  				compatible = "fsl,imx7d-usb", "fsl,imx27-usb";
>  				reg = <0x30b30000 0x200>;
>  				interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
> +				power-domains = <&pgc_hsic_phy>;
>  				clocks = <&clks IMX7D_USB_CTRL_CLK>;
>  				fsl,usbphy = <&usbphynop3>;
>  				fsl,usbmisc = <&usbmisc3 0>;

It's a bit late now, but for completeness, with this patch applied
the HSIC port works fine on my iMX7d board now.

Thanks Peter.

Tested-by: André Draszik <git@andred.net>


Cheers,
Andre'


