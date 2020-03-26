Return-Path: <SRS0=lKpO=5L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 918DFC43331
	for <linux-devicetree@archiver.kernel.org>; Thu, 26 Mar 2020 05:53:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5DFE32070A
	for <linux-devicetree@archiver.kernel.org>; Thu, 26 Mar 2020 05:53:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="DT5EldjK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726138AbgCZFxs (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 26 Mar 2020 01:53:48 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:43739 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726014AbgCZFxs (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 26 Mar 2020 01:53:48 -0400
Received: by mail-lj1-f195.google.com with SMTP id g27so5085165ljn.10
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2020 22:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OamWJL+Kraa8aO4Mkhy7ZkgdOxINecQMyrACLlFZPL8=;
        b=DT5EldjKHxzvFeMbmuQkccpeMvDVkVAh7h2G1YJS+3oTIcBcOxVNUzo0njpHzC07aP
         qftgGWtlSjcONHnap3ytTGZvdBK5TrQ9qn/Fi3K9645uAI8eYdMrWfTPolE8/Dg6mHpI
         4toDx71shQVGj2fSTCpufOkWDU/mXBnc5YV9I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OamWJL+Kraa8aO4Mkhy7ZkgdOxINecQMyrACLlFZPL8=;
        b=pMqRklsqjCzby9sLPm93gbsc3XnvEnfVQKbeukg/QmK/Mt5WHmdh03KcKiTIt1c5qM
         JhucR4nfovOMkpK5BNnpAJlv2H6bPI2hwVq6dxgRIoi5ZBn9sji86HQ7nfa5PW8d4nBz
         +qB+8PPikEsmDx6lfg4SY9jU5VcCTvz6cYboI1aXTo9eU744Z6chm9H2DMyAS54yYQmX
         8349MctXQmWFkunDEtvaYg4QPOwTZytgNHEmHYl7bU9cnSP46ZqvVjidqVBJj7HK16rf
         85FF/Ko1bXcLh46cgWEkd3Q4M0EAcWoWSLY2KOy5Pl0/r8sNVmuYXBenuinhwjg4cwK8
         vQPg==
X-Gm-Message-State: AGi0PuZCsrrjXC8Pj56ykc6iZH3tz8TCs43zdv2aqEly+tvqscxpQFev
        0OZjAGSogKK+tPuJhOvi+ykCPbtfkx+fKj1lu4alFQ==
X-Google-Smtp-Source: APiQypJFZkp52F4PqCr2TUsH6tvpdBDaO3MlZ3gnWs88/rEddguemkOsIxCUPkHx08J7PVHpdA/hRPk7l6QfTWJIjI4=
X-Received: by 2002:a2e:8511:: with SMTP id j17mr4191189lji.292.1585202026293;
 Wed, 25 Mar 2020 22:53:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200228084842.18691-1-rayagonda.kokatanur@broadcom.com>
 <CAL_JsqLXvVnVq0Mc1d0WMLNjURbHe9T3bKNb+5D6Nz3iyTK8GA@mail.gmail.com>
 <CAHO=5PFuercRYBzupd-Zb3q8v3sQWGT2ySXodG9S5NVj7Ta+1Q@mail.gmail.com>
 <CAL_JsqLW+3aJrB2EOEU74o+aVO9yPG74xi=Eov5_6++NdnOBPg@mail.gmail.com> <CAHO=5PEEgQ+0xhBmFwjvi2nBada17fxDYeG42SDjk5qdzCQANg@mail.gmail.com>
In-Reply-To: <CAHO=5PEEgQ+0xhBmFwjvi2nBada17fxDYeG42SDjk5qdzCQANg@mail.gmail.com>
From:   Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
Date:   Thu, 26 Mar 2020 11:23:34 +0530
Message-ID: <CAHO=5PHbOWcjAc-C-v-h7YiaKwtKJvS0DcKaxpLfSsfrEeGTAQ@mail.gmail.com>
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

On Thu, Mar 26, 2020 at 10:04 AM Rayagonda Kokatanur
<rayagonda.kokatanur@broadcom.com> wrote:
>
> On Thu, Mar 26, 2020 at 12:37 AM Rob Herring <robh+dt@kernel.org> wrote:
> >
> > On Mon, Mar 2, 2020 at 9:56 PM Rayagonda Kokatanur
> > <rayagonda.kokatanur@broadcom.com> wrote:
> > >
> > > On Fri, Feb 28, 2020 at 7:20 PM Rob Herring <robh+dt@kernel.org> wrote:
> > > >
> > > > On Fri, Feb 28, 2020 at 2:48 AM Rayagonda Kokatanur
> > > > <rayagonda.kokatanur@broadcom.com> wrote:
> > > > >
> > > > > Generally i2c addr should not be greater than 10-bit. The highest 2 bits
> > > > > are used for I2C_TEN_BIT_ADDRESS and I2C_OWN_SLAVE_ADDRESS. Need to mask
> > > > > these flags if check slave addr valid.
> > > > >
> > > > > Signed-off-by: Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
> > > > > ---
> > > > >  scripts/dtc/Makefile | 2 +-
> > > > >  scripts/dtc/checks.c | 5 +++++
> > > > >  2 files changed, 6 insertions(+), 1 deletion(-)
> > > >
> > > > dtc changes must be submitted against upstream dtc.
> > >
> > > Please let me know link to clone the upstream dtc branch.
> > > >
> > > >
> > > > > diff --git a/scripts/dtc/Makefile b/scripts/dtc/Makefile
> > > > > index 3acbb410904c..c5e8d6a9e73c 100644
> > > > > --- a/scripts/dtc/Makefile
> > > > > +++ b/scripts/dtc/Makefile
> > > > > @@ -9,7 +9,7 @@ dtc-objs        := dtc.o flattree.o fstree.o data.o livetree.o treesource.o \
> > > > >  dtc-objs       += dtc-lexer.lex.o dtc-parser.tab.o
> > > > >
> > > > >  # Source files need to get at the userspace version of libfdt_env.h to compile
> > > > > -HOST_EXTRACFLAGS := -I $(srctree)/$(src)/libfdt
> > > > > +HOST_EXTRACFLAGS := -I $(srctree)/$(src)/libfdt -I$(srctree)/tools/include
> > > > >
> > > > >  ifeq ($(shell pkg-config --exists yaml-0.1 2>/dev/null && echo yes),)
> > > > >  ifneq ($(CHECK_DTBS),)
> > > > > diff --git a/scripts/dtc/checks.c b/scripts/dtc/checks.c
> > > > > index 756f0fa9203f..17c9ed4137b5 100644
> > > > > --- a/scripts/dtc/checks.c
> > > > > +++ b/scripts/dtc/checks.c
> > > > > @@ -3,6 +3,7 @@
> > > > >   * (C) Copyright David Gibson <dwg@au1.ibm.com>, IBM Corporation.  2007.
> > > > >   */
> > > > >
> > > > > +#include <linux/bits.h>
> > > >
> > > > Not a UAPI header not that that would be much better as dtc also builds on Mac.
> > > >
> > > > >  #include "dtc.h"
> > > > >  #include "srcpos.h"
> > > > >
> > > > > @@ -17,6 +18,9 @@
> > > > >  #define TRACE(c, fmt, ...)     do { } while (0)
> > > > >  #endif
> > > > >
> > > > > +#define I2C_TEN_BIT_ADDRESS    BIT(31)
> > > > > +#define I2C_OWN_SLAVE_ADDRESS  BIT(30)
> > > > > +
> > > > >  enum checkstatus {
> > > > >         UNCHECKED = 0,
> > > > >         PREREQ,
> > > > > @@ -1048,6 +1052,7 @@ static void check_i2c_bus_reg(struct check *c, struct dt_info *dti, struct node
> > > > >
> > > > >         for (len = prop->val.len; len > 0; len -= 4) {
> > > > >                 reg = fdt32_to_cpu(*(cells++));
> > > > > +               reg &= ~(I2C_OWN_SLAVE_ADDRESS | I2C_TEN_BIT_ADDRESS);
> > > >
> > > > I'd just mask the top byte so we don't have to update on the next flag we add.
> > > Do you mean something like this, shown below ?
> > > reg &= 0xFFFF_FC000;
> >
> > Yes, but as I said, the 'top byte', so 0xFF000000.
> Thank you, will do as per your suggestion and send v2.
Hi Rob,
I have pushed separate patch which is prepared against dtc master branch.
Please review.

> >
> > Rob
