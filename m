Return-Path: <SRS0=QTuQ=ZD=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=3.0
	tests=BUG6152_INVALID_DATE_TZ_ABSURD,DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,INVALID_DATE_TZ_ABSURD,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4919C43331
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 Nov 2019 10:52:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 771A821655
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 Nov 2019 10:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573469536;
	bh=8ZjP3IKXMpKDrsw+7Gt+dzi/Jr36DIQal2nXCXKhNdA=;
	h=To:Subject:Date:From:Cc:In-Reply-To:References:List-ID:From;
	b=MfnYNqhX93aRsbbtbCm2cSWyzw4Wqd8qd1eMr5Hx7sBvtkYqw4jdFDovrsCF/GHih
	 5QtY0BqIFisjI8gr7twMuNUWon4gqi7diO3NZUm0mj4g52aNVvhcAQ2WZ+6qJKAzUk
	 t6sfpTFx3Tjw26OWqvI7vZG19q2eYGWiQw9SaSHQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726845AbfKKKwP (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 11 Nov 2019 05:52:15 -0500
Received: from inca-roads.misterjones.org ([213.251.177.50]:41504 "EHLO
        inca-roads.misterjones.org" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726832AbfKKKwP (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Mon, 11 Nov 2019 05:52:15 -0500
Received: from www-data by cheepnis.misterjones.org with local (Exim 4.80)
        (envelope-from <maz@kernel.org>)
        id 1iU7Io-0008PX-1f; Mon, 11 Nov 2019 11:52:10 +0100
To:     Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v3 0/5] irqchip/irq-bcm7038-l1 updates
X-PHP-Originating-Script: 0:main.inc
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 11 Nov 2019 12:01:30 +0109
From:   Marc Zyngier <maz@kernel.org>
Cc:     <linux-kernel@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <bcm-kernel-feedback-list@broadcom.com>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
In-Reply-To: <20191024201415.23454-1-f.fainelli@gmail.com>
References: <20191024201415.23454-1-f.fainelli@gmail.com>
Message-ID: <12f7194ba09174ad8ebd55f15ce05353@www.loen.fr>
X-Sender: maz@kernel.org
User-Agent: Roundcube Webmail/0.7.2
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Rcpt-To: f.fainelli@gmail.com, linux-kernel@vger.kernel.org, tglx@linutronix.de, jason@lakedaemon.net, robh+dt@kernel.org, mark.rutland@arm.com, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on cheepnis.misterjones.org); SAEximRunCond expanded to false
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 2019-10-24 21:23, Florian Fainelli wrote:
> Hi Marc, Jason, Thomas,
>
> This patch series contains some updates from our internal tree to
> support power management and allow configuring specific instances of 
> the
> brcm,bcm7038-l1-intc to leave some interrupts untouched and how the
> firmware might have configured them.

Applied to irqchip-next.

         M.
-- 
Jazz is not dead. It just smells funny...
