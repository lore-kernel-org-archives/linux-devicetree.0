Return-Path: <SRS0=G+GX=2B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 310F5C43603
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Dec 2019 14:43:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 045C9208C3
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Dec 2019 14:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576075389;
	bh=KFfQNkUYiaxpZSkDd3vnatm8Pex2SO090xacUJWZAiY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=Qhdwns5pPGrSSNWJ86Q+LXs+qiZYqLanaiG8ntSWdED7+UpnGt87PB9T0zW54ICK2
	 /9NDs2e09icRl+oSAp9JtZJwMOt2awe0sMjUjB1JZuKADPSqCce0VP4uu+ZzY82GIq
	 ESV9q1Y/DBGBAXUFk4CcJloOuB2joXv7pbkJ30lE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729936AbfLKOnI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 11 Dec 2019 09:43:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:42606 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727554AbfLKOnI (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 11 Dec 2019 09:43:08 -0500
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 238A3208C3
        for <devicetree@vger.kernel.org>; Wed, 11 Dec 2019 14:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576075387;
        bh=KFfQNkUYiaxpZSkDd3vnatm8Pex2SO090xacUJWZAiY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=dQ8PxouxBtzSkD/SY89/t+7MH0YaHk/qZJ/WcXheUOoPTi4i3LT2jvVjkH7H/4JNe
         WkmrQPsWXOb1I0qL2zvxUgafu8XyNweH23pzBliGEN/5ZhtdnxbzKUbqA7qPfW5TU2
         3qh1cV1ilitn3shOfQag5b/pOYNlrxbS8IKhabFI=
Received: by mail-qt1-f181.google.com with SMTP id i12so5276839qtp.6
        for <devicetree@vger.kernel.org>; Wed, 11 Dec 2019 06:43:07 -0800 (PST)
X-Gm-Message-State: APjAAAW8vJ5L+ZaTCmJ9Djh01tRSeqDLMGqmSfqPwYgBX2G6QrJnQa+k
        k0qgyqY5/BGSCHEM5zg4PLlVeDeEfsApGNhbPg==
X-Google-Smtp-Source: APXvYqwD0FJIjMvjJBPmFuuENQkheeJ4wVvUF1IyxSpKbBXWh5scH8jawDRrmPS865hRVFnlCGTxYMmv78RsGKk+Too=
X-Received: by 2002:ac8:1c4e:: with SMTP id j14mr3088761qtk.300.1576075386306;
 Wed, 11 Dec 2019 06:43:06 -0800 (PST)
MIME-Version: 1.0
References: <20191129151056.o5c44lm5lb4wsr4r@linutronix.de>
 <e1f232f5-3847-a519-5cce-95a26512e82b@gmail.com> <87tv6idp37.fsf@mpe.ellerman.id.au>
 <67e1da87-7f5a-3972-bc16-28bae2350c12@gmail.com> <CAL_JsqKieG5=teL7gABPKbJOQfvoS9s-ZPF-=R0yEE_LUoy-Kw@mail.gmail.com>
 <20191205163538.mzunfrpox7jbrssl@linutronix.de> <084ed924-eaed-5232-a9f6-fe60128fe11a@gmail.com>
 <20191209133531.ykkknqmeeb36rv7l@linutronix.de> <CAL_JsqLVJi_v9yD5khLUvJHDEXFj=eXFf-CHXz30y0mYojt-Yg@mail.gmail.com>
 <c2334575-fa38-eb73-bb56-21a530e773bf@gmail.com>
In-Reply-To: <c2334575-fa38-eb73-bb56-21a530e773bf@gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 11 Dec 2019 08:42:55 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLAHjzoD67ocKf=Bv6X2S0fmC6HkezduC_61V-eeiqqTw@mail.gmail.com>
Message-ID: <CAL_JsqLAHjzoD67ocKf=Bv6X2S0fmC6HkezduC_61V-eeiqqTw@mail.gmail.com>
Subject: Re: [RFC] Efficiency of the phandle_cache on ppc64/SLOF
To:     Frank Rowand <frowand.list@gmail.com>
Cc:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        devicetree@vger.kernel.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Dec 10, 2019 at 2:17 AM Frank Rowand <frowand.list@gmail.com> wrote=
:
>
> On 12/9/19 7:51 PM, Rob Herring wrote:
> > On Mon, Dec 9, 2019 at 7:35 AM Sebastian Andrzej Siewior
> > <bigeasy@linutronix.de> wrote:
> >>
> >> On 2019-12-05 20:01:41 [-0600], Frank Rowand wrote:
> >>> Is there a memory usage issue for the systems that led to this thread=
?
> >>
> >> No, no memory issue led to this thread. I was just testing my patch an=
d
> >> I assumed that I did something wrong in the counting/lock drop/lock
> >> acquire/allocate path because the array was hardly used. So I started =
to
> >> look deeper=E2=80=A6
> >> Once I figured out everything was fine, I was curious if everyone is
> >> aware of the different phandle creation by dtc vs POWER. And I posted
> >> the mail in the thread.
> >> Once you confirmed that everything is "known / not an issue" I was rea=
dy
> >> to take off [0].
> >>
> >> Later more replies came in such as one mail [1] from Rob describing th=
e
> >> original reason with 814 phandles. _Here_ I was just surprised that 10=
24
> >> were used over 64 entries for a benefit of 60ms. I understand that thi=
s
> >> is low concern for you because that memory is released if modules are
> >> not enabled. I usually see that module support is left enabled.
> >>
> >> However, Rob suggested / asked about the fixed size array (this is how=
 I
> >> understood it):
> >> |And yes, as mentioned earlier I don't like the complexity. I didn't
> >> |from the start and I'm  I'm still of the opinion we should have a
> >> |fixed or 1 time sized true cache (i.e. smaller than total # of
> >> |phandles). That would solve the RT memory allocation and locking issu=
e
> >> |too.
> >>
> >> so I attempted to ask if we should have the fixed size array maybe
> >> with the hash_32() instead the mask. This would make my other patch
> >> obsolete because the fixed size array should not have a RT issue. The
> >> hash_32() part here would address the POWER issue where the cache is
> >> currently not used efficiently.
> >>
> >> If you want instead to keep things as-is then this is okay from my sid=
e.
> >> If you want to keep this cache off on POWER then I could contribute a
> >> patch doing so.
> >
> > It turns out there's actually a bug in the current implementation. If
> > we have multiple phandles with the same mask, then we leak node
> > references if we miss in the cache and re-assign the cache entry.
>
> Aaargh.  Patch sent.
>
> > Easily fixed I suppose, but holding a ref count for a cached entry
> > seems wrong. That means we never have a ref count of 0 on every node
> > with a phandle.
>
> It will go to zero when the cache is freed.
>
> My memory is that we free the cache as part of removing an overlay.  I'll
> verify whether my memory is correct.

Yes, as part of having entries for every phandle we release and
realloc when number of phandles changes. If the size is fixed, then we
can stop doing that. We only need to remove entries in
of_detach_node() as that should always happen before nodes are
removed, right?

Rob
