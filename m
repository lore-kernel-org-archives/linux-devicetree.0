Return-Path: <SRS0=1UAq=6U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1897CC28CBC
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 May 2020 18:43:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ECADB2080D
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 May 2020 18:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1588790617;
	bh=Q6RkpgZui4xxKW3IPW+WWsSAA2i9xVEZ218yB9mb8U4=;
	h=References:In-Reply-To:From:Date:Subject:To:List-ID:From;
	b=rZGehLq5toPIRjyUDlQrnomRyeuXGL4K6al53mTP8oAs6lraXSbdTtBAw5w/jnhrg
	 hjw/6dcNzDeaRAL2NZkAJkh5o4eO+KjzFYMNG/vFkMJb8PoKbH1UtG6UdAeByutS/u
	 tPUX4WcS3L+IdEpzy1Szp30dDJ+Z0jGYZPeGN6rI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730317AbgEFSng (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 6 May 2020 14:43:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:46514 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729895AbgEFSng (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 6 May 2020 14:43:36 -0400
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 72CB6206B8
        for <devicetree@vger.kernel.org>; Wed,  6 May 2020 18:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588790615;
        bh=Q6RkpgZui4xxKW3IPW+WWsSAA2i9xVEZ218yB9mb8U4=;
        h=References:In-Reply-To:From:Date:Subject:To:From;
        b=yFn884xni9JY20CkoXo0VPjlSlH/8PHEY4WJ6cNaUqZe9ZVpDdQpj8qzDSgrc2y7B
         YDDtgOYeKFkALfNNGAAwmxo/+22HFHIu3qAYYTuSQmnQNvPxuRcevZzBCnBBg4+EJF
         GO+UBadiRhdE5swnNjFh+YBd4wWG4h5Xt5EeucKc=
Received: by mail-oi1-f171.google.com with SMTP id o24so2702898oic.0
        for <devicetree@vger.kernel.org>; Wed, 06 May 2020 11:43:35 -0700 (PDT)
X-Gm-Message-State: AGi0PuYqqjbxqTMO6XJcvwbX/gPjfDnhXo6W8Cvy0J39ruZgf7I09Xm2
        RrBHHeDvbLtLgHIoNTU9Upu6kAvq022hosFrSQ==
X-Google-Smtp-Source: APiQypLTEYXk8ZoVzmC89c8YzRW4Bi0nYQXkI3b3h7xtEyMlZUH63k5FskEtailA/G6ud2E6uDe2zYlaVZvTzY9+99c=
X-Received: by 2002:a05:6808:24f:: with SMTP id m15mr3991289oie.152.1588790614731;
 Wed, 06 May 2020 11:43:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200501083227.10886-1-ricardo.canuelo@collabora.com>
 <20200501083227.10886-6-ricardo.canuelo@collabora.com> <20200505185607.GA25651@bogus>
 <20200506131057.uqdo7uca32ehglcd@rcn-XPS-13-9360>
In-Reply-To: <20200506131057.uqdo7uca32ehglcd@rcn-XPS-13-9360>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 6 May 2020 13:43:23 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLs_0NV0VKsUw2rKq+Ua82Ay7LCroiyweOgkSQMA9EPZQ@mail.gmail.com>
Message-ID: <CAL_JsqLs_0NV0VKsUw2rKq+Ua82Ay7LCroiyweOgkSQMA9EPZQ@mail.gmail.com>
Subject: Re: [RFT PATCH 5/5] dt-bindings: drm: bridge: adi,adv7511.txt:
 convert to yaml
To:     Rob Herring <robh@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Collabora Kernel ML <kernel@collabora.com>,
        devicetree@vger.kernel.org,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wei Xu <xuwei5@hisilicon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, May 6, 2020 at 8:11 AM Ricardo Ca=C3=B1uelo
<ricardo.canuelo@collabora.com> wrote:
>
> Hi Rob, thanks for taking the time to review the patch. Some comments
> below:
>
> On mar 05-05-2020 13:56:07, Rob Herring wrote:
> > > +  # adi,input-style and adi,input-justification are required except =
in
> > > +  # "rgb 1x" and "yuv444 1x" modes.
> > > +  - if:
> > > +      not:
> > > +        properties:
> > > +          adi,input-colorspace:
> > > +            contains:
> > > +              enum: [ rgb, yuv444 ]
> > > +          adi,input-clock:
> > > +            contains:
> > > +              const: 1x
> >
> > I believe this will be true (before the not) if the properties are not
> > present. You need 'required' if that's not what you want.
>
> I'm not sure I understand what you mean, but dt_binding_check doesn't
> say anything about adi,input-style and adi,input-justification being
> required when adi,input-colorspace and adi,input-clock are not present.
>
> I think I covered every possible case wrt those properties when running
> dt_binding_check and I got the results I was looking for:
>
> - When compatible is either "adi,adv7533" or "adi,adv7535",
>   adi,input-colorspace and adi,input-clock aren't required
>
> - For any of the other compatible strings, adi,input-colorspace and
>   adi,input-clock are required.
>
> - When adi,input-colorspace and adi,input-clock are defined and they are
>   different than "rgb 1x" or "yuv444 1x", adi,input-style and
>   adi,input-justification are required.
>
> There's an issue I can't figure out, though. adi,input-colorspace and
> adi,input-clock are defined only for devices other than "adi,adv7533"
> and "adi,adv7535", but a DT for one of these devices can use those
> properties and the binding check won't complain. Moreover, it will check
> the above condition even if it doesn't make sense for them (ie. it may
> complain that adi,input-style and adi,input-justification are required
> even if they aren't defined for "adi,adv7533" and "adi,adv7535").
>
> I think it's a minor issue, but do you know if there's a way to model
> that? Are properties always unconditionally defined?

I think you want something like this:

if:
  properties:
    compatible:
      contains:
        enum:
          - adi,adv7533
          - adi,adv7535
then:
  not:
    properties:
      adi,input-style: false
      adi,input-justification: false

Which means the schema fails if either property is present.

It may also just be easier to split this schema into 2. It's a
judgement call on how much is shared vs. how much if/then/else logic
there is.

Rob
