Return-Path: <SRS0=CGHq=ZL=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FD33C432C0
	for <linux-devicetree@archiver.kernel.org>; Tue, 19 Nov 2019 23:36:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 318B22240C
	for <linux-devicetree@archiver.kernel.org>; Tue, 19 Nov 2019 23:36:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727007AbfKSXgt convert rfc822-to-8bit (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 19 Nov 2019 18:36:49 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:47687 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726911AbfKSXgt (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 19 Nov 2019 18:36:49 -0500
Received: from marcel-macbook.fritz.box (p4FF9F0D1.dip0.t-ipconnect.de [79.249.240.209])
        by mail.holtmann.org (Postfix) with ESMTPSA id 0CAE6CECFA;
        Wed, 20 Nov 2019 00:45:55 +0100 (CET)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3601.0.10\))
Subject: Re: [PATCH 1/2] dt-bindings: net: Add compatible for BCM4335A0
 bluetooth module
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20191119194638.4967-2-mohammad.rasim96@gmail.com>
Date:   Wed, 20 Nov 2019 00:36:48 +0100
Cc:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Content-Transfer-Encoding: 8BIT
Message-Id: <142FFF61-2253-4DE2-BF82-CEAB780252C7@holtmann.org>
References: <20191119194638.4967-1-mohammad.rasim96@gmail.com>
 <20191119194638.4967-2-mohammad.rasim96@gmail.com>
To:     Mohammad Rasim <mohammad.rasim96@gmail.com>
X-Mailer: Apple Mail (2.3601.0.10)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Mohammad,

> Available in the Ampak AP6335 WiFi/Bluetooth combo
> 
> Signed-off-by: Mohammad Rasim <mohammad.rasim96@gmail.com>
> ---
> Documentation/devicetree/bindings/net/broadcom-bluetooth.txt | 1 +
> 1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt b/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
> index 4fa00e2eafcf..0717399191a2 100644
> --- a/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
> +++ b/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
> @@ -14,6 +14,7 @@ Required properties:
>    * "brcm,bcm4330-bt"
>    * "brcm,bcm43438-bt"
>    * "brcm,bcm4345c5"
> +   * "brcm,bcm4335a0"

this patch doesn’t apply to latest bluetooth-next tree.

Regards

Marcel

