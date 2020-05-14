Return-Path: <SRS0=mbMJ=64=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BC02C433E1
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 May 2020 18:21:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 799CE2053B
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 May 2020 18:21:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bu8l9OVt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726532AbgENSVq (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 14 May 2020 14:21:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726075AbgENSVq (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 14 May 2020 14:21:46 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81AB1C061A0C
        for <devicetree@vger.kernel.org>; Thu, 14 May 2020 11:21:44 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id 1so2558535vsl.9
        for <devicetree@vger.kernel.org>; Thu, 14 May 2020 11:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=gJSIP+0eqqWilJF7ZA2rg5bve/1TAei35i2SbwZD4Bs=;
        b=bu8l9OVt14njQprs5kzcvxA6818I+95hsh8B/huC4fowfeyldDzvj64XeryyaxpQyY
         BBjGSN72DzjaustBIY5HSR/8qQAYDAm5djubj+Xrlw5Kx/b69hcBuWdDSoOlRx5ky/4M
         KHaOPCgkkaWDYAz/ruVVsoPmZ7+/xWOp1SEx0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=gJSIP+0eqqWilJF7ZA2rg5bve/1TAei35i2SbwZD4Bs=;
        b=XCG4RG2/0w3coBj6MUw7e5Nv00klfAvhHFxVJS2F8PP4z1SUCM6PsbFKxLr2DlM46O
         HrKTI07AmDma42gU798s7eHVkfU+KMYddAIm4V/6qJuqCHUI58rjOQ70b5L3W0W9bE9f
         TNaEm6WHkSGysQBvCIqrhM/QYvPQZ9dMLFBTX+Cn/2MYIaFAP9xfSjtGwuhIbtCjd0py
         AMAowadCRVEFc2Y+3U8xgNNVnk9CbGQZkccmXa/YtMK3K+F5tnhlFIOmLogxat+Z/T4t
         sLpaqijzK924B3Mz5c12ZSmbriMyMOPB0v3vglWet09wO2milN5su4uJ7MhfrMSJL4k1
         VMFw==
X-Gm-Message-State: AOAM533StSHutCMnGK7poR5thq7y9Rn3zz/wx7NRRqMcL7yPlnmFARQm
        NQWZBKgjgVLt8v5SVakLbz9yhe5BCtg=
X-Google-Smtp-Source: ABdhPJzTUE24NM1oNzmd3PmIV1vu8xBZ+xi6FshUeBhL7Df7mIt48g3XiHvaKoobYidek4G1vfVXxg==
X-Received: by 2002:a67:f288:: with SMTP id m8mr4931018vsk.41.1589480503162;
        Thu, 14 May 2020 11:21:43 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id u13sm825626vsg.12.2020.05.14.11.21.42
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2020 11:21:42 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id z16so1478093uae.11
        for <devicetree@vger.kernel.org>; Thu, 14 May 2020 11:21:42 -0700 (PDT)
X-Received: by 2002:ab0:69cc:: with SMTP id u12mr5012954uaq.22.1589480501535;
 Thu, 14 May 2020 11:21:41 -0700 (PDT)
MIME-Version: 1.0
References: <1589307480-27508-1-git-send-email-rbokka@codeaurora.org>
 <CAD=FV=VReEUiJY0yDgMkegMnKJ-Fc_c=4_f7_K7g-PG0UVjH5g@mail.gmail.com> <fb7f601f-388f-8a77-bb22-e1398f90326f@codeaurora.org>
In-Reply-To: <fb7f601f-388f-8a77-bb22-e1398f90326f@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 14 May 2020 11:21:30 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UTB+i_w-z1sYVOrqSP8TFzHa1fovrSU9RX7dBD5WB-ug@mail.gmail.com>
Message-ID: <CAD=FV=UTB+i_w-z1sYVOrqSP8TFzHa1fovrSU9RX7dBD5WB-ug@mail.gmail.com>
Subject: Re: [RFC v1 0/3] Add QTI QFPROM-Efuse driver support
To:     "Ravi Kumar Bokka (Temp)" <rbokka@codeaurora.org>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        dhavalp@codeaurora.org, mturney@codeaurora.org,
        sparate@codeaurora.org, c_rbokka@codeaurora.org,
        mkurumel@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Wed, May 13, 2020 at 8:35 PM Ravi Kumar Bokka (Temp)
<rbokka@codeaurora.org> wrote:
>
> Hi doug,
>
> Thanks for your feedback. Please find below inline comments.

Probably the mailing list didn't see them.  You responded with HTML
mail.  Please be careful to only respond in plain text.


> Regards,
>
> Ravi Kumar.B
>
>
>
> On 5/13/2020 4:33 AM, Doug Anderson wrote:
>
> Hi,
>
> On Tue, May 12, 2020 at 11:18 AM Ravi Kumar Bokka <rbokka@codeaurora.org>=
 wrote:
>
> This patch series adds qfprom-efuse controller driver support.
>
> This driver can access the raw qfprom regions for fuse blowing.
>
> The current existed qfprom driver is only supports for cpufreq, thermal s=
ensors
> drivers by read out calibration data, speed bins..etc which is stored by
> qfprom efuses.
>
> I don't understand the interaction between this driver and the
> existing "qcom,qfprom" driver.  Can you please explain?  Are they both
> acting on the same values and this one has write access?  Are there
> two instances of the same hardware block and you're managing one of
> them with this new driver and one with thue old driver?  Something
> else?
>
> [Ravi] Existing QFPROM driver in upstream kernel has limited support whic=
h is some hard coded mapping of id vs set of fuses and user can read those =
fuse with those id-bucket.
> That is simply reading Hw-registers and it doesn't involve any hardware p=
rogramming sequence etc. Based on information given to us by QC-kernel team=
, existing driver was created to read calibration/sensor fuses and it is ve=
ry basic/limited/fixed in functionalities and orthogonal to what we need to=
 on Trogdor.
>
> Requirement for Trogdor fuse blow driver is different which allows to rea=
d/write almost whole fuse block and requires to follow HW programming guide=
. Both are completely separate and has no overlapping in terms of functiona=
lities and capability. Please ignore the similarity of names of drivers, th=
ey are different in terms of functionalities and driver internals etc.

If they are targeting the same type of hardware IP block then, in the
very least, the bindings need to be the same.  The bindings are
supposed to be describing the hardware.

Presumably if the underlying hardware is the same you should be able
to write one driver and it can just operate in some sort of
"read-only" mode if it's running somewhere it doesn't have access
permissions to actually change the fuses.




> Ravi Kumar Bokka (3):
>   dt-bindings: nvmem: Add devicetree bindings for qfprom-efuse
>   drivers: nvmem: Add driver for QTI qfprom-efuse support
>   arm64: dts: qcom: sc7180: Add qfprom-efuse
>
>  .../devicetree/bindings/nvmem/qfprom-efuse.yaml    |  40 ++
>  arch/arm64/boot/dts/qcom/sc7180-idp.dts            |   4 +
>  arch/arm64/boot/dts/qcom/sc7180.dtsi               |   9 +
>  drivers/nvmem/Kconfig                              |  10 +
>  drivers/nvmem/Makefile                             |   2 +
>  drivers/nvmem/qfprom-efuse.c                       | 476 +++++++++++++++=
++++++
>  6 files changed, 541 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/qfprom-efuse.=
yaml
>  create mode 100644 drivers/nvmem/qfprom-efuse.c
>
> --
> Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member=
 of the Code Aurora Forum, hosted by the Linux Foundation.
>
