Return-Path: <SRS0=Lhmw=77=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DDD7C433E0
	for <linux-devicetree@archiver.kernel.org>; Thu, 18 Jun 2020 15:24:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E72332075E
	for <linux-devicetree@archiver.kernel.org>; Thu, 18 Jun 2020 15:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1592493858;
	bh=AmtXm5L3fg/aW7CWz+8CweWHogcaL8V5UloVReNpxBo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=lPEEYPEJMgEgXI4a414wlcoViOozfA8mxj6LuVZypU4BxBOHrDGcPEMWTxm1lgLOw
	 IEwNbMJU+SgupfN76kgHuyr2fWCb7mYoGUDmJNJOUvwfgumFt9aqj7steRX4XVOoTW
	 QUcGgkfHwBJXXGMWdXS41+vq+46LuzwXpOl/Mdm0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729386AbgFRPYN (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 18 Jun 2020 11:24:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:37760 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728050AbgFRPYL (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 18 Jun 2020 11:24:11 -0400
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B65842075E;
        Thu, 18 Jun 2020 15:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592493850;
        bh=AmtXm5L3fg/aW7CWz+8CweWHogcaL8V5UloVReNpxBo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=sej8ny5DaMaKnlSllZ1rLNeVkurAbcohdw71N/fZ2zXapjuvmppsBvAUOY8oi/Q0b
         6fsooQeJfEuZEwfZh2sGh7+OLujMVyrJetzimaVIl4BFnYlfL9ZWvrFezw2ld0s5zA
         BspGJNejaTjBD+25DmAKJpx0+qfHnAs08GzTrmGo=
Received: by mail-oi1-f173.google.com with SMTP id i74so5428997oib.0;
        Thu, 18 Jun 2020 08:24:10 -0700 (PDT)
X-Gm-Message-State: AOAM533OY1daISf0oji0kY4UJbuAKrPD7HkPSbjV6D9DbKtAVdzfOot4
        B6zMjVQ6dVKcpl4EhuDj4Gx7psHwPqx2RD4BuA==
X-Google-Smtp-Source: ABdhPJy7GsrN7YBg7GMVcxRqJrojJJiNqK3of5ZJghhr61KcyvWZH23JUJgifDJg+AiLMAEtho9WXfQt3o8ASHVsAHE=
X-Received: by 2002:aca:1e0b:: with SMTP id m11mr3427660oic.147.1592493850002;
 Thu, 18 Jun 2020 08:24:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200612141903.2391044-1-thierry.reding@gmail.com>
 <20200612141903.2391044-8-thierry.reding@gmail.com> <20200617231326.GD2975260@bogus>
 <20200618141630.GB3663225@ulmo>
In-Reply-To: <20200618141630.GB3663225@ulmo>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 18 Jun 2020 09:23:58 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLfpSgJxRMNTFdAsSEVOTU6a7bzD8v8Sg1LPXHdgEmdAQ@mail.gmail.com>
Message-ID: <CAL_JsqLfpSgJxRMNTFdAsSEVOTU6a7bzD8v8Sg1LPXHdgEmdAQ@mail.gmail.com>
Subject: Re: [PATCH 07/38] dt-bindings: display: tegra: Convert to json-schema
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     devicetree@vger.kernel.org,
        linux-tegra <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Jun 18, 2020 at 8:16 AM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> On Wed, Jun 17, 2020 at 05:13:26PM -0600, Rob Herring wrote:
> > On Fri, Jun 12, 2020 at 04:18:32PM +0200, Thierry Reding wrote:
> > > From: Thierry Reding <treding@nvidia.com>
> > >
> > > Convert the Tegra host1x controller bindings from the free-form text
> > > format to json-schema.
> > >
> > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > > ---
> > >  .../display/tegra/nvidia,tegra20-host1x.txt   |  516 ------
> > >  .../display/tegra/nvidia,tegra20-host1x.yaml  | 1418 +++++++++++++++++
> > >  2 files changed, 1418 insertions(+), 516 deletions(-)
> > >  delete mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
> > >  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml

[...]

> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            enum:
> > > +              - nvidia,tegra124-host1x
> > > +              - nvidia,tegra210-host1x
> > > +              - nvidia,tegra186-host1x
> > > +              - nvidia,tegra194-host1x
> > > +    then:
> > > +      patternProperties:
> > > +        "^sor@[0-9a-f]+$":
> > > +          description: |
> > > +            The Serial Output Resource (SOR) can be used to drive HDMI, LVDS,
> > > +            eDP and DP outputs.
> > > +
> > > +            See ../pinctrl/nvidia,tegra124-dpaux-padctl.txt for information
> > > +            regarding the DPAUX pad controller bindings.
> > > +          type: object
> > > +          properties:
> > > +            # required
> > > +            compatible:
> > > +              oneOf:
> > > +                - const: nvidia,tegra124-sor
> > > +                - items:
> > > +                    - const: nvidia,tegra132-sor
> > > +                    - const: nvidia,tegra124-sor
> > > +                - const: nvidia,tegra210-sor
> > > +                - const: nvidia,tegra210-sor1
> > > +                - const: nvidia,tegra186-sor
> > > +                - const: nvidia,tegra186-sor1
> > > +                - const: nvidia,tegra194-sor
> > > +
> > > +            reg:
> > > +              maxItems: 1
> > > +
> > > +            interrupts:
> > > +              maxItems: 1
> > > +
> > > +            resets:
> > > +              items:
> > > +                - description: module reset
> > > +
> > > +            reset-names:
> > > +              items:
> > > +                - const: sor
> > > +
> > > +            status:
> > > +              $ref: "/schemas/dt-core.yaml#/properties/status"
> >
> > 'status' should never need to be listed.
>
> This seems to be needed at least when I try to validate against a single
> binding, like so:
>
>         $ make DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml dtbs_check
>
> I assume that that somehow prevents the tooling from looking at any of
> the other bindings, which in turn then causes status and other standard
> properties to never be defined and then it flags them as extra and
> causes a failure.

I'm surprised using DT_SCHEMA_FILES makes a difference. I'm guessing
that has your 'unevaluatedProperties' support. If so, that means
there's an unintended side effect that any common schema property
becomes always allowed. That's good for 'status' and 'phandle', but
not so much for 'reg', '*-gpios, '*-names', etc.

> I think I've even seen this trigger on dt_binding_check if I happened to
> have status in there. Now, you've mentioned elsewhere that we shouldn't
> use "status" in examples, so that would work around this. However, I
> think I've seen this happen as well in examples that referenced some
> node via phandle, and then dt_binding_check would emit an error about
> phandle being undefined.
>
> Perhaps this is a problem with the tooling? Should we instruct the
> scripts to always include the core schema even if we're only testing a
> single YAML file via DT_SCHEMA_FILES?

The purpose of DT_SCHEMA_FILES is to see warnings just from that
schema file. If the core schema was warning free, we could add that,
but it's not. Plus that wouldn't solve the problem here. 'status' and
'phandle' are added to each schema by the tooling (along with other
things), not by another schema file (well, they are in another schema
file, but they are added to each schema so that 'additionalProperties:
false' works).

This is certainly a limitation in the tooling in that what you have is
a bit different from the expected form. Generally it is expected that
everything is defined under the top-level 'properties' and then any
'if/then' schema only add further constraints. However, you have the
child nodes only defined under an if/then. We could fix that, but I'm
not sure I want to. IMO, extensive use of if/then is a sign the schema
should be split up. More on that below.


> > > +            pinctrl-names: true
> > > +            phandle:
> > > +              $ref: "/schemas/types.yaml#/definitions/uint32"
> >
> > 'phandle' shouldn't need to be listed.
> >
> > > +
> > > +          patternProperties:
> > > +            "^pinctrl-[0-9]+$": true
> >
> > pinctrl properties are automatically added, but maybe not if under an
> > 'if' schema. Really, I think probably either this should be split
> > into multiple schema files or all of these child nodes should be
> > described at the top-level. I'm not sure it's really important to define
> > which set of child nodes belong or not for each chip.
>
> I'm not too worried about the set of child nodes for each chip, but I
> think having this all in one file underlines the importance of the
> hierarchy. If these were discrete bindings for each of the compatible
> strings it'd be easy for someone to create them as standalone nodes in
> device tree, but that's not something that would work. All of these
> devices are children of host1x and they do depend on host1x for a lot
> of the functionality, so the hierarchy must be respected.

I'm not saying don't describe the hierarchy.

The first option is 1 host1x schema file per SoC (roughly) and the
'host1x' parent node would be duplicated in each one. That doesn't
worry me too much as it's all standard properties and not that many of
them. Though you could have a common 'host1x-bus.yaml' just describing
the parent node properties that each <soc>-host1x.yaml references.

The 2nd option is keep this as a single file, but just move every
child node definition under the top-level 'patternProperties'. This
option has the limitation that you can't enforce which child nodes are
valid per SoC.

> > I'm stopping there. I think the rest is more of the same comments.
>
> I've made a pass over the whole file and fixed the issues that you
> pointed out above in other places.
>
> Sounds like the biggest remaining issue is with the duplicated standard
> properties. I'm not a huge fan of giving up on doing the right thing
> because the tooling can't deal with it. I think we should fix the
> tooling to do the right thing. So if there's something in the core DT
> schema then it should apply regardless of what mode we run in. Much of
> the above issues should go away once that's fixed.
>
> Any thoughts on making some of the schema files "always included"? I
> haven't looked at this side of the tooling at all yet, so I'm not sure
> how difficult that would be, but if you're okay with it conceptually I
> can take a closer look.

Hopefully, it's clear why that doesn't help here. But don't worry,
there's plenty of other work to do on the tooling. :)

Rob
