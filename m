Return-Path: <SRS0=lKpO=5L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD03AC43331
	for <linux-devicetree@archiver.kernel.org>; Thu, 26 Mar 2020 04:34:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 97DB220719
	for <linux-devicetree@archiver.kernel.org>; Thu, 26 Mar 2020 04:34:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="KciO4EZK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726014AbgCZEeh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 26 Mar 2020 00:34:37 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:42936 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725775AbgCZEeh (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 26 Mar 2020 00:34:37 -0400
Received: by mail-lf1-f67.google.com with SMTP id t21so3666272lfe.9
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2020 21:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8N6jteRVPBSL9hTxDMbTPuUm3mSUhds7WafEAkqE7jw=;
        b=KciO4EZK2hclyE9/T7X1J0ARNvopk2V0eLpCC+8wuGdNqsQE5CdbJY7+BgazwCU0jJ
         yrnc3M22S6Bo5hRb/q8bG5FKLs5NkMi/ktDfvfK/U+RBYmAOtUza3MQqLjh7Df8M3iLX
         ZlA+S8usMAK2O5oGjSEhl/klH+DBLtPGLLojs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8N6jteRVPBSL9hTxDMbTPuUm3mSUhds7WafEAkqE7jw=;
        b=ezXbYZKWKFCqLCxOM7ZO6l8WwgcAXKJgHuqpS7ywACa0o5dHFKmsV0kL2LYiJOCT4Q
         a373nPX25r8ylNIStnFf7GOe0T3VkaOqCNAQypvM7LfSPQpJmSP78qzlvjQnTcjZwmb7
         5PQS7pNV3MgHaT/MJ7fI9CG5gHa4PufecFn8VuFJgL2YDU7w3A7T3Vl15KCjRIu9MB3L
         QZgLF9rfYTZTSWaR0s5p310F0dEFlAb02aNXMClGZyl9yF0wFYGrnJaPkQVO3i4bXc/r
         uEYZPkeaV1S+YgKC5ZcjMSCpqL4jR7FUxymrvH+xotF7jAckJfyW5PKZ0wLkxDqQA36a
         tEGQ==
X-Gm-Message-State: ANhLgQ1wWn4ENGJfTFAVYxLaHvnSqQUBRqu1/mDT/34wfdDJbLvUx3jM
        GXEsjFkgnzglnyrXk+yMSy7aqRNak5NW+GqGUzYL5A==
X-Google-Smtp-Source: ADFU+vsdsnqzx0S4EfYqQ5gj5c4EYjwMSVSo8raRdE6/BLyB0BfCVZnUibKiUfSrUJAL+zUbo1fteorR07wPoNo2oQc=
X-Received: by 2002:a19:be11:: with SMTP id o17mr4280893lff.168.1585197275279;
 Wed, 25 Mar 2020 21:34:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200228084842.18691-1-rayagonda.kokatanur@broadcom.com>
 <CAL_JsqLXvVnVq0Mc1d0WMLNjURbHe9T3bKNb+5D6Nz3iyTK8GA@mail.gmail.com>
 <CAHO=5PFuercRYBzupd-Zb3q8v3sQWGT2ySXodG9S5NVj7Ta+1Q@mail.gmail.com> <CAL_JsqLW+3aJrB2EOEU74o+aVO9yPG74xi=Eov5_6++NdnOBPg@mail.gmail.com>
In-Reply-To: <CAL_JsqLW+3aJrB2EOEU74o+aVO9yPG74xi=Eov5_6++NdnOBPg@mail.gmail.com>
From:   Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
Date:   Thu, 26 Mar 2020 10:04:23 +0530
Message-ID: <CAHO=5PEEgQ+0xhBmFwjvi2nBada17fxDYeG42SDjk5qdzCQANg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] scripts: dtc: mask flags bit when check i2c addr
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" 
        <bcm-kernel-feedback-list@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Mar 26, 2020 at 12:37 AM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Mon, Mar 2, 2020 at 9:56 PM Rayagonda Kokatanur
> <rayagonda.kokatanur@broadcom.com> wrote:
> >
> > On Fri, Feb 28, 2020 at 7:20 PM Rob Herring <robh+dt@kernel.org> wrote:
> > >
> > > On Fri, Feb 28, 2020 at 2:48 AM Rayagonda Kokatanur
> > > <rayagonda.kokatanur@broadcom.com> wrote:
> > > >
> > > > Generally i2c addr should not be greater than 10-bit. The highest 2 bits
> > > > are used for I2C_TEN_BIT_ADDRESS and I2C_OWN_SLAVE_ADDRESS. Need to mask
> > > > these flags if check slave addr valid.
> > > >
> > > > Signed-off-by: Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
> > > > ---
> > > >  scripts/dtc/Makefile | 2 +-
> > > >  scripts/dtc/checks.c | 5 +++++
> > > >  2 files changed, 6 insertions(+), 1 deletion(-)
> > >
> > > dtc changes must be submitted against upstream dtc.
> >
> > Please let me know link to clone the upstream dtc branch.
> > >
> > >
> > > > diff --git a/scripts/dtc/Makefile b/scripts/dtc/Makefile
> > > > index 3acbb410904c..c5e8d6a9e73c 100644
> > > > --- a/scripts/dtc/Makefile
> > > > +++ b/scripts/dtc/Makefile
> > > > @@ -9,7 +9,7 @@ dtc-objs        := dtc.o flattree.o fstree.o data.o livetree.o treesource.o \
> > > >  dtc-objs       += dtc-lexer.lex.o dtc-parser.tab.o
> > > >
> > > >  # Source files need to get at the userspace version of libfdt_env.h to compile
> > > > -HOST_EXTRACFLAGS := -I $(srctree)/$(src)/libfdt
> > > > +HOST_EXTRACFLAGS := -I $(srctree)/$(src)/libfdt -I$(srctree)/tools/include
> > > >
> > > >  ifeq ($(shell pkg-config --exists yaml-0.1 2>/dev/null && echo yes),)
> > > >  ifneq ($(CHECK_DTBS),)
> > > > diff --git a/scripts/dtc/checks.c b/scripts/dtc/checks.c
> > > > index 756f0fa9203f..17c9ed4137b5 100644
> > > > --- a/scripts/dtc/checks.c
> > > > +++ b/scripts/dtc/checks.c
> > > > @@ -3,6 +3,7 @@
> > > >   * (C) Copyright David Gibson <dwg@au1.ibm.com>, IBM Corporation.  2007.
> > > >   */
> > > >
> > > > +#include <linux/bits.h>
> > >
> > > Not a UAPI header not that that would be much better as dtc also builds on Mac.
> > >
> > > >  #include "dtc.h"
> > > >  #include "srcpos.h"
> > > >
> > > > @@ -17,6 +18,9 @@
> > > >  #define TRACE(c, fmt, ...)     do { } while (0)
> > > >  #endif
> > > >
> > > > +#define I2C_TEN_BIT_ADDRESS    BIT(31)
> > > > +#define I2C_OWN_SLAVE_ADDRESS  BIT(30)
> > > > +
> > > >  enum checkstatus {
> > > >         UNCHECKED = 0,
> > > >         PREREQ,
> > > > @@ -1048,6 +1052,7 @@ static void check_i2c_bus_reg(struct check *c, struct dt_info *dti, struct node
> > > >
> > > >         for (len = prop->val.len; len > 0; len -= 4) {
> > > >                 reg = fdt32_to_cpu(*(cells++));
> > > > +               reg &= ~(I2C_OWN_SLAVE_ADDRESS | I2C_TEN_BIT_ADDRESS);
> > >
> > > I'd just mask the top byte so we don't have to update on the next flag we add.
> > Do you mean something like this, shown below ?
> > reg &= 0xFFFF_FC000;
>
> Yes, but as I said, the 'top byte', so 0xFF000000.
Thank you, will do as per your suggestion and send v2.
>
> Rob
