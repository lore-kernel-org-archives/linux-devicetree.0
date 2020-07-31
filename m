Return-Path: <SRS0=uLJJ=BK=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8465C433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 31 Jul 2020 17:01:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C4D4F22B3F
	for <linux-devicetree@archiver.kernel.org>; Fri, 31 Jul 2020 17:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1596214914;
	bh=MI9yttaslgvn0VhCnmpySDif5p+Ek9mJHLxtWssWvdc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=syjdjDHKMRjDrA3Z/cthZ0aSH+bU2OiRMMkZNe3y/gpKcw1iDnYt2S7b2U3hhycSo
	 ynS9ICiBpsWHyaNfiVPvynkd+pqs2G0rQp3y+6bzq2K/GUY7bsvd5mICq8T7n1VxFz
	 /54ogqVN8ADGGYXxpbj1YL6m46Sz/Dzhqq3Q806E=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732808AbgGaRBy (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 31 Jul 2020 13:01:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:53222 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729269AbgGaRBx (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 31 Jul 2020 13:01:53 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C95492245C;
        Fri, 31 Jul 2020 17:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596214912;
        bh=MI9yttaslgvn0VhCnmpySDif5p+Ek9mJHLxtWssWvdc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=o2pzEn/D4mKFHxLMrbRg5UP8TtrZVYnT/2WQDog+7YOPbHik7wW1PoRkSuhqAjLhE
         pDPq/Dpk7qA2AQnpeOnmLaNrh3GdjjlHAmJPstSWYBkkcuifbP2nmtGuVn7VvTVi73
         yf6nAdENKdpijhegUYhDPRfX47YSomtVRedDndyE=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1k1YPn-00Ga2A-8H; Fri, 31 Jul 2020 18:01:51 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 31 Jul 2020 18:01:50 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Lokesh Vutla <lokeshvutla@ti.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Sekhar Nori <nsekhar@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        Suman Anna <s-anna@ti.com>
Subject: Re: [PATCH v5 00/10] irqchip: ti, sci-intr/inta: Update the dt
 bindings to accept different interrupt parents
In-Reply-To: <20200728051735.6187-1-lokeshvutla@ti.com>
References: <20200728051735.6187-1-lokeshvutla@ti.com>
User-Agent: Roundcube Webmail/1.4.5
Message-ID: <d017863c0da4950016f6d4e7fb34d7c7@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: lokeshvutla@ti.com, robh+dt@kernel.org, tglx@linutronix.de, nm@ti.com, t-kristo@ti.com, ssantosh@kernel.org, linux-arm-kernel@lists.infradead.org, nsekhar@ti.com, grygorii.strashko@ti.com, peter.ujfalusi@ti.com, devicetree@vger.kernel.org, s-anna@ti.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 2020-07-28 06:17, Lokesh Vutla wrote:
> Hi Marc,
> 	This is continuation of the RFC patches[0] regarding the driver
> updates to support for following interrupt parent connection:
> - INTR -> INTR
> - INTA -> GICv3
> The current existing driver assumes that INTR is always connected to
> GICv3 and INTA is always connected to INTR.

I'm OK to take this if I can get an Ack from RobH on the three
DT patches that still need it.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
