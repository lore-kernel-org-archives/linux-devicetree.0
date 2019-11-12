Return-Path: <SRS0=p3dD=ZE=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.4 required=3.0
	tests=BUG6152_INVALID_DATE_TZ_ABSURD,DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,INVALID_DATE_TZ_ABSURD,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7BCCC17441
	for <linux-devicetree@archiver.kernel.org>; Tue, 12 Nov 2019 12:58:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 76E802084F
	for <linux-devicetree@archiver.kernel.org>; Tue, 12 Nov 2019 12:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573563491;
	bh=Qhg2NO1y91R7W4vj11CUpvEBmOMhp2/Sn7/22DstGSk=;
	h=To:Subject:Date:From:Cc:In-Reply-To:References:List-ID:From;
	b=wu0TIJoTyLClmqnOkVh82exhj6pcfF6PBPQIwU08h2I3uW3HBDXIKoFdjIcNsgiGY
	 6bXfKI0FeHqTwkd+NV2KwMGrlwlQHDiOM6n+sgz/xroIgq7CQ1uL6gcYbBhu1T0cG+
	 3/ntHQID5wZuwU5WpJkjiyn+CIcogKrKzPFiGKP8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727159AbfKLM6K (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 12 Nov 2019 07:58:10 -0500
Received: from inca-roads.misterjones.org ([213.251.177.50]:38479 "EHLO
        inca-roads.misterjones.org" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726912AbfKLM6K (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 12 Nov 2019 07:58:10 -0500
Received: from www-data by cheepnis.misterjones.org with local (Exim 4.80)
        (envelope-from <maz@kernel.org>)
        id 1iUVk8-0007QY-JF; Tue, 12 Nov 2019 13:58:00 +0100
To:     Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH 3/4] gpio: sifive: Add GPIO driver for SiFive SoCs
X-PHP-Originating-Script: 0:main.inc
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 12 Nov 2019 14:07:21 +0109
From:   Marc Zyngier <maz@kernel.org>
Cc:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>, <palmer@dabbelt.com>,
        "Paul Walmsley ( Sifive)" <paul.walmsley@sifive.com>,
        <aou@eecs.berkeley.edu>, <tglx@linutronix.de>,
        <jason@lakedaemon.net>, <bmeng.cn@gmail.com>,
        <atish.patra@wdc.com>, Sagar Kadam <sagar.kadam@sifive.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Sachin Ghadi <sachin.ghadi@sifive.com>
In-Reply-To: <1573560684-48104-4-git-send-email-yash.shah@sifive.com>
References: <1573560684-48104-1-git-send-email-yash.shah@sifive.com>
 <1573560684-48104-4-git-send-email-yash.shah@sifive.com>
Message-ID: <d82620dd33bdd6bb4d34e49600a506d1@www.loen.fr>
X-Sender: maz@kernel.org
User-Agent: Roundcube Webmail/0.7.2
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Rcpt-To: yash.shah@sifive.com, linus.walleij@linaro.org, bgolaszewski@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com, palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu, tglx@linutronix.de, jason@lakedaemon.net, bmeng.cn@gmail.com, atish.patra@wdc.com, sagar.kadam@sifive.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, sachin.ghadi@sifive.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on cheepnis.misterjones.org); SAEximRunCond expanded to false
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 2019-11-12 13:21, Yash Shah wrote:
> Adds the GPIO driver for SiFive RISC-V SoCs.
>
> Signed-off-by: Wesley W. Terpstra <wesley@sifive.com>
> [Atish: Various fixes and code cleanup]
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Signed-off-by: Yash Shah <yash.shah@sifive.com>

[...]

> +static int sifive_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
> +					     unsigned int child,
> +					     unsigned int child_type,
> +					     unsigned int *parent,
> +					     unsigned int *parent_type)
> +{
> +	/* All these interrupts are level high in the CPU */
> +	*parent_type = IRQ_TYPE_LEVEL_HIGH;

It is bizare that you enforce LEVEL_HIGH here, while setting it to NONE
in the PLIC driver. These things should be consistent.

> +	*parent = child + 7;

Irk, magic numbers...

         M.
-- 
Jazz is not dead. It just smells funny...
