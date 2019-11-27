Return-Path: <SRS0=XuEv=ZT=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15E1CC432C0
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 Nov 2019 09:31:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CE627204FD
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 Nov 2019 09:31:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="f0sHLJDF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726149AbfK0JbN (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 27 Nov 2019 04:31:13 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:57532 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbfK0JbN (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 27 Nov 2019 04:31:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=cArTQIBcelCpnlJ0+Dvnp+KYI2DLSwY3hnmMKGiD2ZA=; b=f0sHLJDFVuqrXrSn60GR/TykB
        g0oJhOhjarhTssfVFdTxH9z+5dsOnSpvuYnj4P5U+RDEVy+ezBhb5JBnzurAiIuQCIAqlCUFt0Zrp
        NZ3I73IclRB+MkDRImn4TsK9sgHy6NElSANsfLdNh1K6wRQKWbNretq9jIMGnangWxCasTpgfmoZ3
        3+7IsRHJEEb7m/qqJwXghCaLQFIgyldmSDGBFGGI+2Uv1cVUsTk9IkIewstA8c0JXOiiJPb1Oamey
        AptQz0HuwD8ESvXAPB/JJ5zzqOhYmfzBP8CTNB20BgFR+14S4eEM55MtwhgS+UoTrSw0eb8058y9T
        qyKTZpNjg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iZtfE-0001CA-KX; Wed, 27 Nov 2019 09:31:12 +0000
Date:   Wed, 27 Nov 2019 01:31:12 -0800
From:   Christoph Hellwig <hch@infradead.org>
To:     Haren Myneni <hbabu@us.ibm.com>
Cc:     Christoph Hellwig <hch@infradead.org>, devicetree@vger.kernel.org,
        Haren Myneni <haren@linux.vnet.ibm.com>,
        herbert@gondor.apana.org.au, linuxppc-dev@lists.ozlabs.org,
        Linuxppc-dev 
        <linuxppc-dev-bounces+hbabu=us.ibm.com@lists.ozlabs.org>,
        mikey@neuling.org, npiggin@gmail.com, sukadev@linux.vnet.ibm.com
Subject: Re: [PATCH 02/14] Revert "powerpc/powernv: remove the unused
 vas_win_paste_addr and vas_win_id functions"
Message-ID: <20191127093112.GA4485@infradead.org>
References: <1574816607.13250.6.camel@hbabu-laptop>
 <20191127082810.GA17097@infradead.org>
 <OF14D260BC.48F4C927-ON002584BF.00332A80-882584BF.00335313@notes.na.collabserv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OF14D260BC.48F4C927-ON002584BF.00332A80-882584BF.00335313@notes.na.collabserv.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Nov 27, 2019 at 01:20:36AM -0800, Haren Myneni wrote:
> Thanks for the review.
> vas_win_paste_addr() will be used in NX compression driver and planning to
> post this series soon. Can I add this change later as part of this series?

Please only add core functionality and exports with the actual users.
