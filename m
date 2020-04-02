Return-Path: <SRS0=tl9x=5S=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A38BC2BA12
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Apr 2020 22:58:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 423192072E
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Apr 2020 22:58:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="W9lDsf9R"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388991AbgDBW6k (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 2 Apr 2020 18:58:40 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:36026 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388630AbgDBW6j (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 2 Apr 2020 18:58:39 -0400
Received: by mail-vs1-f67.google.com with SMTP id 184so3766175vsu.3
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2020 15:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aWD0gE7Vrwy/cdOlV72v6o0XzVmYemF303k1PSNaq4k=;
        b=W9lDsf9RQRgWPbt1c3OjVC4BGPVd7pdAsv+tVNSNuctUqBD8SELyyR9qwex6ROn24r
         d4j4v93TDmqkLacUW8sRAuANhbTyryN7WRH6zDCTynzff3FG7JN3me0PR7vciwMNXLey
         XiJok94xg+8kmBA1DjGznFhPAI1mgMofFv92Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aWD0gE7Vrwy/cdOlV72v6o0XzVmYemF303k1PSNaq4k=;
        b=ZTb6/ldAmZ+AxWweUEr2nbkIopMgjxRrelXN7IR/ONBMXGqZFGRr49vs/4qAlAtsMf
         ZV+JfBGDpLk7WDeD38xMgf/8y4QHyZl1ubuY8WUmMfOBEPzKeJK7Mf2Og7gfRGQvqnog
         7We72lcn3KKkBtBKwAOgTxLzyMes7IsS6G5XP2a+W0fUgJzHQPNIQKuzG5fhlfWa5tIB
         nYMX3gVLs1t9ZEwndsaySmMPT+C1XuBH9iVQjZbjZAtJpzAtYlXNVzBOs35X/7lPmXLz
         Ctu39M3Pvj4cAEc/wjp+yA10pHWxtXHPksxekW0Vd7+D3lj6G/C9SpLWSovkZ8RDQxYU
         679Q==
X-Gm-Message-State: AGi0PubOsqxZk/EdCmVzWAurfYxuS/Jq4hEn9cvAxrJSFg400ia4k8v+
        Sbp2lKNehs/0cTKkccst3Wo7MBqRzLQ=
X-Google-Smtp-Source: APiQypKOehtCNZTsFGkEcKgryH4LY+ZGRIjS2w6fGIBQCGhO8zKbEMVDvpQjAX3OPgaMfdkz+jUbtA==
X-Received: by 2002:a67:1e03:: with SMTP id e3mr3942138vse.102.1585868316866;
        Thu, 02 Apr 2020 15:58:36 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id 123sm1663911vsz.33.2020.04.02.15.58.35
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2020 15:58:35 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id x206so3760282vsx.5
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2020 15:58:35 -0700 (PDT)
X-Received: by 2002:a05:6102:3204:: with SMTP id r4mr4114704vsf.109.1585868314963;
 Thu, 02 Apr 2020 15:58:34 -0700 (PDT)
MIME-Version: 1.0
References: <1583747589-17267-1-git-send-email-sanm@codeaurora.org>
 <1583747589-17267-4-git-send-email-sanm@codeaurora.org> <CANcMJZCr646jav3h14K0xV=ANMxXg=U20wvSB546qrLX3TECBg@mail.gmail.com>
In-Reply-To: <CANcMJZCr646jav3h14K0xV=ANMxXg=U20wvSB546qrLX3TECBg@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 2 Apr 2020 15:58:22 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wd1Y-4RvS+jrwMmnZ7tZJdPnQOx8bpQ_QExgwkDNH0zg@mail.gmail.com>
Message-ID: <CAD=FV=Wd1Y-4RvS+jrwMmnZ7tZJdPnQOx8bpQ_QExgwkDNH0zg@mail.gmail.com>
Subject: Re: [PATCH v5 3/9] phy: qcom-qusb2: Add generic QUSB2 V2 PHY support
To:     John Stultz <john.stultz@linaro.org>
Cc:     Sandeep Maheswaram <sanm@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Manu Gautam <mgautam@codeaurora.org>,
        YongQin Liu <yongqin.liu@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Thu, Apr 2, 2020 at 2:39 PM John Stultz <john.stultz@linaro.org> wrote:
>
> On Mon, Mar 9, 2020 at 2:54 AM Sandeep Maheswaram <sanm@codeaurora.org> wrote:
> > @@ -774,8 +774,8 @@ static const struct of_device_id qusb2_phy_of_match_table[] = {
> >                 .compatible     = "qcom,msm8998-qusb2-phy",
> >                 .data           = &msm8998_phy_cfg,
> >         }, {
> > -               .compatible     = "qcom,sdm845-qusb2-phy",
> > -               .data           = &sdm845_phy_cfg,
> > +               .compatible     = "qcom,qusb2-v2-phy",
> > +               .data           = &qusb2_v2_phy_cfg,
> >         },
> >         { },
> >  };
>
> Just as a heads up, Yongqin (cc'ed) reported this patch (now upstream)
> seems to be causing trouble on the db845c.
>
> It seems like its removing support for the "qcom,sdm845-qusb2-phy"
> compatible string, which is documented:
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml#n23
>
> and already in use:
>    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/qcom/sdm845.dtsi#n2389
>
> Should this instead have been an addition of the "qcom,qusb2-v2-phy",
> line instead of replacing "qcom,sdm845-qusb2-phy"?

To avoid forking the discussion into two threads, I'll suggest that we
focus on keeping the discussion in reply to your newly proposed patch.
I've already replied there:

https://lore.kernel.org/r/CAD=FV=VGT75c4_ErQAJgNtcCd2Jzv0A2KpfEkS637GqOhamj9Q@mail.gmail.com

-Doug
