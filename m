Return-Path: <SRS0=tl9x=5S=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34169C2BA12
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Apr 2020 23:19:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F3CFE20787
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Apr 2020 23:19:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lU6BN+dV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731783AbgDBXTu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 2 Apr 2020 19:19:50 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:44173 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389956AbgDBXTt (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 2 Apr 2020 19:19:49 -0400
Received: by mail-vs1-f66.google.com with SMTP id e138so3746302vsc.11
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2020 16:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ncIkL/N+C/5xfW8f4UpsaGlmkYruRQuItf8xwxhNScQ=;
        b=lU6BN+dVzTeqQyyPfiQaqqCrnWa3Ec+Pvx4uo5Ygw9tUQCILw+U9toAhRszqX5nWLC
         ThhAtXEIbmIwuHIBVCYdWvKh/XM2J0/ed62PZqgbK/12Fn6n8QqlVLHZsJavPGYEMTpy
         Tn/ERwSLfz0RJNfSGF57RnPXKhMvbU/3YmO/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ncIkL/N+C/5xfW8f4UpsaGlmkYruRQuItf8xwxhNScQ=;
        b=Zh0QLP8pdFTIhzSfDp6UXzAeQsOb73uji0ix/SIHgNA/3E/Q4YtJbu6VIM5UKWWynu
         M241vKyo52OyQmrHrxIYFsWnfJrscgvsX6d8C6+hgbwxW6/FMLGzCKnTxBFu/Q4W5xSB
         Z4jMsaOLvAm4QdRQCKVTjI7JkMaTktica7CrRp5qyjYToKjdGkfd+mhOrjvYkViPQwmo
         HMKLw9yBbzrzc9SFG2qJUZeeBkkxTZKQOcvURYsjkkXlvVx5J5QIEzcFqgzzvlmcmgZC
         2TF7ZxACauqTR53UljJvpvI4o2vhFoZW4FtTPtDgl+Ha9/d5kB6R8D/60pZVHINeal5y
         L6+Q==
X-Gm-Message-State: AGi0PuZWqmlVPXSUdPTPyhxDmLA0X8AkSM3rYaeAJh9saR4pnJNiIeyS
        xO4fm20g+t8cdvgr7QHCtq2VR/Wgvd4=
X-Google-Smtp-Source: APiQypLnhdSZYY5rpYLpKtAJeRGJXw+/hd7osWY8mXBANTdIq/hJygvy8QAN7ODiV9nKhAGCtqfxMA==
X-Received: by 2002:a67:ae0f:: with SMTP id x15mr4486660vse.110.1585869587183;
        Thu, 02 Apr 2020 16:19:47 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id g25sm1645731vsq.21.2020.04.02.16.19.46
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2020 16:19:46 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id w14so3781039vsf.7
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2020 16:19:46 -0700 (PDT)
X-Received: by 2002:a67:2b07:: with SMTP id r7mr4746980vsr.169.1585869585633;
 Thu, 02 Apr 2020 16:19:45 -0700 (PDT)
MIME-Version: 1.0
References: <CANcMJZCr646jav3h14K0xV=ANMxXg=U20wvSB546qrLX3TECBg@mail.gmail.com>
 <20200402223723.7150-1-john.stultz@linaro.org> <CAD=FV=VGT75c4_ErQAJgNtcCd2Jzv0A2KpfEkS637GqOhamj9Q@mail.gmail.com>
 <CALAqxLXfd+7Wc79_XWRv8cKLFu+MpM1w9e3byx9z5bXSdTemLg@mail.gmail.com>
In-Reply-To: <CALAqxLXfd+7Wc79_XWRv8cKLFu+MpM1w9e3byx9z5bXSdTemLg@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 2 Apr 2020 16:19:34 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WLAgowK67U1GkF3h_CZU_nyFfDPpZ=bF8BXU1jd_uTZg@mail.gmail.com>
Message-ID: <CAD=FV=WLAgowK67U1GkF3h_CZU_nyFfDPpZ=bF8BXU1jd_uTZg@mail.gmail.com>
Subject: Re: [PATCH] phy: qcom-qusb2: Re add "qcom,sdm845-qusb2-phy" compat string
To:     John Stultz <john.stultz@linaro.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Thu, Apr 2, 2020 at 4:08 PM John Stultz <john.stultz@linaro.org> wrote:
>
> On Thu, Apr 2, 2020 at 3:56 PM Doug Anderson <dianders@chromium.org> wrote:
> >
> > Hi,
> >
> > On Thu, Apr 2, 2020 at 3:37 PM John Stultz <john.stultz@linaro.org> wrote:
> > >
> > > In commit 8fe75cd4cddf ("phy: qcom-qusb2: Add generic QUSB2 V2
> > > PHY support"), the change was made to add "qcom,qusb2-v2-phy"
> > > as a generic compat string. However the change also removed
> > > the "qcom,sdm845-qusb2-phy" compat string, which is documented
> > > in the binding and already in use.
> > >
> > > This patch re-adds the "qcom,sdm845-qusb2-phy" compat string
> > > which allows the driver to continue to work with existing dts
> > > entries such as found on the db845c.
> > >
> > > Cc: Andy Gross <agross@kernel.org>
> > > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > Cc: Rob Herring <robh+dt@kernel.org>
> > > Cc: Mark Rutland <mark.rutland@arm.com>
> > > Cc: Doug Anderson <dianders@chromium.org>
> > > Cc: Manu Gautam <mgautam@codeaurora.org>
> > > Cc: Sandeep Maheswaram <sanm@codeaurora.org>
> > > Cc: Matthias Kaehlcke <mka@chromium.org>
> > > Cc: Stephen Boyd <swboyd@chromium.org>
> > > Cc: Kishon Vijay Abraham I <kishon@ti.com>
> > > Cc: linux-arm-msm@vger.kernel.org
> > > Cc: devicetree@vger.kernel.org
> > > Fixes: 8fe75cd4cddf ("phy: qcom-qusb2: Add generic QUSB2 V2 PHY support")
> > > Reported-by: YongQin Liu <yongqin.liu@linaro.org>
> > > Signed-off-by: John Stultz <john.stultz@linaro.org>
> > > ---
> > >  drivers/phy/qualcomm/phy-qcom-qusb2.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> >
> > Do you have an out-of-tree dts file?  If not, I'd prefer that the fix
> > was for this patch to land instead:
> >
> > https://lore.kernel.org/r/1583747589-17267-9-git-send-email-sanm@codeaurora.org
>
> No, no out of tree dts.  The usage is already in tree:
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/qcom/sdm845.dtsi#n2389
>
>
> > While we can land your patch if someone needs it for supporting an
> > out-of-tree dts, it gives people supporting future SoCs the idea that
> > they need to add themselves to this table too.  That's now discouraged
> > unless there's a specific quirk that needs to be handled just for this
> > SoC.
>
> My understanding with dts bindings is that they are effectively an
> ABI. While maybe it makes sense to deprecate the
> "qcom,sdm845-qusb2-phy" string in the Documentation to avoid new
> users, I'd think we'd want to keep the support in the driver as we
> aren't supposed to have tight coupling between the DTB and kernel (at
> least for official bindings).

If nothing else if we're going to land your patch, can you at least
put a comment in there that says "only needed to support legacy device
trees that didn't include "qcom,qusb2-v2-phy" in the compatible
string.  Then the person who adds the next Qualcomm SoC will know not
to add themselves to the table too.


> Granted, I've not gotten much experience with boards that were fully
> upstream and thus didn't have an eternally evolving dts file that had
> to be kept in sync with the kernel, so in practice either solution
> does work for me, but in theory it seems like we should at least
> pretend these things are stable. :)

Yeah, I don't want to get into the whole stable ABI argument, but what
you say is the official word.  The bindings are supposed to be a
stable ABI and it's a good goal to strive for.

...but in reality most people are OK with it not being quite so stable
as long as it's not hurting anyone.  What should have happened here is
that the bindings and dts should have landed in one Linux version and
the driver change landed in the next Linux version.  Now we're stuck
with the breakage, though.  :(  In general for "new" architectures
it's considered more OK to break compatibility, though I guess you can
argue whether sdm845 is really new enough.  I guess to get at the meat
of the issue though: if you need a patch to fix your problem anyway,
why not land the patch that doesn't end up chewing extra up extra code
space and providing a bad example for someone to copy?

Now certainly if changing your DTS was an undue burden (like you've
already baked device trees into firmware) there's no question we
should land your patch.  I'm just not sure the lofty goal of "it's
supposed to be a stable ABI so let's add an entry to the table that
nobody will ever care about after the dts change lands" is enough of a
reason to land it now.

OK, I'll duck from the tomatoes now.

-Doug
