Return-Path: <SRS0=XuEv=ZT=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6CB2C432C0
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 Nov 2019 08:34:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8D74720684
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 Nov 2019 08:34:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="lHlMLmry"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726135AbfK0Iet (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 27 Nov 2019 03:34:49 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:50504 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726133AbfK0Iet (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 27 Nov 2019 03:34:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=AT9UghkO4fq0I9L3pqZzFdumeW8DrClZYJcOYkMOuVM=; b=lHlMLmryIW9QLDY3Y2XQ/CvtD
        rNORXZOyqaPdZFk/SqsGbKeBiMRJa2K20MY0RVQqyP0OOxSFxJVV3U1jvdxD5RTWGP5CfS0kGzrtm
        v5gnMqYe5bBKAs+j2qOo1wqgMHOiQ6WZUGlafUDR3dz9p8l8La/H+MOqWjRbVe+hUkT7EPdKE12Sa
        XOmfSjQQa1Unu92TCaJ1G/ta24SwhjSM7xE7rh3jiyU8QP+tdsB1kJNAxwdBUW199f9AKGpIah4P9
        vxTNMYDEx+/fxVzP9QSGovD0vU1oCyrIu6FCs9eOIopdvh/YiLJyNfYmMuGVH8ZZ/XrkWbDpVxWt9
        N8bMFSvbw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iZsmd-0007jY-FK; Wed, 27 Nov 2019 08:34:47 +0000
Date:   Wed, 27 Nov 2019 00:34:47 -0800
From:   Christoph Hellwig <hch@infradead.org>
To:     Haren Myneni <haren@linux.vnet.ibm.com>
Cc:     linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
        mpe@ellerman.id.au, npiggin@gmail.com, mikey@neuling.org,
        herbert@gondor.apana.org.au, sukadev@linux.vnet.ibm.com
Subject: Re: [PATCH 06/14] powerpc/vas: Setup fault handler per VAS instance
Message-ID: <20191127083447.GE17097@infradead.org>
References: <1574816900.13250.12.camel@hbabu-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1574816900.13250.12.camel@hbabu-laptop>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

>  
> +struct task_struct *fault_handler;
> +
> +void vas_wakeup_fault_handler(int virq, void *arg)
> +{
> +	struct vas_instance *vinst = arg;
> +
> +	atomic_inc(&vinst->pending_fault);
> +	wake_up(&vinst->fault_wq);
> +}
> +
> +/*
> + * Fault handler thread for each VAS instance and process fault CRBs.
> + */
> +static int fault_handler_func(void *arg)
> +{
> +	struct vas_instance *vinst = (struct vas_instance *)arg;
> +
> +	do {
> +		if (signal_pending(current))
> +			flush_signals(current);
> +
> +		wait_event_interruptible(vinst->fault_wq,
> +					atomic_read(&vinst->pending_fault) ||
> +					kthread_should_stop());
> +
> +		if (kthread_should_stop())
> +			break;
> +
> +		atomic_dec(&vinst->pending_fault);
> +	} while (!kthread_should_stop());
> +
> +	return 0;
> +}

Pleae use threaded interrupts instead of reinventing them badly.
