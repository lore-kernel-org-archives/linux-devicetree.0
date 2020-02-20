Return-Path: <SRS0=21hy=4I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2975C11D0C
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Feb 2020 19:38:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B8B62208CD
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Feb 2020 19:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582227539;
	bh=IImhIpXQHLsVWHOTFfRjPqr3DNYlAfqdkTR10VY+v08=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=s1D00DAr1gamYNRM46rgzDxSJapQr3D+0B6er8pUMfhSu4HRjsFIL7qtSnSEHa3bU
	 G/L/yUjSlA6t2gL/0tO4GzaEY5TSDue8VVyMa4ZROym3BiT00vtFnhAK45VwN8BYkU
	 LGGAs68BJ0jI6LnhBM2CQ/o1YjIpYfcjNq3BtJDk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728759AbgBTTi7 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 20 Feb 2020 14:38:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:41538 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728248AbgBTTi7 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 20 Feb 2020 14:38:59 -0500
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 842402465D;
        Thu, 20 Feb 2020 19:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582227538;
        bh=IImhIpXQHLsVWHOTFfRjPqr3DNYlAfqdkTR10VY+v08=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=yexM5yuUfCHrhwQCWxbacWrejBJwLeYpC4gbEYNXidG5m7O5gIJKHk/a8FLE+few2
         IJJj3tBU5nRKpumEqIJi07lyB+1CpG9+0Kw18eAbxEszu9oZPMiEWFE2y9k6dyOMvN
         teJJ4C0NuI1YBa0uuXycY7pnBO71LRHZFwhWHCgI=
Received: by mail-qk1-f182.google.com with SMTP id b7so4712698qkl.7;
        Thu, 20 Feb 2020 11:38:58 -0800 (PST)
X-Gm-Message-State: APjAAAUBGsEi/rnoQbAzjL0vRJRYOAH2Hu3yIiaU5RF7Qi+EBWpBfrv+
        chceQJK80NIUm/2lByCRHj+MrDYRIbtQu1197Q==
X-Google-Smtp-Source: APXvYqxK31PuR/mC2GifOubTB/mAdkh3PZjv+HTIqg9smA3ua/7xRkdCEU8fN2lAdCqevLlUfHaorEEVN8o3jWhflzE=
X-Received: by 2002:a37:9d47:: with SMTP id g68mr24107540qke.119.1582227537683;
 Thu, 20 Feb 2020 11:38:57 -0800 (PST)
MIME-Version: 1.0
References: <87blq1zr8n.wl-kuninori.morimoto.gx@renesas.com>
 <20200219155808.GA25095@bogus> <871rqqt0nj.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <871rqqt0nj.wl-kuninori.morimoto.gx@renesas.com>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 20 Feb 2020 13:38:46 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJJMNr6BWiw=Sv-nN8zQ=C+TrwFua0zWrMYJdxoNoZ09Q@mail.gmail.com>
Message-ID: <CAL_JsqJJMNr6BWiw=Sv-nN8zQ=C+TrwFua0zWrMYJdxoNoZ09Q@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: dt-bindings: simple-card: switch to yaml base Documentation
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux-ALSA <alsa-devel@alsa-project.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Feb 19, 2020 at 9:09 PM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
>
> Hi Rob
>
> > > From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > >
> > > This patch switches from .txt base to .yaml base Document.
> > >
> > > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > > ---
> (snip)
> > > +  dai:
> > > +    type: object
> > > +    properties:
> > > +      sound-dai:
> > > +        $ref: /schemas/types.yaml#/definitions/phandle-array
> >
> > This should have a common definition elsewhere which I'd prefer be in
> > the dtschema repo. You can just assume there is and do 'maxItems: 1'
> > here assuming it's only 1.
>
> I think dai and/or sound-dai are not common definition.
> These are very simple-card specific property.

Qcom platforms also use 'sound-dai' and they aren't simple-card.

Rob
