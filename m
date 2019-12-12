Return-Path: <SRS0=GOr1=2C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C348C43603
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 13:02:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4B4922077B
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 13:02:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="g1naCWSf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729181AbfLLNCt (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 12 Dec 2019 08:02:49 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:34766 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729170AbfLLNCt (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 12 Dec 2019 08:02:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=3pJOGHohHWFavJROLCsvbbpIq2FFgge+nGlDVwdmal0=; b=g1naCWSfvuTUKXR8v95IIZSG1
        BlGiIpPknxTsRMpSnCiEmUjjYbYY9FzjMw/OXZ5oo7g14CsZKSLziBJD95QuLvreen+22baOXRWXm
        4+H9kwGV+yaNfcyLubptMXgAEZSmeMrgUylH52O1P7GVPoE6S/T6zj/Fc1QE4QqNm/rFlBt9hxJxS
        WXTX6ouKpkeSk0DpHZa4CCx1pIP/pJ+cqRFmVe/S6P7brDPVwRPn2nHMFc0g14jBdqJ/0g0kzcgQf
        LhN7COXuxzUq2rjj7s7cC1XXLGzRTUD92p3E73Q7hZNU9Xh6r481ElB36bTiT55gJ/sbLRbTOEM96
        TkWhRYC+Q==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1ifO7E-0006SH-3X; Thu, 12 Dec 2019 13:02:48 +0000
Date:   Thu, 12 Dec 2019 05:02:48 -0800
From:   Christoph Hellwig <hch@infradead.org>
To:     Haren Myneni <haren@linux.ibm.com>
Cc:     mpe@ellerman.id.au, devicetree@vger.kernel.org, mikey@neuling.org,
        herbert@gondor.apana.org.au, npiggin@gmail.com, hch@infradead.org,
        sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH V2 07/13] powerpc/vas: Take reference to PID and mm for
 user space windows
Message-ID: <20191212130248.GE3381@infradead.org>
References: <1575861522.16318.9.camel@hbabu-laptop>
 <1575862366.16318.24.camel@hbabu-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1575862366.16318.24.camel@hbabu-laptop>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

> +	if (txwin->user_win) {
> +		/*
> +		 * Window opened by child thread may not be closed when
> +		 * it exits. So take reference to its pid and release it
> +		 * when the window is free by parent thread.
> +		 * Acquire a reference to the task's pid to make sure
> +		 * pid will not be re-used.
> +		 */
> +		txwin->pid = get_task_pid(current, PIDTYPE_PID);
> +		/*
> +		 * Acquire a reference to the task's mm.
> +		 */
> +		txwin->mm = get_task_mm(current);
> +
> +		if (txwin->mm) {
> +			mmput(txwin->mm);
> +			mmgrab(txwin->mm);

Doesn't the mmgrab need to come before the mmput?

> +			mm_context_add_copro(txwin->mm);
> +		} else {
> +			put_pid(txwin->pid);
> +			pr_err("VAS: pid(%d): mm_struct is not found\n",
> +					current->pid);
> +			rc = -EPERM;
> +			goto free_window;
> +		}

Also the code is much easier to follow if you handle the error
first and avoid the else:

		txwin->mm = get_task_mm(current);
		if (!txwin->mm) {
			put_pid(txwin->pid);
			pr_err("VAS: pid(%d): mm_struct is not found\n",
					current->pid);
			rc = -EPERM;
			goto free_window;
		}
		mmgrab(txwin->mm);
		mmput(txwin->mm);

Also don't you need to take a reference to the struct pid for the
tgid as well?
