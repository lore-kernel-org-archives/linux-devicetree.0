Return-Path: <SRS0=kwC1=3S=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA20AC2D0DB
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Jan 2020 23:26:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B0DD9206D5
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Jan 2020 23:26:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BcPiQZ5S"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726663AbgA2X0c (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 29 Jan 2020 18:26:32 -0500
Received: from mail-vs1-f67.google.com ([209.85.217.67]:44451 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726401AbgA2X0b (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 29 Jan 2020 18:26:31 -0500
Received: by mail-vs1-f67.google.com with SMTP id p6so939794vsj.11
        for <devicetree@vger.kernel.org>; Wed, 29 Jan 2020 15:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i7N+u7jIEmW2dEm6HMr/PJpc28EuZkXAo6+795EdEII=;
        b=BcPiQZ5SuJEvE1fQj57PZ+wzmmd808hNTnOOB4AlJVy5FOFhfMhZ+eYc5VslB0c9p7
         HWIZA9A3sPKouTjZOwZA0VIgpcHe4dXyeW66GQcjrOoysN1VklosEVlDkDgnXaTfNQWR
         tV1nUX1/Ny+DJaWid/uedWBQVBp/0+6z+ajuc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i7N+u7jIEmW2dEm6HMr/PJpc28EuZkXAo6+795EdEII=;
        b=jwZd/obGdYyM6VfmCm1a9FxFW/gMY0x72awKTI0sARPZGm49Goxd/VRF+LqzAYHi2z
         ud4CsH+mzlx0KksnFO4C+aMiaiWa0wNfrSbOAMA5DRZSVlDhy7q01NieqtkXe997eKfw
         tSPfmMphoSlluW4c0iQKPk+tscM+AZ0Ah9qf0Md0Uc/0BmV8Jbe8JTfGIpITdZtOR/ZD
         /4OyZ8j+nrEIhj48NylksL5ZYGrQenkZGXfy2q0TBbKXPG3dAArYqsJKSsvFAP/Xi+SH
         AYiLsc6HdC5r3KOW1VeLt+j7Zx1SKo9lp3fX3wbjg+UWrDMP0LEVC5eSQppU9+EBV43b
         Comg==
X-Gm-Message-State: APjAAAWaNuz/63kMMssGq8uiGJI1HC7Y7HJB/HnXQ75PgYGvaulO/4em
        EfLqy+snXCyfQ1Up1uXmpssP2xPX0Es=
X-Google-Smtp-Source: APXvYqxAZYUg+dk0F3wTm5HPj5lKIaCV6JEGG5yaUZ4FJ6/vkId/HoegR9AUrulIUsDWoOJSaeXMaA==
X-Received: by 2002:a67:f49a:: with SMTP id o26mr1543688vsn.124.1580340390461;
        Wed, 29 Jan 2020 15:26:30 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id f17sm850569uaq.19.2020.01.29.15.26.29
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2020 15:26:29 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id f7so432334uaa.8
        for <devicetree@vger.kernel.org>; Wed, 29 Jan 2020 15:26:29 -0800 (PST)
X-Received: by 2002:ab0:30c2:: with SMTP id c2mr955764uam.8.1580340388829;
 Wed, 29 Jan 2020 15:26:28 -0800 (PST)
MIME-Version: 1.0
References: <20200129132313.1.I4452dc951d7556ede422835268742b25a18b356b@changeid>
 <CAL_JsqJk1NZSDAXgqc-CS9a1UCmNYPhC-LwjPUZaX2oK=EtHzQ@mail.gmail.com>
In-Reply-To: <CAL_JsqJk1NZSDAXgqc-CS9a1UCmNYPhC-LwjPUZaX2oK=EtHzQ@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 29 Jan 2020 15:26:16 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XLq4-EdsuKnDjuc3-6P3i6o-tV5MJbdFbvAscF_ouOpg@mail.gmail.com>
Message-ID: <CAD=FV=XLq4-EdsuKnDjuc3-6P3i6o-tV5MJbdFbvAscF_ouOpg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: clk: qcom: Fix self-validation, split, and
 clean cruft
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, Taniya Das <tdas@codeaurora.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Abhishek Sahu <absahu@codeaurora.org>, sivaprak@codeaurora.org,
        anusharao@codeaurora.org, Sricharan <sricharan@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Wed, Jan 29, 2020 at 2:01 PM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Wed, Jan 29, 2020 at 3:23 PM Douglas Anderson <dianders@chromium.org> wrote:
> >
> > The 'qcom,gcc.yaml' file failed self-validation (dt_binding_check)
> > because it required a property to be either (3 entries big),
> > (3 entries big), or (7 entries big), but not more than one of those
> > things.  That didn't make a ton of sense.
> >
> > This patch splits all of the exceptional device trees (AKA those that
> > would have needed if/then/else rules) from qcom,gcc.yaml.  It also
> > cleans up some cruft found while doing that.
> >
> > After this lands, this worked for me atop clk-next:
> >   for f in \
> >     Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml \
> >     Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml \
> >     Documentation/devicetree/bindings/clock/qcom,gcc-msm8996.yaml \
> >     Documentation/devicetree/bindings/clock/qcom,gcc-msm8998.yaml \
> >     Documentation/devicetree/bindings/clock/qcom,gcc-qcs404.yaml \
> >     Documentation/devicetree/bindings/clock/qcom,gcc-sc7180.yaml \
> >     Documentation/devicetree/bindings/clock/qcom,gcc-sm8150.yaml \
> >     Documentation/devicetree/bindings/clock/qcom,gcc.yaml; do \
> >       ARCH=arm64 make dt_binding_check DT_SCHEMA_FILES=$f; \
> >       ARCH=arm64 make dtbs_check DT_SCHEMA_FILES=$f; \
> >   done
>
> Note that using DT_SCHEMA_FILES may hide some errors in examples as
> all other schemas (including the core ones) are not used for
> validation. So just 'make dt_binding_check' needs to pass (ignoring
> any other unrelated errors as it breaks frequently). Supposedly a
> patch is coming explaining this in the documentation.

That seems like it's going to be a huge pain going forward, but OK.  I
kept running "dtbs_check" with the DT_SCHEMA_FILES since I guess this
was OK?  Then I ran this atop next-20200129:

# Delete broken yaml:
rm Documentation/devicetree/bindings/pci/intel-gw-pcie.yaml
ARCH=arm64 make dt_binding_check | grep 'clock/qcom'

...and that seemed OK to me.  I've updated the commit message to
include what I did.  Hopefully it's right.

> > +  nvmem-cell-names:
> > +    minItems: 1
> > +    maxItems: 2
> > +    description:
> > +      Names for each nvmem-cells specified.
>
> Isn't that every instance? So drop.

Dropped the description here.

> Otherwise, assuming it all works:
>
> Reviewed-by: Rob Herring <robh@kernel.org>

Thanks.  v2 now with your feedback and Jeffrey's at:
http://lore.kernel.org/r/20200129152458.v2.1.I4452dc951d7556ede422835268742b25a18b356b@changeid
