Return-Path: <SRS0=7Os6=BE=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E77BBC433E0
	for <linux-devicetree@archiver.kernel.org>; Sat, 25 Jul 2020 14:42:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BD16D2070E
	for <linux-devicetree@archiver.kernel.org>; Sat, 25 Jul 2020 14:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1595688167;
	bh=7ZD7iGe1bVQVPcYICPx/F6qdNS1AB+CvnrItQ4eJvAM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=pGvWoyVy6+U8z9fTX817/hun4957VsFgp+tQqn0UKnVDS+lFQ5by0eyTzxOTouFZa
	 7ApDg3tyn4ZODbjIe4vNCOPJunY6+kuyUI3z/wzbnkHiI+mLljFLOutU6RaK8P0pdF
	 VskGwCSr+4JSoCLvuoOeYWvV7Kj5Cf+DlAIU6c/Y=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726944AbgGYOmr (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 25 Jul 2020 10:42:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:48974 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726652AbgGYOmr (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sat, 25 Jul 2020 10:42:47 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1F90320674;
        Sat, 25 Jul 2020 14:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595688166;
        bh=7ZD7iGe1bVQVPcYICPx/F6qdNS1AB+CvnrItQ4eJvAM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=maFYJdi5cNG71IRRw8530NvoWI59rgCxC98K4czY8TcqqTccQIF2OYKa2V5ncGzVg
         oVSzcoNl9vV3Wy/rlFDTj0Xr6num6TIdGINVXgcxy2O9v24fWoz6zcCzI8rhWYx+r+
         uQdOeBFlpPqw2+WzXSUrDT6/zHR8rhtkOsk70GO0=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1jzLNs-00ErHQ-NG; Sat, 25 Jul 2020 15:42:44 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Sat, 25 Jul 2020 15:42:44 +0100
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
Subject: Re: [PATCH v3 6/9] irqchip/ti-sci-intr: Add support for INTR being a
 parent to INTR
In-Reply-To: <e19a84ff-d990-d87a-1df0-fd5b10654e3a@ti.com>
References: <20200724141837.4542-1-lokeshvutla@ti.com>
 <20200724141837.4542-7-lokeshvutla@ti.com> <871rkzy9i4.wl-maz@kernel.org>
 <e19a84ff-d990-d87a-1df0-fd5b10654e3a@ti.com>
User-Agent: Roundcube Webmail/1.4.5
Message-ID: <71b33062f87f66e8c865b9e80b36585c@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: lokeshvutla@ti.com, robh+dt@kernel.org, tglx@linutronix.de, nm@ti.com, t-kristo@ti.com, ssantosh@kernel.org, linux-arm-kernel@lists.infradead.org, nsekhar@ti.com, grygorii.strashko@ti.com, peter.ujfalusi@ti.com, devicetree@vger.kernel.org, s-anna@ti.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 2020-07-25 15:37, Lokesh Vutla wrote:
> On 25/07/20 7:36 pm, Marc Zyngier wrote:
>> On Fri, 24 Jul 2020 15:18:34 +0100,
>> Lokesh Vutla <lokeshvutla@ti.com> wrote:
>>> 
>>> Driver assumes that Interrupt parent to Interrupt router is always 
>>> GIC.
>>> This is not true always and an Interrupt Router can be a parent to
>>> Interrupt Router. Update the driver to detect the parent and request 
>>> the
>>> parent irqs accordingly.
>>> 
>>> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
>>> ---
>>>  drivers/irqchip/irq-ti-sci-intr.c | 150 
>>> ++++++++++++++++++------------
>>>  1 file changed, 91 insertions(+), 59 deletions(-)
>>> 
>>> diff --git a/drivers/irqchip/irq-ti-sci-intr.c 
>>> b/drivers/irqchip/irq-ti-sci-intr.c
>>> index 59d51a20bbd8..0b73816e77fc 100644
>>> --- a/drivers/irqchip/irq-ti-sci-intr.c
>>> +++ b/drivers/irqchip/irq-ti-sci-intr.c

[...]

>>> -	ret = of_property_read_u32(dev_of_node(dev), "ti,sci-dst-id",
>>> -				   &intr->dst_id);
>>> +	ret = of_property_read_u32(dev_of_node(dev), "ti,sci-dev-id",
>>> +				   &pdev->id);
>> 
>> This feels very dodgy. You are hijacking a random field in the
>> platform device data structure, which shouldn't be any of your
> 
> pdev->id is pretty much unused field today. I was kind of hoping that 
> in future
> it can be utilized to populated field with TISCI device IDs in some 
> generic
> manner. So thought of using it now.

It isn't unused. DT doesn't make active use of it for now, not that's 
not
something you can rely on.

>> business. What was wrong with having a separate field for something
>> that is obviously platform specific?
> 
> No reason. I could just add a new filed in the intr structure.

Please do.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
