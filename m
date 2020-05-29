Return-Path: <SRS0=jZdE=7L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D39C9C433E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 May 2020 10:18:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ACBCB207BC
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 May 2020 10:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1590747509;
	bh=1gO1/eZcCypQP2/ERBE2xRPkz/uvzqJx0ATFlqsEmQ0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=g6xcOXGMzKPeSgl/DWbpyQcKFAEHaRr8DfuI1bRJ/D8qgjggg3Q7GutESSXLLsYMO
	 FiNk4U3m8C7/7M5d55brnB3svrd2kKGboL1GGYA6oJqnbBAYVMP5ZULqfoBC0cK+Fs
	 VTeUN48uLpPhOK1RHf1Z1XYcsiUljyh4o9LelPag=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725854AbgE2KS3 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 29 May 2020 06:18:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:49016 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725601AbgE2KS2 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 29 May 2020 06:18:28 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1D7832075A;
        Fri, 29 May 2020 10:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590747508;
        bh=1gO1/eZcCypQP2/ERBE2xRPkz/uvzqJx0ATFlqsEmQ0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=CmSiG5525ab+yozhZiB84XPVzV7snokbfJF9Rtldc9iVsemZb0h2E/7sxR0sbiSAQ
         9HW8JvwQCF+b4epTSwe4rIDn1tkLcCaJEeWOrJcTLX7eIhRCnTxM32clXQIlFvzXJS
         VAAHNMY9zmUfU9+oPFoTPyUo/pQgmqfvRVhx2ahU=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1jec5q-00GF29-8i; Fri, 29 May 2020 11:18:26 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 29 May 2020 11:18:26 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Lokesh Vutla <lokeshvutla@ti.com>
Cc:     Rob Herring <robh@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Sekhar Nori <nsekhar@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Device Tree Mailing List <devicetree@vger.kernel.org>
Subject: Re: [PATCH 04/12] dt-bindings: irqchip: ti,sci-intr: Update bindings
 to drop the usage of gic as parent
In-Reply-To: <f803f646-2a55-4f15-9682-1dc616d7c714@ti.com>
References: <20200520124454.10532-1-lokeshvutla@ti.com>
 <20200520124454.10532-5-lokeshvutla@ti.com> <20200528221406.GA769073@bogus>
 <f803f646-2a55-4f15-9682-1dc616d7c714@ti.com>
User-Agent: Roundcube Webmail/1.4.4
Message-ID: <4ea8c6110a16900220a65f1d44145146@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: lokeshvutla@ti.com, robh@kernel.org, tglx@linutronix.de, nm@ti.com, t-kristo@ti.com, ssantosh@kernel.org, linux-arm-kernel@lists.infradead.org, nsekhar@ti.com, grygorii.strashko@ti.com, peter.ujfalusi@ti.com, devicetree@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 2020-05-29 11:14, Lokesh Vutla wrote:
> Hi Rob,
> 
> On 29/05/20 3:44 am, Rob Herring wrote:
>> On Wed, May 20, 2020 at 06:14:46PM +0530, Lokesh Vutla wrote:
>>> Drop the firmware related dt-bindings and use the hardware specified
>>> interrupt numbers within Interrupt Router. This ensures interrupt 
>>> router
>>> DT node need not assume any interrupt parent type.
>> 
>> I didn't like this binding to begin with, but now you're breaking
>> compatibility.
> 
> Yes, I do agree that this change is breaking backward compatibility. 
> But IMHO,
> this does cleanup of firmware specific properties from DT. Since this 
> is not
> deployed out yet in the wild market, I took the leverage of breaking 
> backward
> compatibility. Before accepting these changes from firmware team, I did
> discuss[0] with Marc on this topic.

And I assume that should anyone complain about the kernel being broken
because they have an old firmware, you'll be OK with the patches being
reverted, right?

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
