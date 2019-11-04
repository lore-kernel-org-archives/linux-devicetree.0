Return-Path: <SRS0=deyM=Y4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8593BCA9EB5
	for <linux-devicetree@archiver.kernel.org>; Mon,  4 Nov 2019 17:28:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 564202080F
	for <linux-devicetree@archiver.kernel.org>; Mon,  4 Nov 2019 17:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572888487;
	bh=w+lp4VFPqy8gWHVdLE4S/ZsHPMzttV9sPPs4qUUrNBM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=dutZcV8lX7LK1r0EFjflRHb0dmgI4/i2oXXCN1eQa/dypT7vnwdvHjvQ35RDHvNbW
	 B9yQ/rJwQRRBnIRvW3ilzlVKZPViiFk1Y68sxQpU2SBdJf+Zb+4FYs9HlwLLYeZLzd
	 jtM6ZZCbFTuKLJs5wYlyI+b/hJUD8IprrYYY4TK4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728489AbfKDR2G (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 4 Nov 2019 12:28:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:54020 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727989AbfKDR2G (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 4 Nov 2019 12:28:06 -0500
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2D97D20848
        for <devicetree@vger.kernel.org>; Mon,  4 Nov 2019 17:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572888485;
        bh=w+lp4VFPqy8gWHVdLE4S/ZsHPMzttV9sPPs4qUUrNBM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=0sCPNC+JETdMHkY4yKrcBZpQXZVQDascvupPPCokUUcs9gTq/DNcFOy5kvmLYqWTk
         Sbaeok0zcl0kP6ANdt3L9Iad1XL0I8/F0WtzyXVNT1Nx/jGxFr/dIJPa2FGbZoh2XG
         +bp6qXWxFY5O4WmChEuFfxn+p6aZthvndsUSEGTc=
Received: by mail-qt1-f177.google.com with SMTP id r22so15031074qtt.2
        for <devicetree@vger.kernel.org>; Mon, 04 Nov 2019 09:28:05 -0800 (PST)
X-Gm-Message-State: APjAAAVXljSM74n5jAhM9D2qneIcHKp1xeVZB/dgzPIWcyHienP0AQcR
        GhXw0R/1o9cxrTgLhdFgwIqLqetuum+P8GPUdg==
X-Google-Smtp-Source: APXvYqxcN3p/l7dLIC1sWx5aPgVGRJ0Gr1OuRyRX+A6NIyxtjIPW8mWW3mz2lD9t6TAlIjZl/vrjzqU1TLUDGPH4kjg=
X-Received: by 2002:ac8:458c:: with SMTP id l12mr13870893qtn.300.1572888484337;
 Mon, 04 Nov 2019 09:28:04 -0800 (PST)
MIME-Version: 1.0
References: <20190712115219.25997-1-pavelmn@axis.com>
In-Reply-To: <20190712115219.25997-1-pavelmn@axis.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 4 Nov 2019 11:27:53 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK-NqxuNKGv5s68DMrxpnHdU-M-vKkP4pTgdfrYRo=09A@mail.gmail.com>
Message-ID: <CAL_JsqK-NqxuNKGv5s68DMrxpnHdU-M-vKkP4pTgdfrYRo=09A@mail.gmail.com>
Subject: Re: [PATCH] dtc: Use pkg-config to locate libyaml
To:     Pavel Modilaynen <pavel.modilaynen@axis.com>
Cc:     Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org,
        Pavel Modilaynen <pavelmn@axis.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

+Masahiro

On Fri, Jul 12, 2019 at 6:59 AM Pavel Modilaynen
<pavel.modilaynen@axis.com> wrote:
>
> From: Pavel Modilaynen <pavel.modilaynen@axis.com>

Sorry for missing this.

> Using Makefile's wildcard with absolute path to detect
> the presence of libyaml results in false-positive
> detection when cross-compiling e.g. in yocto environment.

As this is a host tool, it's not really about cross-compiling, but
sandboxing the host env? IOW, I cross-compile all the time and don't
have an issue.

> The latter results in build error:
> | scripts/dtc/yamltree.o: In function `yaml_propval_int':
> | yamltree.c: undefined reference to `yaml_sequence_start_event_initialize'
> | yamltree.c: undefined reference to `yaml_emitter_emit'
> | yamltree.c: undefined reference to `yaml_scalar_event_initialize'
> ...
> Use pkg-config to locate libyaml to address this scenario.

The reason I didn't use pkg-config in the first place is it adds
another dependency. AIUI, it's only needed for gconfig/xconfig which
are probably not widely used especially for CI. Looks like objtool
needs it too, but that's x86 only though arm64 support is being worked
on. So I guess it is pretty much becoming a requirement.

So I've applied it. I added suppressing stderr in case pkg-config
isn't present.

Rob

>
> Signed-off-by: Pavel Modilaynen <pavel.modilaynen@axis.com>
> ---
>  scripts/dtc/Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/dtc/Makefile b/scripts/dtc/Makefile
> index 82160808765c..99d51b665432 100644
> --- a/scripts/dtc/Makefile
> +++ b/scripts/dtc/Makefile
> @@ -11,7 +11,7 @@ dtc-objs      += dtc-lexer.lex.o dtc-parser.tab.o
>  # Source files need to get at the userspace version of libfdt_env.h to compile
>  HOST_EXTRACFLAGS := -I $(srctree)/$(src)/libfdt
>
> -ifeq ($(wildcard /usr/include/yaml.h),)
> +ifeq ($(shell pkg-config --exists yaml-0.1 && echo yes),)
>  ifneq ($(CHECK_DTBS),)
>  $(error dtc needs libyaml for DT schema validation support. \
>         Install the necessary libyaml development package.)
> @@ -19,7 +19,7 @@ endif
>  HOST_EXTRACFLAGS += -DNO_YAML
>  else
>  dtc-objs       += yamltree.o
> -HOSTLDLIBS_dtc := -lyaml
> +HOSTLDLIBS_dtc := $(shell pkg-config yaml-0.1 --libs)
>  endif
>
>  # Generated files need one more search path to include headers in source tree
> --
> 2.11.0
>
