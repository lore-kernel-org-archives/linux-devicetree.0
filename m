Return-Path: <SRS0=XuEv=ZT=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 894E7C432C3
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 Nov 2019 08:33:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 505AE2064B
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 Nov 2019 08:33:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="cWqSTQcy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726145AbfK0IdV (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 27 Nov 2019 03:33:21 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:48704 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726133AbfK0IdU (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 27 Nov 2019 03:33:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=KAwS2evld93QnkccxirHuFvfYzrD0dfwnf1KEtGZmHg=; b=cWqSTQcy6hrQ85bxKY+KLCGfa
        bKJndEereM4HSqQoVJq7zXZam3aRKu3ENJ0pmd057SKKB0PH8FSA9Ob2zTn3X2uiOtSEAMbl/xCfP
        ZhRGt128YaGoJHyySwP6GQqJ3o0l7x821PxJ1LPKMqWP3Gp4VrLI5kRRu2Am3x2mL/dW8QZk57Fe1
        q8ochN+PsGWuXY9ZjoZa9RfcV6DJH6/PFhLTz9XwyC++ljuBZK2WCVTIDf7gkUFmVYAjV2pm4092K
        5tjdAqAtqr+cqm2XNNryK2jISAq8PLL/TJ+wl0T0f2eTuK0NSH6L9fybeMmc17xbPmRq/SArXjLpC
        39YOqD96g==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iZslD-0007NO-NO; Wed, 27 Nov 2019 08:33:19 +0000
Date:   Wed, 27 Nov 2019 00:33:19 -0800
From:   Christoph Hellwig <hch@infradead.org>
To:     Haren Myneni <haren@linux.vnet.ibm.com>
Cc:     linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
        mpe@ellerman.id.au, npiggin@gmail.com, mikey@neuling.org,
        herbert@gondor.apana.org.au, sukadev@linux.vnet.ibm.com
Subject: Re: [PATCH 04/14] powerpc/vas: Setup IRQ mapping and register port
 for each window
Message-ID: <20191127083319.GC17097@infradead.org>
References: <1574816731.13250.9.camel@hbabu-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1574816731.13250.9.camel@hbabu-laptop>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

> +static irqreturn_t vas_irq_handler(int virq, void *data)
> +{
> +	struct vas_instance *vinst = data;
> +
> +	pr_devel("VAS %d: virq %d\n", vinst->vas_id, virq);
> +
> +	return IRQ_HANDLED;
> +}

An empty interrupt handler is rather pointless.  It later grows code,
but adding it without that is a bad idea.  Please squash the patches
into sesible chunks.
