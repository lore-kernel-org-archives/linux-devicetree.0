Return-Path: <SRS0=XuEv=ZT=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDA0FC432C3
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 Nov 2019 08:34:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B73E52064B
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 Nov 2019 08:34:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Tx/b7gaJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726227AbfK0IeI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 27 Nov 2019 03:34:08 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:48764 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726133AbfK0IeI (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 27 Nov 2019 03:34:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=EZU/O3GtjpWL+UnXqPal9za9vytD+0VPmEAvpZuN8B4=; b=Tx/b7gaJdFWsl/0koeWcQq2G7
        Iw9lK+unW+s4V9CIeQtIPkOKVAVfnj6QhkOllBTdEwrp09TBgERvHdWETns2tIZjr9y8MPICgvp9k
        FHRI1GRK+885uwIpFTTTd/oRxFM+9De0RaB5KddTW6n5vhNP8e8ho7HiE5UWS2irJVLk/IPsbKxDp
        5lWV9DZOHRhaJRvS0n00OQTRsZmqtJB1Ct0m2CdJspIeObsaa5QB9avSogkDaAsIbI+pHQAZtXPfE
        J7/MDHvWhoySH1CiVDDdJsRATSPvowLtXsh60alS9C9mX5xwn5Iy/aeuLdeqUJb2Ff6c8NzYvZ7GC
        GpYt6zklw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iZslz-0007QK-En; Wed, 27 Nov 2019 08:34:07 +0000
Date:   Wed, 27 Nov 2019 00:34:07 -0800
From:   Christoph Hellwig <hch@infradead.org>
To:     Haren Myneni <haren@linux.vnet.ibm.com>
Cc:     linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
        mpe@ellerman.id.au, npiggin@gmail.com, mikey@neuling.org,
        herbert@gondor.apana.org.au, sukadev@linux.vnet.ibm.com
Subject: Re: [PATCH 05/14] powerpc/vas: Setup fault window per VAS instance
Message-ID: <20191127083407.GD17097@infradead.org>
References: <1574816781.13250.10.camel@hbabu-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1574816781.13250.10.camel@hbabu-laptop>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

> +/*
> + * We do not remove VAS instances. The following functions are needed
> + * when VAS hotplug is supported.
> + */
> +#if 0

Please don't add dead code to the kernel tree.
