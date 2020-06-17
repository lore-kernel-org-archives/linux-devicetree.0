Return-Path: <SRS0=UIXH=76=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4702C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 17 Jun 2020 17:28:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 85D9F208B8
	for <linux-devicetree@archiver.kernel.org>; Wed, 17 Jun 2020 17:28:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CvnTOWt8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727018AbgFQR2l (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 17 Jun 2020 13:28:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727015AbgFQR2l (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 17 Jun 2020 13:28:41 -0400
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com [IPv6:2607:f8b0:4864:20::a42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AA93C061755
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2020 10:28:40 -0700 (PDT)
Received: by mail-vk1-xa42.google.com with SMTP id n22so763498vkm.7
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2020 10:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UWll59MdN+ez6rWdnCElUjlRL1alI73PEwi04U04HAI=;
        b=CvnTOWt81baGdhjQChJpjeoBAJiA931fOK8jDOKIWzJx1WjRaeTmgcPKQ4GL8/VAnF
         CBPWQHyMTNs23BL/btIg4GSiZYTRy7ApJShGSsKJQ3Jmk61PA1L5zC6owRPNNDAkzFiU
         R7uHZ9DL3iZnfWBtoC9Mb9tZYMgBB1+aIBo7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UWll59MdN+ez6rWdnCElUjlRL1alI73PEwi04U04HAI=;
        b=JVH6/Uh+GjI2jZ8GsjH3fNjZ01u73NmiYAPu6uNjz3fo2esSVT8MAPBYs046jSgKpm
         FU2e73eQ5q+o3JQqW7cCxKZW9wmzzUCEdEjHModt98rjPAYjmE5qsoZ/rpnCVmd1ajmD
         +hE9exZwgu2yu5kY+aRE7yXzdDS0/kDB2+x1I3eHCk51OFm2vCKL5LPpRukXTVTuLQT/
         UxVcXxsWqWNi3L4OqdzTFQlgQVDkdhCDXbLzHb3oM6Ulbgz5Qg683EdQO2baFISFbe4q
         Yj4GSvVmBo+RG0bjlQpU5QCnmGNHCkVmTKgO9rvxG5BPBdsIcATSjZ289PGvSslVBtPC
         De/g==
X-Gm-Message-State: AOAM531jaQHvNjyFruZdjfaNqcR9bYN+u0LnOVRt8YQQwM/gHNGIkPKG
        DUV2Ty2QSjC40oBKHJH2b3I4J3l851w=
X-Google-Smtp-Source: ABdhPJyZK2BO9gwkofn90HbEHLXR/0nI8vkgPeVNdVjW3LAdfaQ9LhRWDv08t5B/TtQrcU1Z1J/CrQ==
X-Received: by 2002:a1f:ee81:: with SMTP id m123mr395756vkh.51.1592414918613;
        Wed, 17 Jun 2020 10:28:38 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 81sm31543uaj.5.2020.06.17.10.28.37
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2020 10:28:37 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id z47so1030718uad.5
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2020 10:28:37 -0700 (PDT)
X-Received: by 2002:a9f:3b1c:: with SMTP id i28mr55758uah.22.1592414917295;
 Wed, 17 Jun 2020 10:28:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200617145116.247432-1-dianders@chromium.org>
 <20200617074930.v3.1.Iea2704ec2cb40c00eca47781c310a6330ac5dd41@changeid>
 <ed6d22a1-0d38-9874-d5cc-efe39f360baa@linaro.org> <0181cfe3-6627-e599-8f2f-1f433d9e0596@codeaurora.org>
In-Reply-To: <0181cfe3-6627-e599-8f2f-1f433d9e0596@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 17 Jun 2020 10:28:26 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WJeWudDDp79pZepX3o7yXUqEojy9_VM6ER4z-u=LK9eA@mail.gmail.com>
Message-ID: <CAD=FV=WJeWudDDp79pZepX3o7yXUqEojy9_VM6ER4z-u=LK9eA@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: nvmem: qfprom: Convert to yaml
To:     "Ravi Kumar Bokka (Temp)" <rbokka@codeaurora.org>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, dhavalp@codeaurora.org,
        mturney@codeaurora.org, Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        sparate@codeaurora.org, mkurumel@codeaurora.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Wed, Jun 17, 2020 at 9:26 AM Ravi Kumar Bokka (Temp)
<rbokka@codeaurora.org> wrote:
>
>
>
> On 6/17/2020 8:48 PM, Srinivas Kandagatla wrote:
> >
> >
> > On 17/06/2020 15:51, Douglas Anderson wrote:
> >> From: Ravi Kumar Bokka <rbokka@codeaurora.org>
> >>
> >> This switches the bindings over from txt to yaml.
> >>
> >> Signed-off-by: Ravi Kumar Bokka <rbokka@codeaurora.org>
> >> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >> ---
> >>
> >> Changes in v3:
> >> - Split conversion to yaml into separate patch new in v3.
> >> - Use 'const' for compatible instead of a 1-entry enum.
> >> - Changed filename to match compatible string.
> >> - Add #address-cells and #size-cells to list of properties.
> >> - Fixed up example.
> >>
> >>   .../bindings/nvmem/qcom,qfprom.yaml           | 45 +++++++++++++++++++
> >>   .../devicetree/bindings/nvmem/qfprom.txt      | 35 ---------------
> >>   2 files changed, 45 insertions(+), 35 deletions(-)
> >>   create mode 100644
> >> Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> >>   delete mode 100644 Documentation/devicetree/bindings/nvmem/qfprom.txt
> >>
> >> diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> >> b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> >> new file mode 100644
> >> index 000000000000..5efa5e7c4d81
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> >> @@ -0,0 +1,45 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Qualcomm Technologies Inc, QFPROM Efuse bindings
> >> +
> >> +maintainers:
> >> +  - Ravi Kumar Bokka <rbokka@codeaurora.org>
> >> +
> >
> > Am not sure this was intentional, but the old maintainer name is totally
> > lost in this patch!
> >
> > Please fix this!
> >
>
> Hi Srinivas,
> The existed qfprom dt-bindings in .txt format.
> I will make it as it is to merge whole content in .yaml format once
> confirm all the parameters with this new driver changes.

Ah, right.  It makes more sense to set you as the maintainer since you
were listed as the maintainer for the Linux driver and also the author
of the old bindings.  I'll change it to you then.

Unless I hear otherwise, I'll plan to send out a v4 tomorrow with
feedback I've gotten today.

-Doug
