Return-Path: <SRS0=lKpO=5L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B433C43331
	for <linux-devicetree@archiver.kernel.org>; Thu, 26 Mar 2020 18:34:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0EF912070A
	for <linux-devicetree@archiver.kernel.org>; Thu, 26 Mar 2020 18:34:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D5KANnoU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727541AbgCZSeV (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 26 Mar 2020 14:34:21 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:39734 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727192AbgCZSeV (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 26 Mar 2020 14:34:21 -0400
Received: by mail-oi1-f195.google.com with SMTP id d63so6440197oig.6
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2020 11:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zvcRbO8JiiH8TflCF3JYY64FRuv850T5VBR+zKWVaAo=;
        b=D5KANnoUgA813LQvHjIp5rAoPhY2gTJup4nP+xGLb5FNmM7+8RNwum/ue1O95T+xWb
         5Ktbnl2iWEXVoCU3oOQg1rH6QozCfngfrmRO501JFNyUSHuo2dqvZagSkuCv/ZkCcdDy
         9SNPpYOLAEHYsE4N1CYsv1lw2JsDmzr3bO5CAhprXa6CHmJ/wgf3TslEjhp5iWSPZbla
         6EGwewp3bw3kVgK1ceZl6cCzyM58RIqxXE7Ece2gV1Bkyopg2Mdv5j42z6O1C0vGsEb+
         xUlK8kqOpBq79qowMpVYE7dI2KBF+1Bmk+h2mEbeqaCTkXHdCSEol6R1AyJ6SpC3NLmt
         slKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zvcRbO8JiiH8TflCF3JYY64FRuv850T5VBR+zKWVaAo=;
        b=H9oHB10V/D0bmGcEt5BKx9Fgq+UaHNY5RX7Zl2YVfeUeF5ZRJBdPxBE8M4ku5jt3Er
         5O7jyvzzAiYSxXX6K4v+pq7BBBUNCZHR2UQl7zP53zGzawea2MKnQuBBoN3wEg+78uko
         2yZoPsLCLEw6U+2q/tmMMFN2bErkbi9RwF6pWjixARMomOq1Ay+opTenn7Zc42UZMuHC
         +j7y2ttn9CBg6ghqW/Nqga0aQAlyJLOQvnhIBFeUiELvR6iNSQ01JKuUs1Ta8cpfBDje
         fjdhzrceCpCOTWD8RMgmbqoFTrlKzb2oRLvxUi8rQ2MD/dV9SwiIMKqlQcGLuHyxTNEv
         LcaQ==
X-Gm-Message-State: ANhLgQ2hdf80CqLHyx8iLF8ZDrrANYVUTPyYNFZmPOwL9w3p0jwhCdfp
        nE7MBY/aJ+NSx/Di8Y1mAQNQN+hFPm6BQVR1/veBVw==
X-Google-Smtp-Source: ADFU+vuhr19j1Gh9BuMJvyrUH94cq/bHJXqm/DeIzQEZemccehjW6KDkcmRhHiQOfwXBWmMBVCeLo1LvtVagEPcJ2FU=
X-Received: by 2002:aca:f541:: with SMTP id t62mr1218807oih.172.1585247660202;
 Thu, 26 Mar 2020 11:34:20 -0700 (PDT)
MIME-Version: 1.0
References: <1584973502-14775-1-git-send-email-ppvk@codeaurora.org> <c17d8842-0e1d-0014-b909-3114952b350b@codeaurora.org>
In-Reply-To: <c17d8842-0e1d-0014-b909-3114952b350b@codeaurora.org>
From:   Saravana Kannan <saravanak@google.com>
Date:   Thu, 26 Mar 2020 11:33:44 -0700
Message-ID: <CAGETcx_GD4K9CKyUtJEHKtAjHFKdfrepT0ZdA9WfRoUCF+QKPg@mail.gmail.com>
Subject: Re: [RFC v6 0/2] Add SDHC interconnect bandwidth scaling
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Pradeep P V K <ppvk@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        adrian.hunter@intel.com, Rob Herring <robh+dt@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>, asutoshd@codeaurora.org,
        stummala@codeaurora.org, sayalil@codeaurora.org,
        rampraka@codeaurora.org, vbadigan@codeaurora.org,
        Stephen Boyd <sboyd@kernel.org>,
        Georgi Djakov <georgi.djakov@linaro.org>, mka@chromium.org,
        linux-mmc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Andy Gross <agross@kernel.org>,
        linux-mmc-owner@vger.kernel.org,
        Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Mar 26, 2020 at 2:22 AM Rajendra Nayak <rnayak@codeaurora.org> wrote:
>
> Adding Viresh and Saravana,
>
> On 3/23/2020 7:55 PM, Pradeep P V K wrote:
> > Add interconnect bandwidths for SDHC driver using OPP framework that
> > is required by SDHC driver based on the clock frequency and bus width
> > of the card. Otherwise, the system clocks may run at minimum clock
> > speed and thus affecting the performance.
> >
> > This change is based on
> > [RFC] mmc: host: sdhci-msm: Use the interconnect API
> > (https://lkml.org/lkml/2018/10/11/499) and
> >
> > [PATCH v6] Introduce Bandwidth OPPs for interconnects
> > (https://lkml.org/lkml/2019/12/6/740)
>
> Pradeep, since your series seems to depend on the above proposed bw bindings,
> can you post the DT changes for the platform that you are testing these
> patches on?
>
> Please note that the above series is currently deadlocked [1][2] with no clear path
> forward for now, so looking at how you plan to use this might throw some light onto
> the requirements
>
> [1] https://lkml.org/lkml/2020/1/14/511
> [2] https://lkml.org/lkml/2020/3/20/106

Sorry, not deadlocked. Just kinda busy. For [1] I believe I agreed
with Viresh later on. I'll respond to [2] soon.

-Saravana

>
> >
> > Pradeep P V K (2):
> >    mmc: sdhci-msm: Add interconnect bus bandwidth scaling support
> >    dt-bindings: mmc: sdhci-msm: Add interconnect BW scaling strings
> >
> >   .../devicetree/bindings/mmc/sdhci-msm.txt          |  18 ++
> >   drivers/mmc/host/sdhci-msm.c                       | 240 ++++++++++++++++++++-
> >   2 files changed, 254 insertions(+), 4 deletions(-)
> >
>
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
