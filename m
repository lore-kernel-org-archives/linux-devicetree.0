Return-Path: <SRS0=AZXu=44=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D934C0044D
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Mar 2020 20:39:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 329C020749
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Mar 2020 20:39:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="O4bzP4Dj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729279AbgCKUjK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 11 Mar 2020 16:39:10 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:38701 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726684AbgCKUjK (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 11 Mar 2020 16:39:10 -0400
Received: by mail-pg1-f194.google.com with SMTP id x7so1820814pgh.5
        for <devicetree@vger.kernel.org>; Wed, 11 Mar 2020 13:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MKo4FCyqh6vtW+5c6mxtnuhZAubvHTQpMKiiAxh7tuI=;
        b=O4bzP4DjZ08QYFKwHqo8c4XW2FtefaK9CGLJpBj1GYcrlAhUfS6VwrkKbZT213AY7M
         PY37/jtPN02Fn6s94MTnjWzHtQZiWnswdiLg9UK3F3ZG0Raw+Ioeq1awXVI0TWHk0nhz
         CVmB+gAlnWJx/lEqCAfdJUekI7DxSQ5Nzt1080nee9ByRS2llspdq5/wP0FpnWwehgzN
         adJO+Owtibx4Q3XHQShbO1vvDna9JvoQ4Hm5mHgJHInaiPvqdS1IaKM/QrouELzLPDyW
         +3iHh6RLFko8KWIykHlkvojnQx8Mescrn8xcObC99GW1rL9OuPIw3gEJfPVE79IKbsLC
         QIRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MKo4FCyqh6vtW+5c6mxtnuhZAubvHTQpMKiiAxh7tuI=;
        b=n6ipEwQTyr1WBMAsK0VsB8riRBwAiaeKksiL6S+Bfzs+wJYk+/ofW8NplKx84iXSwU
         oA+206pt5oSjKizV48L2FQJYIaHie7PfjNpwaVwbXG+o2oUY9qrNvPG6i4kaIJms9Fm7
         DFWXq+CS9iaN0gtRbFiKzAnvneJ2goNFqR0HvoAswF3LtA9Pw/E2sJzKp+sMjhMb8ARU
         zLoN4NcgocUQRD+Pfq6QZhQ+dbvQwEtaFZboZOuPBhDAXVX7UIxL8oa/9xL1qGfs6u8Q
         C+kTTfyIkmF4vXdvp+RSa4kSBxNqKUP7F6XorR3eF++CaKGdHbGgimvOZOoqGuZMAG6W
         hsPg==
X-Gm-Message-State: ANhLgQ09IASLCudvK8RFuPVKt1zpzqbEKQKWOaIC095Da7UgcBVOJdG/
        kfaxN5vAiLD+mNX1dHFmnvZrSY5I6pTId5/2jV3uaA==
X-Google-Smtp-Source: ADFU+vsiq4xYRV5uV6A1+VeJHOK2HZiP2yakyYQvamWM7RiULl3dN0Hejab8pD8EF/XayEfP0MGLPU0kQrzQSjLyrYQ=
X-Received: by 2002:aa7:87ca:: with SMTP id i10mr4541507pfo.169.1583959147355;
 Wed, 11 Mar 2020 13:39:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200310075328.GA17573@ubuntu-m2-xlarge-x86>
In-Reply-To: <20200310075328.GA17573@ubuntu-m2-xlarge-x86>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 11 Mar 2020 13:38:55 -0700
Message-ID: <CAKwvOd=kZgBhZQ-ahCZsNrHEL7VPqnK4w5i7G2_j829SuPXt4g@mail.gmail.com>
Subject: Re: Error in dtc around -fno-common
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Bumping this thread.  It would be good to send this as a fixup for the
next -rc if possible, that way we can start backporting it to -stable.

On Tue, Mar 10, 2020 at 12:53 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> Hi all,
>
> GCC 10 is defaulting to -fno-common and Clang has decided to join it [1],
> which will completely turn our CI [2] red across the board when our
> compiler uprevs in the current tree's state:
>
> ld.lld: error: duplicate symbol: yylloc
> >>> defined at dtc-lexer.lex.c
> >>>            scripts/dtc/dtc-lexer.lex.o:(yylloc)
> >>> defined at dtc-parser.tab.c
> >>>            scripts/dtc/dtc-parser.tab.o:(.bss+0x10)
> clang-11: error: linker command failed with exit code 1 (use -v to see
> invocation)
>
> Is it possible to pick a single patch from dtc and get it fast tracked
> to mainline/stable so that this does not happen? It would be this one:
>
> https://git.kernel.org/pub/scm/utils/dtc/dtc.git/commit/?id=0e9225eb0dfec51def612b928d2f1836b092bc7e
>
> I have tested it and it works fine. If that is not possible, how would
> you recommend solving this issue?
>
> [1]: https://github.com/llvm/llvm-project/commit/3d9a0445cce368b55dc3a573bc91fe902bbb977f
> [2]: https://travis-ci.com/ClangBuiltLinux/continuous-integration/builds/152428887
>
> Cheers,
> Nathan
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20200310075328.GA17573%40ubuntu-m2-xlarge-x86.



-- 
Thanks,
~Nick Desaulniers
