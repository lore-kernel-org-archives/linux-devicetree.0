Return-Path: <SRS0=leSB=Z7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD3E0C43603
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 13:35:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A84AE20726
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 13:35:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727438AbfLINfj convert rfc822-to-8bit (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 9 Dec 2019 08:35:39 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:38496 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727268AbfLINfj (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 9 Dec 2019 08:35:39 -0500
Received: from bigeasy by Galois.linutronix.de with local (Exim 4.80)
        (envelope-from <bigeasy@linutronix.de>)
        id 1ieJCF-0008Qz-Iv; Mon, 09 Dec 2019 14:35:31 +0100
Date:   Mon, 9 Dec 2019 14:35:31 +0100
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To:     Frank Rowand <frowand.list@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        devicetree@vger.kernel.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [RFC] Efficiency of the phandle_cache on ppc64/SLOF
Message-ID: <20191209133531.ykkknqmeeb36rv7l@linutronix.de>
References: <20191129151056.o5c44lm5lb4wsr4r@linutronix.de>
 <e1f232f5-3847-a519-5cce-95a26512e82b@gmail.com>
 <87tv6idp37.fsf@mpe.ellerman.id.au>
 <67e1da87-7f5a-3972-bc16-28bae2350c12@gmail.com>
 <CAL_JsqKieG5=teL7gABPKbJOQfvoS9s-ZPF-=R0yEE_LUoy-Kw@mail.gmail.com>
 <20191205163538.mzunfrpox7jbrssl@linutronix.de>
 <084ed924-eaed-5232-a9f6-fe60128fe11a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <084ed924-eaed-5232-a9f6-fe60128fe11a@gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 2019-12-05 20:01:41 [-0600], Frank Rowand wrote:
> Is there a memory usage issue for the systems that led to this thread?

No, no memory issue led to this thread. I was just testing my patch and
I assumed that I did something wrong in the counting/lock drop/lock
acquire/allocate path because the array was hardly used. So I started to
look deeper…
Once I figured out everything was fine, I was curious if everyone is
aware of the different phandle creation by dtc vs POWER. And I posted
the mail in the thread.
Once you confirmed that everything is "known / not an issue" I was ready
to take off [0].

Later more replies came in such as one mail [1] from Rob describing the
original reason with 814 phandles. _Here_ I was just surprised that 1024
were used over 64 entries for a benefit of 60ms. I understand that this
is low concern for you because that memory is released if modules are
not enabled. I usually see that module support is left enabled.

However, Rob suggested / asked about the fixed size array (this is how I
understood it):
|And yes, as mentioned earlier I don't like the complexity. I didn't
|from the start and I'm  I'm still of the opinion we should have a
|fixed or 1 time sized true cache (i.e. smaller than total # of
|phandles). That would solve the RT memory allocation and locking issue
|too.

so I attempted to ask if we should have the fixed size array maybe
with the hash_32() instead the mask. This would make my other patch
obsolete because the fixed size array should not have a RT issue. The
hash_32() part here would address the POWER issue where the cache is
currently not used efficiently.

If you want instead to keep things as-is then this is okay from my side.
If you want to keep this cache off on POWER then I could contribute a
patch doing so.

[0] https://lore.kernel.org/linux-devicetree/20191202110732.4dvzrro5o6zrlpax@linutronix.de/
[1] https://lore.kernel.org/linux-devicetree/CAL_JsqKieG5=teL7gABPKbJOQfvoS9s-ZPF-=R0yEE_LUoy-Kw@mail.gmail.com/
> -Frank

Sebastian
