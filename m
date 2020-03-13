Return-Path: <SRS0=byNV=46=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B59E7C10DCE
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Mar 2020 13:33:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 87839206B7
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Mar 2020 13:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1584106418;
	bh=l8U+8aHhrar7mg/KqO8pqCVSgVfpmnBDyos6OlNO7D8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=HQWSDceOUwwz8wCfCSqQ7reY1qpbnUYkvP3/Gtm+4YjYJw7y9ST1WeOgwGDlT6odp
	 4MYluTD0mf7swzQ8Dig1Nc430fC/mA8iQsfr9uj5ioLAYgzf4NFM+CvzJwgbtddS2n
	 aaja/WLerC88mRT/AVVsnXGEDYrJFFu4R8RfcKpY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbgCMNdi (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 13 Mar 2020 09:33:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:48126 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726323AbgCMNdi (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 13 Mar 2020 09:33:38 -0400
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2593020749
        for <devicetree@vger.kernel.org>; Fri, 13 Mar 2020 13:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584106417;
        bh=l8U+8aHhrar7mg/KqO8pqCVSgVfpmnBDyos6OlNO7D8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=hnmdcljWAX9TWTiQOZ6hZ2ovWYD8sLQyKDZ8BooaTrX7t9ShqvwBC0RS03j3BX/xz
         iQ2nOQ6NEDcwltYoH7gFtAkt3uTxPfrLYmwX7jHWLmVL5BoUsbvq9vcNIbJK8OIBtU
         1aPng7I7ZZrmrsJE0R3GZ8T0SkkEE+/cSDRf39uo=
Received: by mail-qt1-f169.google.com with SMTP id n5so7448657qtv.7
        for <devicetree@vger.kernel.org>; Fri, 13 Mar 2020 06:33:37 -0700 (PDT)
X-Gm-Message-State: ANhLgQ3n5eI4cimMKaSZdFg0n9V25/iY0j9xHzs6yYuSieHMJaX6xUqe
        uXQaxrBfO0kneKLlXz/QXKRDCja+8c7rlWZ/pw==
X-Google-Smtp-Source: ADFU+vsylZxzNVEqLyvcPV7b7dZ+UdsRAwweyzgzwHZsKhPdoIg055+c8EtqTUzhZwMm7JnuKuc7YXVFxJo8MeUfWN0=
X-Received: by 2002:ac8:554a:: with SMTP id o10mr12668117qtr.224.1584106416226;
 Fri, 13 Mar 2020 06:33:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200310075328.GA17573@ubuntu-m2-xlarge-x86> <CAKwvOd=kZgBhZQ-ahCZsNrHEL7VPqnK4w5i7G2_j829SuPXt4g@mail.gmail.com>
In-Reply-To: <CAKwvOd=kZgBhZQ-ahCZsNrHEL7VPqnK4w5i7G2_j829SuPXt4g@mail.gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 13 Mar 2020 08:33:24 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+NFH9gzNivv5zjrrvd_4DHPqE+ZYkb29fi9BeK6FnM8Q@mail.gmail.com>
Message-ID: <CAL_Jsq+NFH9gzNivv5zjrrvd_4DHPqE+ZYkb29fi9BeK6FnM8Q@mail.gmail.com>
Subject: Re: Error in dtc around -fno-common
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Nathan Chancellor <natechancellor@gmail.com>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Mar 11, 2020 at 3:39 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> Bumping this thread.  It would be good to send this as a fixup for the
> next -rc if possible, that way we can start backporting it to -stable.

The single fix is in my tree now and I'll sync dtc for 5.7.

Rob

> On Tue, Mar 10, 2020 at 12:53 AM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> >
> > Hi all,
> >
> > GCC 10 is defaulting to -fno-common and Clang has decided to join it [1],
> > which will completely turn our CI [2] red across the board when our
> > compiler uprevs in the current tree's state:
> >
> > ld.lld: error: duplicate symbol: yylloc
> > >>> defined at dtc-lexer.lex.c
> > >>>            scripts/dtc/dtc-lexer.lex.o:(yylloc)
> > >>> defined at dtc-parser.tab.c
> > >>>            scripts/dtc/dtc-parser.tab.o:(.bss+0x10)
> > clang-11: error: linker command failed with exit code 1 (use -v to see
> > invocation)
> >
> > Is it possible to pick a single patch from dtc and get it fast tracked
> > to mainline/stable so that this does not happen? It would be this one:
> >
> > https://git.kernel.org/pub/scm/utils/dtc/dtc.git/commit/?id=0e9225eb0dfec51def612b928d2f1836b092bc7e


> >
> > I have tested it and it works fine. If that is not possible, how would
> > you recommend solving this issue?
> >
> > [1]: https://github.com/llvm/llvm-project/commit/3d9a0445cce368b55dc3a573bc91fe902bbb977f
> > [2]: https://travis-ci.com/ClangBuiltLinux/continuous-integration/builds/152428887
> >
> > Cheers,
> > Nathan
> >
> > --
> > You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> > To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> > To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20200310075328.GA17573%40ubuntu-m2-xlarge-x86.
>
>
>
> --
> Thanks,
> ~Nick Desaulniers
