Return-Path: <SRS0=BDx3=4U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F179C3F2C6
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Mar 2020 20:47:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4FD2320848
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Mar 2020 20:47:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iTZkdrGA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731929AbgCCUrZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 3 Mar 2020 15:47:25 -0500
Received: from mail-vk1-f196.google.com ([209.85.221.196]:42310 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730274AbgCCUrY (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 3 Mar 2020 15:47:24 -0500
Received: by mail-vk1-f196.google.com with SMTP id c126so3635vkg.9
        for <devicetree@vger.kernel.org>; Tue, 03 Mar 2020 12:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H8LzC1FkDwsheob6ti11k957HeWZgskHzijDc9F3t1w=;
        b=iTZkdrGA7NLhytKTFhNkpSopPcJQivDis2tK/K84C2BmU7f//AGarD3Oi4ul4ZA5p2
         7ovMAz3duyVE7c7Gv9VYoR3nLxlVYWx4rLEXsVN6WEQivNege4qeNkPtMcAlLt76rsWq
         Sinub/FqaZUGTX7YrfSxoqY9xjrIuQ2ylwK2Ohy8yi57pBWR94i6Ve/S0VZ5O8r1AekV
         VNQBsdRAjRQoyvR3/N/mMB+VTBIWZpZm/vQA3UOfuXMwRP146yoUc9A+iJ8H80IJ4sZI
         tdqKkxfsSVRdT0cgM7rQ7gytnqS22pY9sB8LGDZRbK1CwwGcRn3E7ApDCfhnm4bvqcm6
         Mz1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H8LzC1FkDwsheob6ti11k957HeWZgskHzijDc9F3t1w=;
        b=SQXtmXQ7EhrK8UdMtzu/mU/V0AMH4/X5i3zgb58uwGUWcqH2OoCb2Zaz086mOPgghh
         4peCPWiWUTg9P9mKk4wZEuBGxPjJ4bJQpf+S+1Oxhiu2F4R5r/y9cs5d4lPH9DFCwlK+
         0qWp+bZ6nQN0gfi0l+T/jwSpCRIJoVbAPrjtIauaagkckNq0C/AAqtXVhHP0BD+7Yq4G
         wvKTa6mzUoYF3jD0KlF4Q4yQy7uSBz733HQ3ZV15x3qFlIIf1uFwFjWCYzi5/SPSMIf4
         pKPc5u39xpwOjOJXgRxoeMBI+LR+5snTBYFnTJ9F4DqWo274VeTrCkQ/Q8AzL56UrcVz
         ebGQ==
X-Gm-Message-State: ANhLgQ30nwJ/Q7kvM1gM3MmUy1nVSH9xpZkOosSTZLCT+r7irrms5JV2
        ct24orgzrm+6bGyH6d8UTcJqiD4UPTcqp32PeVRJWg==
X-Google-Smtp-Source: ADFU+vuERFMpkWbnyw88Lrbiz3fboR9TvgiMmam5QelmxN9WhhxeUBTbt3kTGF03KMhQ35qpLPhxK03B5kLIBCnDqzw=
X-Received: by 2002:ac5:c844:: with SMTP id g4mr3978713vkm.25.1583268443466;
 Tue, 03 Mar 2020 12:47:23 -0800 (PST)
MIME-Version: 1.0
References: <20200303150749.30566-1-ulf.hansson@linaro.org>
 <20200303150749.30566-5-ulf.hansson@linaro.org> <20200303170348.GB26191@bogus>
In-Reply-To: <20200303170348.GB26191@bogus>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 3 Mar 2020 21:46:47 +0100
Message-ID: <CAPDyKFpcpjaouXeFOm+Fj+9x7KeaRyBYLY+5oDVLYnmkV93hTg@mail.gmail.com>
Subject: Re: [PATCH 4/7] dt-bindings: power: Extend nodename pattern for
 power-domain providers
To:     Rob Herring <robh@kernel.org>
Cc:     Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>,
        DTML <devicetree@vger.kernel.org>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Benjamin Gaignard <benjamin.gaignard@st.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux PM <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 3 Mar 2020 at 18:04, Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Mar 03, 2020 at 04:07:46PM +0100, Ulf Hansson wrote:
> > The existing binding requires the nodename to have a '@', which is a bit
> > limiting for the wider use case. Therefore, let's extend the pattern to
> > allow either '@' or '-'.
>
> That's fine, but...
>
> > Additionally, let's update one of the examples to show how the updated
> > pattern could be used.
> >
> > Fixes: a3f048b5424e ("dt: psci: Update DT bindings to support hierarchical PSCI states")
> > Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/power/power-domain.yaml | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/power/power-domain.yaml b/Documentation/devicetree/bindings/power/power-domain.yaml
> > index 207e63ae10f9..dc232759013e 100644
> > --- a/Documentation/devicetree/bindings/power/power-domain.yaml
> > +++ b/Documentation/devicetree/bindings/power/power-domain.yaml
> > @@ -25,7 +25,7 @@ description: |+
> >
> >  properties:
> >    $nodename:
> > -    pattern: "^(power-controller|power-domain)(@.*)?$"
> > +    pattern: "^(power-controller|power-domain)([@-].*)?$"
> >
> >    domain-idle-states:
> >      $ref: /schemas/types.yaml#/definitions/phandle-array
> > @@ -71,13 +71,13 @@ required:
> >
> >  examples:
> >    - |
> > -    power: power-controller@12340000 {
> > -        compatible = "foo,power-controller";
> > +    power: power-domain-foo {
> > +        compatible = "foo,power-domain";
> >          reg = <0x12340000 0x1000>;
>
> When you have 'reg' you should have a unit-address.

Yes, of course, thanks!

[...]

Kind regards
Uffe
