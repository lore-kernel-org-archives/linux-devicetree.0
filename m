Return-Path: <SRS0=Vyee=AT=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B03F1C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jul 2020 23:46:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8C5B720720
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jul 2020 23:46:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lcLaSajD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726142AbgGHXqu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Jul 2020 19:46:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726124AbgGHXqt (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Jul 2020 19:46:49 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C98D5C08C5C1
        for <devicetree@vger.kernel.org>; Wed,  8 Jul 2020 16:46:47 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id b25so263894ljp.6
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2020 16:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hNVOm+zljioPYiyCEKhVRUSifVw9+Rq4lrANP+/QLBY=;
        b=lcLaSajDl3PXHLI0IsixId3ctDcJw/wcCMiK5LmAriZFBPjCqkHzrpB5Wr8RE5ku3r
         jUWEGuzjjFwKK+MoTRT33yCbdQgTQwKFWb/UnbSfHe2j9OUtBiKy4DK8qeLKCpRc+9Wj
         Bzun1SbvUp06+5xggjiRZELJWnHnhk59in1ncmMWss/+VxfsOQxB1i07p/3CscAo4Vbr
         QjdH83dDvnirLejbklIErYxD/G1RzjIG34SvWUSpq6cQtuEaY7S7Q8EIA2lIqnunGSmj
         pdQe99/xvr+rhtnFuHZvy68oV0FkHeMRCItVNOqykDmMRzv+6icK/e4Zz3KUbgNWAVXS
         LFTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hNVOm+zljioPYiyCEKhVRUSifVw9+Rq4lrANP+/QLBY=;
        b=YKYp0bdU451Ea2LNuXnRl/Rm4ax8+8TnRUIoLSfWdrc02DyDIm/LlfIbulBds7ls+/
         G029xEIKrWPG2g3IwCsqJO+VlK/BLiHtMGtyt4fqWfgD8JByoy5GnFojCP4+Ukp1/JiD
         cZyGDaHHww2TGWbTlN/exNaq3r82odSrwQ2r34iMI1HvHSamngtbfi1cq+3ILoJHkOKx
         wqPY3dRm9u0h4jfP/ibNE2B1++g2HRp3HPlPH7oF+Ig/3qopxSJrWBevqLzSJFRm/jra
         6vEaiCfOYDuZR8gJJBDI2ViulVmkjjSwTY0Je5OiavkrrzfmMNG1ux/Hun1DQTjEXgpk
         8AAQ==
X-Gm-Message-State: AOAM531thoMOXWn3TW+Q+yDDkiTPAq/2OQYvHWSTqEDlko1x4YQxvnJR
        RLx2kHDwESWNFbSrv3BnqrT2qPsqEBNvvVY/xp12PQ==
X-Google-Smtp-Source: ABdhPJxQopmgjC6jnaMAt/WQPRrVXt1aN4OhHEolRLPsjEpEaz9Q/mPmsN9bvmri8KaSrr7ODM5XB1eWwNM+XDZ6cAM=
X-Received: by 2002:a05:651c:1106:: with SMTP id d6mr6280417ljo.214.1594252006292;
 Wed, 08 Jul 2020 16:46:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200708131424.18729-1-masahisa.kojima@linaro.org>
 <20200708162017.GB549022@linux.intel.com> <CADQ0-X9im8yVVVJbJL5Ssaa49UTOw+M=tYrfhNoODUaY723O8A@mail.gmail.com>
In-Reply-To: <CADQ0-X9im8yVVVJbJL5Ssaa49UTOw+M=tYrfhNoODUaY723O8A@mail.gmail.com>
From:   Masahisa Kojima <masahisa.kojima@linaro.org>
Date:   Thu, 9 Jul 2020 08:46:35 +0900
Message-ID: <CADQ0-X8xF0NpMakEB_Kqd2hVSrMsMB5FqFd7V9F1eLryJbEeFA@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] synquacer: add TPM support
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        ardb@kernel.org, devicetree <devicetree@vger.kernel.org>,
        linux-integrity@vger.kernel.org, peterhuewe@gmx.de, jgg@ziepe.ca
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Jarkko,

> Hi Jakko,
I apologize for mis-spelling of your name.
Same mistake also appears in my another reply to "[PATCH v3 1/2] tpm:
tis: add support for MMIO TPM on SynQuacer"

On Thu, 9 Jul 2020 at 08:34, Masahisa Kojima <masahisa.kojima@linaro.org> wrote:
>
> Hi Jakko,
>
> > Overally the code looks great. You've run it through checkpatch.pl?
>
> Yes, I have run checkpatch.pl and removed errors.
>
> Regards,
> Masahisa
>
> On Thu, 9 Jul 2020 at 01:20, Jarkko Sakkinen
> <jarkko.sakkinen@linux.intel.com> wrote:
> >
> > On Wed, Jul 08, 2020 at 10:14:22PM +0900, Masahisa Kojima wrote:
> > > This adds support for driving the TPM on Socionext SynQuacer platform
> > > using the driver for a memory mapped TIS frame.
> > >
> > > v3:
> > > - prepare new module to handle TPM MMIO access on SynQuacer platform
> > >
> > > v2:
> > > - don't use read/write_bytes() to implement read/write16/32 since that uses
> > >   the wrong address
> > >
> > > Cc: jarkko.sakkinen@linux.intel.com
> > > Cc: linux-arm-kernel@lists.infradead.org
> > > Cc: ardb@kernel.org
> > > Cc: devicetree@vger.kernel.org
> > > Cc: linux-integrity@vger.kernel.org
> > > Cc: linux-kernel@vger.kernel.org
> > > Cc: peterhuewe@gmx.de
> > > Cc: jgg@ziepe.ca
> > >
> > > Masahisa Kojima (2):
> > >   tpm: tis: add support for MMIO TPM on SynQuacer
> > >   dt-bindings: Add SynQucer TPM MMIO as a trivial device
> > >
> > >  .../devicetree/bindings/trivial-devices.yaml  |   2 +
> > >  drivers/char/tpm/Kconfig                      |  12 ++
> > >  drivers/char/tpm/Makefile                     |   1 +
> > >  drivers/char/tpm/tpm_tis_synquacer.c          | 196 ++++++++++++++++++
> > >  4 files changed, 211 insertions(+)
> > >  create mode 100644 drivers/char/tpm/tpm_tis_synquacer.c
> > >
> > > --
> > > 2.20.1
> > >
> >
> > Overally the code looks great. You've run it through checkpatch.pl?
> >
> > /Jarkko
