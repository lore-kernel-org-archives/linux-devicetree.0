Return-Path: <SRS0=JrLZ=43=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2E6BC10F27
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 07:53:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 986A024673
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 07:53:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FG/pPOCv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726268AbgCJHxc (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 10 Mar 2020 03:53:32 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:35335 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726202AbgCJHxb (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 10 Mar 2020 03:53:31 -0400
Received: by mail-ot1-f67.google.com with SMTP id k26so5004818otr.2
        for <devicetree@vger.kernel.org>; Tue, 10 Mar 2020 00:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=GgdUmVqrmUNl/36GqtzMjjhgnVBK/GAMaohqtRDmGJQ=;
        b=FG/pPOCvP74enPi9wSf34mmkt+rOQgL3BAj2YoWQpW5kFip7VgYwo0k3+Rwebid/wU
         nymeaInP9wYoCm2KjSJDdJXgMpsGXYdWAHEuRtxX2OFIiveBD29sMDPwwos8e1SdaBCg
         id52hI8VXyoburh5iVXj2zE5Pf3ID+7dmzQ4hk3lktydgEPHlHwuogpoLRiR8FbOiHeM
         P1AFajCtcxmmnYBeKDtOwdKHakUo7woKOqOLYllRnoGU08Yty613SkTeS3rfkC14EiXN
         JTTyF0OEWelksLQ5zNHSTrCwMA+aQPQmXY7wShml247XiG4EH9ICfztRGr3VZz6xJxZd
         GBIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=GgdUmVqrmUNl/36GqtzMjjhgnVBK/GAMaohqtRDmGJQ=;
        b=WSLZ2I+SwUEjE3eD07kGHrU5v++UCRr+fqAktkaNg3bhAWYq0LHLccfui9ICctLyYd
         2+F18PGaxQYpuSeRmtA5BpJjecSRlmxSSir3Zr4HHuHQBiUhbUmedAElg1bcl+r5hzPg
         ew8s0zE/nVq5jwXVcUy0H/KUOj/bCKzXpV4u8R+0k9wApBmKtOHELpNezctNAjlcyTwE
         ulsQgVWBZsvSh93Cv+2Gph/abC1lTTMCiMSkAgxhoUYvPtc79BGJUMdYKhNsTJDxTt4v
         7JgtAcI1RX4SOO7wbUSjqUGMtm9E63Ot3hxYPmzu/K8nUaYyHsdVZJgjmm3EL/+0ajk+
         cnTA==
X-Gm-Message-State: ANhLgQ3JGmp7GYTBcwcqouC/2rAKj58adhCQkJP0ThMLg8t+Hd4VcoB1
        2/yipcYeibPqEFfbyUG7enNQkrEPbsw=
X-Google-Smtp-Source: ADFU+vtaFdUp8HnME9x7aqVEkAdz2OoRT6o6Sme6m/HZ73EH5DroRU9iMKssnK32FQ5iukDMCn18uw==
X-Received: by 2002:a9d:64d4:: with SMTP id n20mr14896160otl.193.1583826810989;
        Tue, 10 Mar 2020 00:53:30 -0700 (PDT)
Received: from ubuntu-m2-xlarge-x86 ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id l15sm10976900otf.12.2020.03.10.00.53.29
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Mar 2020 00:53:30 -0700 (PDT)
Date:   Tue, 10 Mar 2020 00:53:28 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     devicetree@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: Error in dtc around -fno-common
Message-ID: <20200310075328.GA17573@ubuntu-m2-xlarge-x86>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi all,

GCC 10 is defaulting to -fno-common and Clang has decided to join it [1],
which will completely turn our CI [2] red across the board when our
compiler uprevs in the current tree's state:

ld.lld: error: duplicate symbol: yylloc
>>> defined at dtc-lexer.lex.c
>>>            scripts/dtc/dtc-lexer.lex.o:(yylloc)
>>> defined at dtc-parser.tab.c
>>>            scripts/dtc/dtc-parser.tab.o:(.bss+0x10)
clang-11: error: linker command failed with exit code 1 (use -v to see
invocation)

Is it possible to pick a single patch from dtc and get it fast tracked
to mainline/stable so that this does not happen? It would be this one:

https://git.kernel.org/pub/scm/utils/dtc/dtc.git/commit/?id=0e9225eb0dfec51def612b928d2f1836b092bc7e

I have tested it and it works fine. If that is not possible, how would
you recommend solving this issue?

[1]: https://github.com/llvm/llvm-project/commit/3d9a0445cce368b55dc3a573bc91fe902bbb977f
[2]: https://travis-ci.com/ClangBuiltLinux/continuous-integration/builds/152428887

Cheers,
Nathan
