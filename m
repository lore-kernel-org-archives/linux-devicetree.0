Return-Path: <SRS0=8HU2=3X=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B16EBC35247
	for <linux-devicetree@archiver.kernel.org>; Mon,  3 Feb 2020 17:09:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8059420721
	for <linux-devicetree@archiver.kernel.org>; Mon,  3 Feb 2020 17:09:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EAKDQu8q"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726913AbgBCRJU (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 3 Feb 2020 12:09:20 -0500
Received: from mail-vk1-f195.google.com ([209.85.221.195]:46978 "EHLO
        mail-vk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728197AbgBCRJS (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 3 Feb 2020 12:09:18 -0500
Received: by mail-vk1-f195.google.com with SMTP id u6so4315909vkn.13
        for <devicetree@vger.kernel.org>; Mon, 03 Feb 2020 09:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CWQc8dWjlP2ZA9TkToOZ6adaS42b79Cp5nFYcug4BVk=;
        b=EAKDQu8qFYvqVVBY6uTHZgB1TJs7Z9uMCfyWVlawP4ae8ZrTJg8UgyZmAEtPSl1PNx
         Fz74VmTHzWlvIhFr3tnpdoM/9PTqfIt1rc+9fZZX00uGb28Cal9pEtzWF2whX5me+Vv5
         Z4UGUpECKY1Lb3uxtkRYOanrG6RgiddygoDAo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CWQc8dWjlP2ZA9TkToOZ6adaS42b79Cp5nFYcug4BVk=;
        b=Lt0SsKGR+Oeykw5ll1z4cMfxNN0H0LIG1+TTpRDhqk99g/VfJ/5WJD6tr8N1b8vnaZ
         uSamugqOc7Rd0b87DNSfe8Is8HkqC+PE0yh9srosxD3Qx+ONG3d1i6XBpZ7yoUke2bNh
         3rwHKBDK6VUFVYUdr/Si6b6lvaSijmry8/TtKHDubFZxsNJjL/bJdhvZ6L049XNjndWg
         29JG+or/4bSbq+rrd+341NWcrKc++k6Lk4sxqv9WymvI7tD+4o4hHgM0OiRtuC5QBJ9h
         NaveQPLGUfvGk3oGMSmCtM+pEyUDs/0TH4N71TIT1krnmMijw4UcbSChFlhVoWGwzMoQ
         Nlhw==
X-Gm-Message-State: APjAAAWKpUnOgZB81pVLn2oomdXZPujx8ILVK4iT6EXNydejr9KDcTsk
        4vtMYo2Sd0J4L9jv/lDujAY6qvovmtA=
X-Google-Smtp-Source: APXvYqxy4OTxcDmV9kfbzdEBf7PNRef44+2lmYFlIIUQQiArT4bv1icR4U52ygiJM4Usl17MJewWnQ==
X-Received: by 2002:a1f:7288:: with SMTP id n130mr14585494vkc.46.1580749755359;
        Mon, 03 Feb 2020 09:09:15 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id s8sm5441276vsk.13.2020.02.03.09.09.14
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2020 09:09:14 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id v141so9358322vsv.12
        for <devicetree@vger.kernel.org>; Mon, 03 Feb 2020 09:09:14 -0800 (PST)
X-Received: by 2002:a67:8704:: with SMTP id j4mr16525027vsd.106.1580749753932;
 Mon, 03 Feb 2020 09:09:13 -0800 (PST)
MIME-Version: 1.0
References: <20200129152458.v2.1.I4452dc951d7556ede422835268742b25a18b356b@changeid>
 <20200130180404.6771A2083E@mail.kernel.org>
In-Reply-To: <20200130180404.6771A2083E@mail.kernel.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 3 Feb 2020 09:09:02 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UsURCk4WD9uhvw1LJoTNMZ0anxgEfFGXRMk1Ps3HWxeQ@mail.gmail.com>
Message-ID: <CAD=FV=UsURCk4WD9uhvw1LJoTNMZ0anxgEfFGXRMk1Ps3HWxeQ@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: clk: qcom: Fix self-validation, split,
 and clean cruft
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Taniya Das <tdas@codeaurora.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Abhishek Sahu <absahu@codeaurora.org>, sivaprak@codeaurora.org,
        anusharao@codeaurora.org, Sricharan <sricharan@codeaurora.org>,
        Rob Herring <robh@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Thu, Jan 30, 2020 at 10:04 AM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Douglas Anderson (2020-01-29 15:25:06)
> > The 'qcom,gcc.yaml' file failed self-validation (dt_binding_check)
> > because it required a property to be either (3 entries big),
> > (3 entries big), or (7 entries big), but not more than one of those
> > things.  That didn't make a ton of sense.
> >
> > This patch splits all of the exceptional device trees (AKA those that
> > would have needed if/then/else rules) from qcom,gcc.yaml.  It also
> > cleans up some cruft found while doing that.
> >
> > After this lands, this worked for me atop clk-next with just the known
> > error about msm8998:
> >   for f in \
> >     Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml \
> >     Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml \
> >     Documentation/devicetree/bindings/clock/qcom,gcc-msm8996.yaml \
> >     Documentation/devicetree/bindings/clock/qcom,gcc-msm8998.yaml \
> >     Documentation/devicetree/bindings/clock/qcom,gcc-qcs404.yaml \
> >     Documentation/devicetree/bindings/clock/qcom,gcc-sc7180.yaml \
> >     Documentation/devicetree/bindings/clock/qcom,gcc-sm8150.yaml \
> >     Documentation/devicetree/bindings/clock/qcom,gcc.yaml; do \
> >       ARCH=arm64 make dtbs_check DT_SCHEMA_FILES=$f; \
> >   done
> >
> > I then picked this patch atop linux-next (next-20200129) and ran:
> >   # Delete broken yaml:
> >   rm Documentation/devicetree/bindings/pci/intel-gw-pcie.yaml
> >   ARCH=arm64 make dt_binding_check | grep 'clock/qcom'
> > ...and that didn't seem to indicate problems.
> >
> > Arbitrary decisions made (yell if you want changed):
> > - Left all the older devices (where clocks / clock-names weren't
> >   specified) in a single file.
> > - Didn't make clocks "required" for msm8996 but left them as listed.
> >   This seems a little weird but it matches the old binding.
> >
> > Misc cleanups as part of this patch:
> > - sm8150 was claimed to be same set of clocks as sc7180, but driver
> >   and dts appear to say that "bi_tcxo_ao" doesn't exist.  Fixed.
>
> Someone will probably want to change this at some point.

I haven't heard anything from Qualcomm, so leaving it the way it was
in v2 for the v3 I'm prepping.  Someone can always do a follow-up
patch.


> > - In "apq8064", "#thermal-sensor-cells" was missing the "#".
> > - Got rid of "|" at the end of top description since spacing doesn't
> >   matter.
> > - Changed indentation to consistently 2 spaces (it was 3 in some
> >   places).
> > - Added period at the end of protected-clocks description.
> > - No space before ":".
> > - Updated sc7180/sm8150 example to use the 'qcom,rpmh.h' include.
> > - Updated sc7180/sm8150 example to use larger address/size cells as
> >   per reality.
> > - Updated sc7180/sm8150 example to point to the sleep_clk rather than
> >   <0>.
> > - Made it so that gcc-ipq8074 didn't require #power-domain-cells since
> >   actual dts didn't have it and I got no hits from:
> >     git grep _GDSC include/dt-bindings/clock/qcom,gcc-ipq8074.h
> > - Made it so that gcc-qcs404 didn't require #power-domain-cells since
> >   actual dts didn't have it and I got no hits from:
> >     git grep _GDSC include/dt-bindings/clock/qcom,gcc-qcs404.h
> >
> > Noticed, but not done in this patch (volunteers needed):
> > - Add "aud_ref_clk" to sm8150 bindings / dts even though I found a
> >   reference to it in "gcc-sm8150.c".
> > - Fix node name in actual ipq8074 to be "clock-controller" (it's gcc).
> > - Since the example doesn't need phandes to exist, in msm8998 could
> >   just make up places providing some of the clocks currently bogused
> >   out with <0>.
> > - On msm8998 clocks are listed as required but current dts doesn't
> >   have them.
> >
> > Fixes: ab91f72e018a ("clk: qcom: gcc-msm8996: Fix parent for CLKREF clocks")
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > ---
> >
> > Changes in v2:
> > - Clocks are required for msm8998; note that current dts is broken.
> > - Drop description for 'gcc-apq8064' nvmem-cell-names.
> > - Commit message now describes running dt_binding_check differently.
> > - Added Rob's review tag.
> >
> >  .../bindings/clock/qcom,gcc-apq8064.yaml      |  79 +++++++
> >  .../bindings/clock/qcom,gcc-ipq8074.yaml      |  48 ++++
> >  .../bindings/clock/qcom,gcc-msm8996.yaml      |  65 ++++++
> >  .../bindings/clock/qcom,gcc-msm8998.yaml      |  90 ++++++++
> >  .../bindings/clock/qcom,gcc-qcs404.yaml       |  48 ++++
> >  .../bindings/clock/qcom,gcc-sc7180.yaml       |  72 ++++++
> >  .../bindings/clock/qcom,gcc-sm8150.yaml       |  69 ++++++
> >  .../devicetree/bindings/clock/qcom,gcc.yaml   | 212 ++----------------
> >  8 files changed, 489 insertions(+), 194 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
> >  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml
> >  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-msm8996.yaml
> >  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-msm8998.yaml
> >  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-qcs404.yaml
> >  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sc7180.yaml
> >  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sm8150.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
> > new file mode 100644
> > index 000000000000..a386cfd27793
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
> > @@ -0,0 +1,79 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/bindings/clock/qcom,gcc-apq8064.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm Global Clock & Reset Controller Binding for APQ8064
> > +
> > +maintainers:
> > +  - Stephen Boyd <sboyd@kernel.org>
> > +  - Taniya Das <tdas@codeaurora.org>
> > +
> > +description:
> > +  Qualcomm global clock control module which supports the clocks, resets and
> > +  power domains on APQ8064.
>
> It would be great if this could also point to the
> include/dt-bindings/clock/qcom,apq8064.h file here. If you don't resend
> this patch then I will try to remember to make this addition to the
> binding docs.

Funny that you should pick this example.  There is no 'qcom,apq8064.h'
and it appears that this driver and device tree files use:

  - dt-bindings/clock/qcom,gcc-msm8960.h
  - dt-bindings/reset/qcom,gcc-msm8960.h

I'll point to those.

-Doug
