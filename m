Return-Path: <SRS0=XuEv=ZT=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA094C432C0
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 Nov 2019 08:30:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9CFA02064B
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 Nov 2019 08:30:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="pOxZ0vhn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726133AbfK0Ia6 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 27 Nov 2019 03:30:58 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:48546 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726125AbfK0Ia6 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 27 Nov 2019 03:30:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=1gFNlgNOSnR66gWzH4fYHdin8kbE1278rKR1emq0gec=; b=pOxZ0vhnMYfvcJg0U+rRkLSbv
        dPZyfScDQa6+d2ziJ8t2tkvq4FMnsQ5d3uMt66JGx/5heOBLRQtjwRAcCdbK4Oj0MbTTLbPLyeZb6
        DxgPK4UPmkR8ibxgRuFMrlh7ot+zriv6NPccM1WEq32JVF0ycGhToJ863ETv9YQaNDJu6aJOjm15R
        z8G5c3UCVgePvhx3Kp8fp2PserqN1lQkhDgiUd+a+VFHBf0gHHtEh2xdQnLIEscBbvN3rGTJJoUA/
        5ABqKrN9EJ4JyT9RCUEP8Bk1A2H5PhfV10bpgooSyATaY7QbR5/OZ/t+r4JxvakV7T3j99ZTYe2Mn
        IScQE1B1w==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iZsit-0007D9-HQ; Wed, 27 Nov 2019 08:30:55 +0000
Date:   Wed, 27 Nov 2019 00:30:55 -0800
From:   Christoph Hellwig <hch@infradead.org>
To:     Haren Myneni <haren@linux.vnet.ibm.com>
Cc:     linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
        mpe@ellerman.id.au, npiggin@gmail.com, mikey@neuling.org,
        herbert@gondor.apana.org.au, sukadev@linux.vnet.ibm.com
Subject: Re: [PATCH 03/14] powerpc/vas: Define nx_fault_stamp in
 coprocessor_request_block
Message-ID: <20191127083055.GB17097@infradead.org>
References: <1574816676.13250.8.camel@hbabu-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1574816676.13250.8.camel@hbabu-laptop>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

> +#define crb_csb_addr(c)		__be64_to_cpu(c->csb_addr)
> +#define crb_nx_fault_addr(c)	__be64_to_cpu(c->stamp.nx.fault_storage_addr)
> +#define crb_nx_flags(c)		c->stamp.nx.flags
> +#define crb_nx_fault_status(c)	c->stamp.nx.fault_status

Except for crb_nx_fault_addr all these macros are unused, and
crb_nx_fault_addr probably makes more sense open coded in the only
caller.

Also please don't use the __ prefixed byte swap helpers in any driver
or arch code.

> +
> +static inline uint32_t crb_nx_pswid(struct coprocessor_request_block *crb)
> +{
> +	return __be32_to_cpu(crb->stamp.nx.pswid);
> +}

Same here.  Also not sure what the point of the helper is except for
obsfucating the code.
