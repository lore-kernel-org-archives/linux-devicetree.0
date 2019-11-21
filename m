Return-Path: <SRS0=OHRJ=ZN=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 604DCC432C3
	for <linux-devicetree@archiver.kernel.org>; Thu, 21 Nov 2019 07:11:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3CF6C2089D
	for <linux-devicetree@archiver.kernel.org>; Thu, 21 Nov 2019 07:11:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726014AbfKUHLj (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 21 Nov 2019 02:11:39 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:49046 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725842AbfKUHLj (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 21 Nov 2019 02:11:39 -0500
Received: from marcel-macbook.fritz.box (p4FF9F0D1.dip0.t-ipconnect.de [79.249.240.209])
        by mail.holtmann.org (Postfix) with ESMTPSA id 27092CED0D;
        Thu, 21 Nov 2019 08:20:45 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3601.0.10\))
Subject: Re: [PATCH v2 1/2] dt-bindings: net: Add compatible for BCM4335A0
 bluetooth
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20191120110235.13987-2-mohammad.rasim96@gmail.com>
Date:   Thu, 21 Nov 2019 08:11:37 +0100
Cc:     devicetree <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-amlogic@lists.infradead.org
Content-Transfer-Encoding: 7bit
Message-Id: <23D139BB-21FB-41C5-9354-12F050E9102B@holtmann.org>
References: <20191120110235.13987-1-mohammad.rasim96@gmail.com>
 <20191120110235.13987-2-mohammad.rasim96@gmail.com>
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

patch has been applied to bluetooth-next tree.

Regards

Marcel

