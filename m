Return-Path: <SRS0=uNWD=7Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 076ACC433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 23:15:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D2D6E207FF
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 23:15:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MiFMCE9Q"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726302AbgFLXPr (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 12 Jun 2020 19:15:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726347AbgFLXPp (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 12 Jun 2020 19:15:45 -0400
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com [IPv6:2607:f8b0:4864:20::941])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBD3BC03E96F
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2020 16:15:43 -0700 (PDT)
Received: by mail-ua1-x941.google.com with SMTP id c15so3764687uar.9
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2020 16:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oq8VMZuaXGbd2S6QZmKfGmJLPLEtlVINersNYu3Hmq0=;
        b=MiFMCE9QLz1s7wRwKCXByIZ2xd4K1DO67RKgkjq+lAP7DTtPvpc/G2vBsgSkuDtKa4
         FwuG6iEAswE2oH+ZdM9YAuSFSl8c5HLxdf8lFHa6MAa5hxg4xLBQc2iWcDe8EDJA5S5k
         RQB+M2lLyrChdz5hHyuTmUQ1NGV/zdHBXAStQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oq8VMZuaXGbd2S6QZmKfGmJLPLEtlVINersNYu3Hmq0=;
        b=NnnFFy+qf4odNbxB4CFvv9/LLEmzcyeG51qcUx9QqezNgFzfz75GZEY7FoeAHTuZF4
         hdAe7LKkOaEr9aR2FvuOTOgGUJBMvI9Cx2vQIasp8VCgAOOsdH7YVv5aXDoFKLdG55W6
         ndL6NRzKy0W2+Iqm4nxBV0Eaux5G83qgnMDf9tUHja6HF7IymIa1rEyTi+H06/loEAdk
         wtCJtplgBk9hFsOuEAvDQj82z0JFtCC9Pf2PXG3WqNV7s10M/OJFbkMsQTm13y5/C/aj
         X8zzMQZsOVpCRhjVzSEZ/YL5ecOVgwVdMey5rSL+OUGeEdlLc4Lc1a+csG+msBokKgwj
         MpAg==
X-Gm-Message-State: AOAM531TWxk5/2Z+YSBg0iRRLdqfsn2+zK9Y/oy9so2tSv5MdFRurftP
        Zq4ejY53cVj0D7Raquc13+RNuv3xRSk=
X-Google-Smtp-Source: ABdhPJwuAo83RrQdMdrSsZPaCUQS15nqkNN/FFl3inPlwYFkBE7Rg/MM0Uy+QorcQGHdKCD3kfCAPg==
X-Received: by 2002:ab0:29c1:: with SMTP id i1mr12020070uaq.120.1592003742670;
        Fri, 12 Jun 2020 16:15:42 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id t2sm1192922vka.28.2020.06.12.16.15.41
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2020 16:15:41 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id y123so6237490vsb.6
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2020 16:15:41 -0700 (PDT)
X-Received: by 2002:a67:e445:: with SMTP id n5mr13169309vsm.73.1592003741235;
 Fri, 12 Jun 2020 16:15:41 -0700 (PDT)
MIME-Version: 1.0
References: <1591868882-16553-1-git-send-email-rbokka@codeaurora.org>
 <1591868882-16553-2-git-send-email-rbokka@codeaurora.org> <CAD=FV=WjvAWVmq3fTh=_f2p1Dv+sXg1RV-CqZr8KRgHe8_wT0w@mail.gmail.com>
In-Reply-To: <CAD=FV=WjvAWVmq3fTh=_f2p1Dv+sXg1RV-CqZr8KRgHe8_wT0w@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 12 Jun 2020 16:15:29 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W4QqjOOfh_pJgg3P1PCEGOv8cubFKFKeYOBC0VVk2mZg@mail.gmail.com>
Message-ID: <CAD=FV=W4QqjOOfh_pJgg3P1PCEGOv8cubFKFKeYOBC0VVk2mZg@mail.gmail.com>
Subject: Re: [RFC v2 1/3] dt-bindings: nvmem: Add devicetree bindings for qfprom-efuse
To:     Ravi Kumar Bokka <rbokka@codeaurora.org>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        dhavalp@codeaurora.org, mturney@codeaurora.org,
        sparate@codeaurora.org, mkurumel@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Fri, Jun 12, 2020 at 2:59 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Thu, Jun 11, 2020 at 2:49 AM Ravi Kumar Bokka <rbokka@codeaurora.org> wrote:
> >
> > This patch adds dt-bindings document for qfprom-efuse controller.
> >
> > Signed-off-by: Ravi Kumar Bokka <rbokka@codeaurora.org>
> > ---
> >  .../devicetree/bindings/nvmem/qfprom.yaml          | 52 ++++++++++++++++++++++
> >  1 file changed, 52 insertions(+)
>
> Overall comment: I reviewed your v1 series and so I'm obviously
> interested in your series.  Please CC me on future versions.
>
> I would also note that, since this is relevant to Qualcomm SoCs that
> you probably should be CCing "linux-arm-msm@vger.kernel.org" on your
> series.
>
>
> >  create mode 100644 Documentation/devicetree/bindings/nvmem/qfprom.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/nvmem/qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qfprom.yaml
> > new file mode 100644
> > index 0000000..7c8fc31
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/nvmem/qfprom.yaml
> > @@ -0,0 +1,52 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/nvmem/qfprom.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm Technologies Inc, QFPROM Efuse bindings
> > +
> > +maintainers:
> > +  - Ravi Kumar Bokka <rbokka@codeaurora.org>
> > +
> > +allOf:
> > +  - $ref: "nvmem.yaml#"
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - qcom,qfprom
>
> As per discussion in patch #1, I believe SoC compatible should be here
> too in case it is ever needed.  This is standard practice for dts
> files for IP blocks embedded in an SoC.  AKA, this should be:
>
>     items:
>       - enum:
>           - qcom,apq8064-qfprom
>           - qcom,apq8084-qfprom
>           - qcom,msm8974-qfprom
>           - qcom,msm8916-qfprom
>           - qcom,msm8996-qfprom
>           - qcom,msm8998-qfprom
>           - qcom,qcs404-qfprom
>           - qcom,sc7180-qfprom
>           - qcom,sdm845-qfprom
>       - const: qcom,qfprom
>
> NOTE: old SoCs won't have both of these and thus they will get flagged
> with "dtbs_check", but I believe that's fine (Rob can correct me if
> I'm wrong).  The code should still work OK if the SoC isn't there but
> it would be good to fix old dts files to have the SoC specific string
> too.
>
>
> > +
> > +  reg:
> > +    maxItems: 3
>
> Please address feedback feedback on v1.  If you disagree with my
> feedback it's OK to say so (I make no claims of being always right),
> but silently ignoring my feedback and sending the next version doesn't
> make me feel like it's a good use of my time to keep reviewing your
> series.  Specifically I suggested that you actually add descriptions
> rather than just putting "maxItems: 3".
>
> With all that has been discussed, I think the current best thing to
> put there is:
>
>     # If the QFPROM is read-only OS image then only the corrected region
>     # needs to be provided.  If the QFPROM is writable then all 3 regions
>     # must be provided.
>     oneOf:
>       - items:
>           - description: The start of the corrected region.
>       - items:
>           - description: The start of the raw region.
>           - description: The start of the config region.
>           - description: The start of the corrected region.

To address some of Srinivas's comments, I think you should actually
add the 4th range in here too:

- description: The start of the security control region.

That allows you to read 0x6000 and get the major/minor/step properly.


I will also note that as I've started reviewing the driver code it'll
probably make everyone's life easiest if you keep the "corrected"
region first, even if it's not numerically first.


I've updated my FIXUP patch again.  I might notice more comments as I
review the driver more, but we'll see...

-Doug
