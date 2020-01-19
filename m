Return-Path: <SRS0=IhJs=3I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F071CC33CAF
	for <linux-devicetree@archiver.kernel.org>; Sun, 19 Jan 2020 20:46:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BE607206ED
	for <linux-devicetree@archiver.kernel.org>; Sun, 19 Jan 2020 20:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579466779;
	bh=iLTtXLDkHHz2JIxgmomcXxy64FvVHqs7KRU1RkbxpsU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=jmUR9XUugjMKhILgYm7x8OTdBDzZiYdo443tGMcRR9i3drlgH1+UY8xLaDeyBnW9j
	 PDMDLxazs/PbDOlNB/+6TDj0jE7OGJ1u3vVV104LmEACwNeI6rNDN5j0e+kmAOcPJA
	 pSyaN9BVINB6zKTG8UhWiNjhH3+vaok0ibvbtEvM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728712AbgASUqT (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 19 Jan 2020 15:46:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:44134 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728682AbgASUqT (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sun, 19 Jan 2020 15:46:19 -0500
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0C69D2071C
        for <devicetree@vger.kernel.org>; Sun, 19 Jan 2020 20:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579466778;
        bh=iLTtXLDkHHz2JIxgmomcXxy64FvVHqs7KRU1RkbxpsU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=VV4GiwidXR9PxQpZkLUz24gfXrlYMqToxhtq5fWIeLiCZqtcrOB4Gx4hKiqcJSJ8q
         pYnS8G4wC9qWTUI7sv4mANsn/JQU1NNp470QnUe00FcK8sGUMwxMSXFc1aYg38asyT
         EDHcKfIcaJ3cWlghDcrKX3p/U1MupFY7l0U+WB2I=
Received: by mail-qt1-f173.google.com with SMTP id w47so26144405qtk.4
        for <devicetree@vger.kernel.org>; Sun, 19 Jan 2020 12:46:18 -0800 (PST)
X-Gm-Message-State: APjAAAX9V2DR0LgrDinMwMFR9RPmtqXKK2YuXseQy1D+MBoY9qXnzT+4
        hEMq6974MvQ0YoQ4d/bqXieOQuA5OSuhoO8sTA==
X-Google-Smtp-Source: APXvYqyu5+PulWr8z6EmF7wPM9pSHcMhOyEFXl/jZsxx18j8S/RNqEdYxJGxXK2ljxdxzwv5RwQI7sj8TtFabdah9fA=
X-Received: by 2002:ac8:59:: with SMTP id i25mr17446160qtg.110.1579466777098;
 Sun, 19 Jan 2020 12:46:17 -0800 (PST)
MIME-Version: 1.0
References: <20200117231756.3141-1-robh@kernel.org> <20200118091140.GA12245@ravnborg.org>
In-Reply-To: <20200118091140.GA12245@ravnborg.org>
From:   Rob Herring <robh@kernel.org>
Date:   Sun, 19 Jan 2020 14:46:06 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLMAbDM-eW8GXZzk6HyqGG4w+Up7KXrEJi8m9Y3c0478g@mail.gmail.com>
Message-ID: <CAL_JsqLMAbDM-eW8GXZzk6HyqGG4w+Up7KXrEJi8m9Y3c0478g@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: display: Convert a bunch of panels to DT schema
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     devicetree@vger.kernel.org,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sat, Jan 18, 2020 at 3:11 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Rob.
>
> On Fri, Jan 17, 2020 at 05:17:56PM -0600, Rob Herring wrote:
> > Convert all the 'simple' panels which match the constraints of the
> > common panel-simple.yaml schema. This conversion is based on how the
> > panels are documented. Some may turn out to be more complex once the
> > schema is applied to actual dts files.
>
> Thanks for updating this patch - and very good to reduce the number of
> files with almost the same content.
>
> One comment below, with that addressed:
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
>
> There are likely some dt files that assume panels need no power and need a
> fixed-regulator or something as power-supply now is mandatory.
> Should this be checked before we apply this patch?

Indeed there are, but we're not enforcing that schemas don't cause warnings yet.

> As we continue to see new panels more or less every week I would like
> this patch applied to drm-misc-next as soon as possible to avoid any
> future conflicts.
>
> > index 513f03466aba..000000000000
> > --- a/Documentation/devicetree/bindings/display/panel/innolux,p120zdg-bf1.txt
> > +++ /dev/null
> > @@ -1,22 +0,0 @@
> > -Innolux P120ZDG-BF1 12.02 inch eDP 2K display panel
> > -
> > -This binding is compatible with the simple-panel binding, which is specified
> > -in simple-panel.txt in this directory.
> > -
> > -Required properties:
> > -- compatible: should be "innolux,p120zdg-bf1"
> > -- power-supply: regulator to provide the supply voltage
> > -
> > -Optional properties:
> > -- enable-gpios: GPIO pin to enable or disable the panel
> > -- backlight: phandle of the backlight device attached to the panel
> > -- no-hpd: If HPD isn't hooked up; add this property.
>
> panel-simple.yaml does not include the no-hpd property.
> We only have 2 bindings, this and sharp,ld-d5116z01b.yaml
> that include the no-hpd property.
>
> We have two options:
> 1) add the no-hpd property to panel-simple.yaml
> 2) keep an independent binding for panels using no-hpd
>
> I suggest to keep an independent binding for innolux,p120zdg-bf1
> so we keep panel-simple.yaml slim.
> In other words do not delete this file and remove the compatible from
> panel-simple.yaml

Agreed. 'no-hpd' really only makes sense on eDP panels which have an a
somewhat standard connector.

Rob
