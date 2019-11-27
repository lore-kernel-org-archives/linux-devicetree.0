Return-Path: <SRS0=XuEv=ZT=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B31C1C432C0
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 Nov 2019 08:46:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 850DA2070B
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 Nov 2019 08:46:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="FlP8wRbW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726143AbfK0IqL (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 27 Nov 2019 03:46:11 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:52436 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726092AbfK0IqK (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 27 Nov 2019 03:46:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=wXWwhpdRgill+QTPv3BKJAOvN43996rdTBF/4swV0U8=; b=FlP8wRbWl0zj7De91vYcG2C79
        PtfKLaPfuDNa6KpnRDxy0fS5CW1/WBC2QkzQdd3uwh00blaoP5j6+Gl3q+8O5JAk1I6ZbMUw/6A9o
        nYbRLjeK55ePNl8E4uj7o/U6veOHatkgw21qb4KqNQ4LrWUEc7m9JskRcraUsIIN+tpBmLSCvBlDK
        VwFAaFCzk91GCmZy3kLOJE+KapzZfmNa5Po0POQ8t/IXUMaARP96Hb+bhdUFoS7Elk2eV0FvaeYMC
        IEUnpzVwhlU5PX93IiFvjMUpHXzTxc+v+I/7xQ4KoeAK9WPm/QVieEpBXdbv2bG9/FBJ4Q4ssTccI
        4ON2vYmfA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iZsxd-0003st-AT; Wed, 27 Nov 2019 08:46:09 +0000
Date:   Wed, 27 Nov 2019 00:46:09 -0800
From:   Christoph Hellwig <hch@infradead.org>
To:     Haren Myneni <haren@linux.vnet.ibm.com>
Cc:     linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
        mpe@ellerman.id.au, npiggin@gmail.com, mikey@neuling.org,
        herbert@gondor.apana.org.au, sukadev@linux.vnet.ibm.com
Subject: Re: [PATCH 09/14] powerpc/vas: Update CSB and notify process for
 fault CRBs
Message-ID: <20191127084609.GF17097@infradead.org>
References: <1574817074.13250.16.camel@hbabu-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1574817074.13250.16.camel@hbabu-laptop>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

>  
> +static void notify_process(pid_t pid, u64 fault_addr)
> +{
> +	int rc;
> +	struct kernel_siginfo info;
> +
> +	memset(&info, 0, sizeof(info));
> +
> +	info.si_signo = SIGSEGV;
> +	info.si_errno = EFAULT;
> +	info.si_code = SEGV_MAPERR;
> +
> +	info.si_addr = (void *)fault_addr;
> +	rcu_read_lock();
> +	rc = kill_pid_info(SIGSEGV, &info, find_vpid(pid));
> +	rcu_read_unlock();
> +
> +	pr_devel("%s(): pid %d kill_proc_info() rc %d\n", __func__, pid, rc);
> +}

Shouldn't this use force_sig_fault_to_task instead?

> +	/*
> +	 * User space passed invalid CSB address, Notify process with
> +	 * SEGV signal.
> +	 */
> +	tsk = get_pid_task(window->pid, PIDTYPE_PID);
> +	/*
> +	 * Send window will be closed after processing all NX requests
> +	 * and process exits after closing all windows. In multi-thread
> +	 * applications, thread may not exists, but does not close FD
> +	 * (means send window) upon exit. Parent thread (tgid) can use
> +	 * and close the window later.
> +	 */
> +	if (tsk) {
> +		if (tsk->flags & PF_EXITING)
> +			task_exit = 1;
> +		put_task_struct(tsk);
> +		pid = vas_window_pid(window);

The pid is later used for sending the signal again, why not keep the
reference?

> +	} else {
> +		pid = vas_window_tgid(window);
> +
> +		rcu_read_lock();
> +		tsk = find_task_by_vpid(pid);
> +		if (!tsk) {
> +			rcu_read_unlock();
> +			return;
> +		}
> +		if (tsk->flags & PF_EXITING)
> +			task_exit = 1;
> +		rcu_read_unlock();

Why does this not need a reference to the task, but the other one does?
