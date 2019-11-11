Return-Path: <SRS0=QTuQ=ZD=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD71DC43331
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 Nov 2019 21:05:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EFE29206BB
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 Nov 2019 21:05:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="mrgvd3tl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726877AbfKKVFS (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 11 Nov 2019 16:05:18 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.51]:15013 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726821AbfKKVFS (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 11 Nov 2019 16:05:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1573506316;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=XOJHmHRtuAQ7wjdWplmhsAQvacfKl4UjW8S4Huymubg=;
        b=mrgvd3tlIScA4khw4Wpv0hE0ce35NOYeWA4D6i28AuJGDMi3A3svKTt052sbH4I1Ez
        mv6QAJIxYf1Hre0M4S6miU+Pj76gMAjUBqi59luAxh7BK5tDkGCa7Cim5UCBrouVgXrW
        6Qizk3taQRUqBDzuyD10KF3DRmzI/daupkSJUfmV1WLpg+C69fSpe2vst3MzESQfkTBX
        0jKrBADpgoXZJdRk4Hlvw6fsA7DTrDhx+aQpEn6VvJ7pZvnq2Cy3DRAub/eZnNG0Ke2N
        dwqrYBi7V2iWljiBGpAX0YPyb5bsDc/SQcflARLget7h3Q5IvjNtNNYITnL1vY4oZ0Di
        ssQg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/vrwDOsGQ=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 44.29.0 DYNA|AUTH)
        with ESMTPSA id L09db3vABL56xKG
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Mon, 11 Nov 2019 22:05:06 +0100 (CET)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH] ARM: dts: e60k02: fix power button
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20191111202959.24189-1-andreas@kemnade.info>
Date:   Mon, 11 Nov 2019 22:05:05 +0100
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Message-Id: <7FB23F5A-91C7-414F-A5B8-AE6E62048022@goldelico.com>
References: <20191111202959.24189-1-andreas@kemnade.info>
To:     Andreas Kemnade <andreas@kemnade.info>
X-Mailer: Apple Mail (2.3124)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


> Am 11.11.2019 um 21:29 schrieb Andreas Kemnade <andreas@kemnade.info>:
> 
> The power button was only producing irqs, but no key events,
> Forced power down with long key press works, so probably
> only a short spike arrives at the SoC.
> Further investigation shows that LDORTC2 is off after boot
> of the vendor kernel. LDORTC2 is shared with a GPIO at the pmic
> which probably transfers the button press to the SoC.
> That regulator off at boot, so "regulator-boot-on" is definitively
> wrong. So remove that.
> 
> Reported-by: H. Nikolaus Schaller <hns@goldelico.com>
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
> arch/arm/boot/dts/e60k02.dtsi | 5 -----
> 1 file changed, 5 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/e60k02.dtsi b/arch/arm/boot/dts/e60k02.dtsi
> index a0ade2ba7a21..33e02bd2b59d 100644
> --- a/arch/arm/boot/dts/e60k02.dtsi
> +++ b/arch/arm/boot/dts/e60k02.dtsi
> @@ -356,11 +356,6 @@
> 				regulator-name = "LDORTC1";
> 				regulator-boot-on;
> 			};
> -
> -			ldortc2_reg: LDORTC2 {
> -				regulator-name = "LDORTC2";
> -				regulator-boot-on;
> -			};
> 		};
> 	};
> };
> -- 
> 2.20.1
> 

Also:

Tested-by: H. Nikolaus Schaller <hns@goldelico.com>
