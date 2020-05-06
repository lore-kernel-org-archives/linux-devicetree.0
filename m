Return-Path: <SRS0=1UAq=6U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0699C28CBC
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 May 2020 13:11:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D10DB2073A
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 May 2020 13:11:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728542AbgEFNLD (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 6 May 2020 09:11:03 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:54284 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728045AbgEFNLD (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 6 May 2020 09:11:03 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: rcn)
        with ESMTPSA id 0A2E62A1153
Date:   Wed, 6 May 2020 15:10:57 +0200
From:   Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To:     Rob Herring <robh@kernel.org>
Cc:     laurent.pinchart@ideasonboard.com, kernel@collabora.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        geert+renesas@glider.be, xuwei5@hisilicon.com
Subject: Re: [RFT PATCH 5/5] dt-bindings: drm: bridge: adi,adv7511.txt:
 convert to yaml
Message-ID: <20200506131057.uqdo7uca32ehglcd@rcn-XPS-13-9360>
Mail-Followup-To: Rob Herring <robh@kernel.org>,
        laurent.pinchart@ideasonboard.com, kernel@collabora.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        geert+renesas@glider.be, xuwei5@hisilicon.com
References: <20200501083227.10886-1-ricardo.canuelo@collabora.com>
 <20200501083227.10886-6-ricardo.canuelo@collabora.com>
 <20200505185607.GA25651@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200505185607.GA25651@bogus>
User-Agent: NeoMutt/20171215
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Rob, thanks for taking the time to review the patch. Some comments
below:

On mar 05-05-2020 13:56:07, Rob Herring wrote:
> > +  # adi,input-style and adi,input-justification are required except in
> > +  # "rgb 1x" and "yuv444 1x" modes.
> > +  - if:
> > +      not:
> > +        properties:
> > +          adi,input-colorspace:
> > +            contains:
> > +              enum: [ rgb, yuv444 ]
> > +          adi,input-clock:
> > +            contains:
> > +              const: 1x
> 
> I believe this will be true (before the not) if the properties are not 
> present. You need 'required' if that's not what you want.

I'm not sure I understand what you mean, but dt_binding_check doesn't
say anything about adi,input-style and adi,input-justification being
required when adi,input-colorspace and adi,input-clock are not present.

I think I covered every possible case wrt those properties when running
dt_binding_check and I got the results I was looking for:

- When compatible is either "adi,adv7533" or "adi,adv7535",
  adi,input-colorspace and adi,input-clock aren't required

- For any of the other compatible strings, adi,input-colorspace and
  adi,input-clock are required.

- When adi,input-colorspace and adi,input-clock are defined and they are
  different than "rgb 1x" or "yuv444 1x", adi,input-style and
  adi,input-justification are required.

There's an issue I can't figure out, though. adi,input-colorspace and
adi,input-clock are defined only for devices other than "adi,adv7533"
and "adi,adv7535", but a DT for one of these devices can use those
properties and the binding check won't complain. Moreover, it will check
the above condition even if it doesn't make sense for them (ie. it may
complain that adi,input-style and adi,input-justification are required
even if they aren't defined for "adi,adv7533" and "adi,adv7535").

I think it's a minor issue, but do you know if there's a way to model
that? Are properties always unconditionally defined?

Cheers,
Ricardo
