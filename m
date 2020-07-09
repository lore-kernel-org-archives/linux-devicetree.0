Return-Path: <SRS0=ioLT=AU=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91955C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jul 2020 16:44:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 685D42077D
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jul 2020 16:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594313046;
	bh=L7QAL8lLLumFtYMjQECXrFQsCftj7J1a3RLe7kGg4jE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=xGl7tupi7doqpBexHzYm6NqLLG9v4d8PDKYxRm1JQfUOKNyO94FMu/736jsiom3zy
	 ZButDIQSDQxBctL4fs3pNCNuEzGiW+cTs6eGtenWIMkddq6Ap+2JS27RJTUfDQSO8U
	 rsz2T0ZpgT3DtLK5qadlSmIrT9Wpp3pIzlwVQ8pI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726729AbgGIQoG (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 9 Jul 2020 12:44:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:39250 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726339AbgGIQoF (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 9 Jul 2020 12:44:05 -0400
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2BF19207FC;
        Thu,  9 Jul 2020 16:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594313045;
        bh=L7QAL8lLLumFtYMjQECXrFQsCftj7J1a3RLe7kGg4jE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Sr9bqUrUJxcwi5HS1CgSWWGaqFMTqqcOY8byhe06CPkksoKQvMLzFgC0iVZoWUGuC
         12SSqbhZNMN7Edmkf4m/TDZaS+lNdJ9L1nca37gu9xoki6klAu+9wmNMFD2hgTEFTR
         H5I1clHpa4/DGUI+mNJmjebu7pVIGSaiopXDA0Go=
Received: by mail-oi1-f175.google.com with SMTP id w17so2400652oie.6;
        Thu, 09 Jul 2020 09:44:05 -0700 (PDT)
X-Gm-Message-State: AOAM5330tTrmN3JmBxL45io0ss5ajk/TKzQK5rutVw9gwgGrtLjjI7Xy
        wt75z7OcpNwDKcZ3LUMgVv9900aCHK5nVZQIhg==
X-Google-Smtp-Source: ABdhPJwuJLOgE4dZrJb/0wVo3GpaQESIDFZRLbjdN78LiqQVgkh5D4In9QEr2TPSL5gQzegA25PHztiQWy7EmbrkWy4=
X-Received: by 2002:aca:30d2:: with SMTP id w201mr810251oiw.147.1594313044489;
 Thu, 09 Jul 2020 09:44:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200704143544.789345-1-sam@ravnborg.org> <20200704143544.789345-2-sam@ravnborg.org>
 <CAMuHMdXWXk=QUbpFeX6bjwp+JWKgHqiQALTdQJgSgwBRkyvkRA@mail.gmail.com> <20200704212615.GA1693435@ravnborg.org>
In-Reply-To: <20200704212615.GA1693435@ravnborg.org>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 9 Jul 2020 10:43:53 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+T8QZmH3RSx-mj_HPE0qW0pemRE6rYV9-QEbooa-oiVg@mail.gmail.com>
Message-ID: <CAL_Jsq+T8QZmH3RSx-mj_HPE0qW0pemRE6rYV9-QEbooa-oiVg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] dt-bindings: fix simple-framebuffer example
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sat, Jul 4, 2020 at 3:26 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> On Sat, Jul 04, 2020 at 11:03:21PM +0200, Geert Uytterhoeven wrote:
> > Hi Sam,
> >
> > Thanks for your patch!
> >
> > On Sat, Jul 4, 2020 at 4:37 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> > > Now that dt-extract-example gained support for using root nodes
> > > in examples, update the example for the simple-frambuffer binding to use it.
> >
> > simple-framebuffer
> Thanks, will fix.
>
> >
> > > This gives us a better example and kill a long standing warning:
> > >
> > > simple-framebuffer.example.dts:23.16-39.11:
> > > Warning (chosen_node_is_root): /example-0/chosen: chosen node must be at root node
> > >
> > > Note: To get the update dt-extract-example execute:
> > > pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade
> > >
> > > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> >
> > > --- a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
> > > +++ b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
> > > @@ -152,28 +152,29 @@ additionalProperties: false
> > >
> > >  examples:
> > >    - |
> > > -    aliases {
> > > -      display0 = &lcdc0;
> >
> > Why drop the aliases example?
> I did not see it had any value for the binding that the example shall
> demonstrate. But it was not somthing I have given much thought of.

I don't think anything actually supports 'display' aliases and it is
beyond the scope of this binding, so I'd drop.

stdout-path should be dropped too as it points to this.

Rob
