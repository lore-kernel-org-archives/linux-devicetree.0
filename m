Return-Path: <SRS0=B/fR=Z4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FF77C43603
	for <linux-devicetree@archiver.kernel.org>; Fri,  6 Dec 2019 23:41:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 52B7224670
	for <linux-devicetree@archiver.kernel.org>; Fri,  6 Dec 2019 23:41:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726377AbfLFXlK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 6 Dec 2019 18:41:10 -0500
Received: from gate.crashing.org ([63.228.1.57]:53978 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726371AbfLFXlK (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 6 Dec 2019 18:41:10 -0500
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id xB6NeZ43027638;
        Fri, 6 Dec 2019 17:40:35 -0600
Received: (from segher@localhost)
        by gate.crashing.org (8.14.1/8.14.1/Submit) id xB6NeYbA027637;
        Fri, 6 Dec 2019 17:40:34 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date:   Fri, 6 Dec 2019 17:40:34 -0600
From:   Segher Boessenkool <segher@kernel.crashing.org>
To:     Frank Rowand <frowand.list@gmail.com>
Cc:     Michael Ellerman <mpe@ellerman.id.au>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Rob Herring <robh+dt@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [RFC] Efficiency of the phandle_cache on ppc64/SLOF
Message-ID: <20191206234034.GW3152@gate.crashing.org>
References: <20191129151056.o5c44lm5lb4wsr4r@linutronix.de> <87wobedpit.fsf@mpe.ellerman.id.au> <20191203183531.GT24609@gate.crashing.org> <493a7da7-774c-1515-b43a-80d72c9d3c19@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <493a7da7-774c-1515-b43a-80d72c9d3c19@gmail.com>
User-Agent: Mutt/1.4.2.3i
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Thu, Dec 05, 2019 at 07:37:24PM -0600, Frank Rowand wrote:
> On 12/3/19 12:35 PM, Segher Boessenkool wrote:
> > Btw.  Some OFs mangle the phandles some way, to make it easier to catch
> > people using it as an address (and similarly, mangle ihandles differently,
> > so you catch confusion between ihandles and phandles as well).  Like a
> > simple xor, with some odd number preferably.  You should assume *nothing*
> > about phandles, they are opaque identifiers.
> 
> For arm32 machines that use dtc to generate the devicetree, which is a
> very large user base, we certainly can make assumptions about phandles.

I was talking about OF.  Phandles are explicitly defined to be opaque
tokens.  If there is an extra meaning to them in flattened device trees,
well, the kernel should then only depend on that there, not for more
general phandles.  Where is this documented btw?

> Especially because the complaints about the overhead of phandle based
> lookups have been voiced by users of this specific set of machines.
> 
> For systems with a devicetree that does not follow the assumptions, the
> phandle cache should not measurably increase the overhead of phandle
> based lookups.

It's an extra memory access and extra code to execute, for not much gain
(if anything).  While with a reasonable hash function it will be good
for everyone.

> If you have measurements of a system where implementing the phandle
> cache increased the overhead,

Are you seriously saying you think this code can run in zero time and
space on most systems?

> and the additional overhead is a concern
> (such as significantly increasing boot time) then please share that
> information with us.  Otherwise this is just a theoretical exercise.

The point is that this code could be easily beneficial for most (or all)
users, not just those that use dtc-constructed device trees.  It is
completely obvious that having a worse cache hash function results in
many more lookups.  Whether that results in something expressed as
milliseconds on tiny systems or microseconds on bigger systems is
completely beside the point.


Segher
