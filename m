Return-Path: <SRS0=PToE=Z3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 779D5C43603
	for <linux-devicetree@archiver.kernel.org>; Thu,  5 Dec 2019 16:35:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5202320801
	for <linux-devicetree@archiver.kernel.org>; Thu,  5 Dec 2019 16:35:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729187AbfLEQfp (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 5 Dec 2019 11:35:45 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:59480 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729145AbfLEQfp (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 5 Dec 2019 11:35:45 -0500
Received: from bigeasy by Galois.linutronix.de with local (Exim 4.80)
        (envelope-from <bigeasy@linutronix.de>)
        id 1icu6M-0005rG-Ff; Thu, 05 Dec 2019 17:35:38 +0100
Date:   Thu, 5 Dec 2019 17:35:38 +0100
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        devicetree@vger.kernel.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [RFC] Efficiency of the phandle_cache on ppc64/SLOF
Message-ID: <20191205163538.mzunfrpox7jbrssl@linutronix.de>
References: <20191129151056.o5c44lm5lb4wsr4r@linutronix.de>
 <e1f232f5-3847-a519-5cce-95a26512e82b@gmail.com>
 <87tv6idp37.fsf@mpe.ellerman.id.au>
 <67e1da87-7f5a-3972-bc16-28bae2350c12@gmail.com>
 <CAL_JsqKieG5=teL7gABPKbJOQfvoS9s-ZPF-=R0yEE_LUoy-Kw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAL_JsqKieG5=teL7gABPKbJOQfvoS9s-ZPF-=R0yEE_LUoy-Kw@mail.gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 2019-12-03 10:56:35 [-0600], Rob Herring wrote:
> > Another possibility would be to make the cache be dependent
> > upon not CONFIG_PPC.  It might be possible to disable the
> > cache with a minimal code change.
> 
> I'd rather not do that.
> 
> And yes, as mentioned earlier I don't like the complexity. I didn't
> from the start and I'm  I'm still of the opinion we should have a
> fixed or 1 time sized true cache (i.e. smaller than total # of
> phandles). That would solve the RT memory allocation and locking issue
> too.
> 
> For reference, the performance difference between the current
> implementation (assuming fixes haven't regressed it) was ~400ms vs. a
> ~340ms improvement with a 64 entry cache (using a mask, not a hash).
> IMO, 340ms improvement was good enough.

Okay. So the 814 phandles would result in an array with 1024 slots. That
would need 4KiB of memory.
What about we go back to the fix 64 slots array but with hash32 for the
lookup? Without the hash we would be 60ms slower during boot (compared
to now, based on ancient data) but then the hash isn't expensive so we
end up with better coverage of the memory on systems which don't have a
plain enumeration of the phandle.

> Rob

Sebastian
