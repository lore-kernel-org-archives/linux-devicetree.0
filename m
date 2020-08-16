Return-Path: <SRS0=yifd=B2=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B19EFC433DF
	for <linux-devicetree@archiver.kernel.org>; Sun, 16 Aug 2020 21:03:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7533620866
	for <linux-devicetree@archiver.kernel.org>; Sun, 16 Aug 2020 21:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1597611832;
	bh=RYclrxRRZo/dETl4RLgRjPrhJr4sXQS1Jngb8HYO7RU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=VZr7xBQgSVcEDmEd6JPCUTlhBaPqCEr9Q9/ZpNEd73xa7mGnhSZWTJnO7yd1JvAYq
	 2NiBptaiz4KLyQL3+4c+9MfI9uKFtX37yo/q83bmAVfz4o4LW9uh8Nysbs4ZNsXKAP
	 q78HZlnuBDOu6Lr1yj5q/Qu9DPuh+H3qeojD1GZA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728651AbgHPVDv (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 16 Aug 2020 17:03:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:54374 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726331AbgHPVDu (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sun, 16 Aug 2020 17:03:50 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C8C5620855;
        Sun, 16 Aug 2020 21:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597611829;
        bh=RYclrxRRZo/dETl4RLgRjPrhJr4sXQS1Jngb8HYO7RU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PpX0EdVWd+ILLvWHH0EC+id8j6ubjmi5ThnbNvj0CBjBXYQkgqOPuOzXoCFDErA13
         angLVvGfcuqmUKjn0IY07hxf2K1g1OkjLaicnGwiPYWBGwX+b3KgPCnEgl2RExmuDl
         bMkuOCaYGIxXOhYErbBDaONdI+An6NUZIT63w8to=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=wait-a-minute.lan)
        by disco-boy.misterjones.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1k7Poi-003MzJ-7L; Sun, 16 Aug 2020 22:03:48 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Lokesh Vutla <lokeshvutla@ti.com>, Rob Herring <robh+dt@kernel.org>
Cc:     Nishanth Menon <nm@ti.com>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        Sekhar Nori <nsekhar@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Tero Kristo <t-kristo@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v6 00/13] irqchip: ti, sci-intr/inta: Update the dt bindings to accept different interrupt parents
Date:   Sun, 16 Aug 2020 22:03:27 +0100
Message-Id: <159761176350.113206.9390488246050456819.b4-ty@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200806074826.24607-1-lokeshvutla@ti.com>
References: <20200806074826.24607-1-lokeshvutla@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: lokeshvutla@ti.com, robh+dt@kernel.org, nm@ti.com, devicetree@vger.kernel.org, nsekhar@ti.com, grygorii.strashko@ti.com, peter.ujfalusi@ti.com, t-kristo@ti.com, ssantosh@kernel.org, linux-arm-kernel@lists.infradead.org, tglx@linutronix.de
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, 6 Aug 2020 13:18:13 +0530, Lokesh Vutla wrote:
> 	This is continuation of the RFC patches[0] regarding the driver
> updates to support for following interrupt parent connection:
> - INTR -> INTR
> - INTA -> GICv3
> The current existing driver assumes that INTR is always connected to
> GICv3 and INTA is always connected to INTR.
> 
> [...]

Applied to irq/irqchip-next, thanks!

[01/13] firmware: ti_sci: Drop the device id to resource type translation
        commit: 4473171db68fe9e3de3f2bc68a00527f23852ad8
[02/13] firmware: ti_sci: Drop unused structure ti_sci_rm_type_map
        commit: 9b98e02a3d369c5d0875338ea0717030471b5210
[03/13] firmware: ti_sci: Add support for getting resource with subtype
        commit: 53bf2b0e4e4c1ff0a957474237f9dcd20036ca54
[04/13] dt-bindings: irqchip: ti, sci-intr: Update bindings to drop the usage of gic as parent
        commit: 9a8e2ae71f3553f1b6cd4e3681f04e5d0f147387
[05/13] dt-bindings: irqchip: Convert ti, sci-intr bindings to yaml
        commit: b8713af858997c3df5bc5b48e66ac1f1bfe19779
[06/13] irqchip/ti-sci-intr: Add support for INTR being a parent to INTR
        commit: a5b659bd4bc7518a8e45fda5256c5e5e8d3b7c49
[07/13] dt-bindings: irqchip: ti, sci-inta: Update docs to support different parent.
        commit: 6dde29dc31aa265a79d9e6b3571987cfa4b179cc
[08/13] dt-bindings: irqchip: Convert ti, sci-inta bindings to yaml
        commit: c4dff06e79d99691f18dfc8a61a1cb17c602a025
[09/13] irqchip/ti-sci-inta: Do not store TISCI device id in platform device id field
        commit: 7206f3149b8198c65a0ca8c01bfa1d8ace27bf91
[10/13] irqchip/ti-sci-inta: Add support for INTA directly connecting to GIC
        commit: 5c4b585d29102c7e6a6217112bbf1be774795cd7
[11/13] arm64: dts: k3-j721e: ti-sci-inta/intr: Update to latest bindings
        commit: 8d523f096da53598c271b5b69fcacb48779884a3
[12/13] arm64: dts: k3-am65: ti-sci-inta/intr: Update to latest bindings
        commit: fef845122f6c3c92178e4e4a1f85cce84dca06fe
[13/13] arm64: dts: k3-am65: Update the RM resource types
        commit: 6da45875fa174d9db238ea0d6846061e68b41b6d

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.


