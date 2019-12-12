Return-Path: <SRS0=GOr1=2C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0214DC43603
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 12:55:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C30C922527
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 12:55:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="b39pNqg9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729257AbfLLMzg (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 12 Dec 2019 07:55:36 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:59454 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729221AbfLLMzg (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 12 Dec 2019 07:55:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=v9w7ihWU15mTjgE/fFnHbc0kztIj65tTjqKpkCnN/0k=; b=b39pNqg9zh8RzNZhDGNnhMIrb
        1eVGJX4Gvc/v8cfTV8kDfOa5zMSAo63cQeCCuOurtL7066N53GvzW8h/4SPtmT1duDDNDFuiIWvTg
        pju1ILDc9p1YjJO04jMgW1e4EvhRK4Q8EZvdtF4eqmfcSh4IrzjXEBfagYMPO9Za1qZIMa9+p09Un
        jJBXlhPR3K5HxgnwSkc7eDFETP7V7JwEtg+H9DrplZM7TbpE8tBSWWBzJsh4d49Rj7jVV6XG8Ng/x
        nN5UXi8DrOkVR3mIFokcd7lGVLSbgHSqbruYP45HDWPq+wCh8rKLRx5pLNWgr60lw9sptVFB6guKR
        lYSPjP+sQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1ifO0D-00047V-TQ; Thu, 12 Dec 2019 12:55:33 +0000
Date:   Thu, 12 Dec 2019 04:55:33 -0800
From:   Christoph Hellwig <hch@infradead.org>
To:     Haren Myneni <haren@linux.ibm.com>
Cc:     mpe@ellerman.id.au, devicetree@vger.kernel.org, mikey@neuling.org,
        herbert@gondor.apana.org.au, npiggin@gmail.com, hch@infradead.org,
        sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH V2 04/13] powerpc/vas: Setup fault window per VAS instance
Message-ID: <20191212125533.GC3381@infradead.org>
References: <1575861522.16318.9.camel@hbabu-laptop>
 <1575862233.16318.21.camel@hbabu-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1575862233.16318.21.camel@hbabu-laptop>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun, Dec 08, 2019 at 07:30:33PM -0800, Haren Myneni wrote:
> +static int vas_irq_fault_window_setup(struct vas_instance *vinst)
> +{
> +	int rc = 0;
> +
> +	rc = vas_setup_fault_window(vinst);
> +
> +	return rc;
> +}

No real need for the local variable here.
