Return-Path: <SRS0=pYa2=ZY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A027C432C0
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Dec 2019 11:07:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0FACF20748
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Dec 2019 11:07:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726330AbfLBLHg (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 2 Dec 2019 06:07:36 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:52148 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726276AbfLBLHg (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 2 Dec 2019 06:07:36 -0500
Received: from bigeasy by Galois.linutronix.de with local (Exim 4.80)
        (envelope-from <bigeasy@linutronix.de>)
        id 1ibjYC-00082U-NC; Mon, 02 Dec 2019 12:07:32 +0100
Date:   Mon, 2 Dec 2019 12:07:32 +0100
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To:     Frank Rowand <frowand.list@gmail.com>
Cc:     devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Rob Herring <robh+dt@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [RFC] Efficiency of the phandle_cache on ppc64/SLOF
Message-ID: <20191202110732.4dvzrro5o6zrlpax@linutronix.de>
References: <20191129151056.o5c44lm5lb4wsr4r@linutronix.de>
 <e1f232f5-3847-a519-5cce-95a26512e82b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e1f232f5-3847-a519-5cce-95a26512e82b@gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 2019-11-29 20:14:47 [-0600], Frank Rowand wrote:
> The hash used is based on the assumptions you noted, and as stated in the
> code, that phandle property values are in a contiguous range of 1..n
> (not starting from zero), which is what dtc generates.
> 
> We knew that for systems that do not match the assumptions that the hash
> will not be optimal.  Unless there is a serious performance problem for
> such systems, I do not want to make the phandle hash code more complicated
> to optimize for these cases.  And the pseries have been performing ok
> without phandle related performance issues that I remember hearing since
> before the cache was added, which could have only helped the performance.
> Yes, if your observations are correct, some memory is being wasted, but
> a 64 entry cache is not very large on a pseries.

okay, so it is nothing new and everyone is aware of the situation. I
move on then :)

> -Frank

Sebastian
