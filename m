Return-Path: <SRS0=2Ix+=4H=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FC3DC3404C
	for <linux-devicetree@archiver.kernel.org>; Wed, 19 Feb 2020 03:02:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EE70224656
	for <linux-devicetree@archiver.kernel.org>; Wed, 19 Feb 2020 03:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582081325;
	bh=nr9NRxCSC/5XxJvjpVP20Tg/XNoQuYXZTRVgo5/nYLw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=DbZ5EY8gGy9+o1axP0X0pqMUGw3iJfaR7kJkXr7LeGLbuYhNF4xQNf0W6zhk/NbWs
	 N37s+uChJLbiOf0eXxMlsqjUqgf4yl+sndIrUXXvvE3NcXp8UVrnrSqbRjW6uPzQwS
	 H3YSXSVUYT6kgnRCsDISpZVIhh2VXHZ4mFRDKgSY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728230AbgBSDCE (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 18 Feb 2020 22:02:04 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:40838 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728202AbgBSDCE (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 18 Feb 2020 22:02:04 -0500
Received: by mail-ot1-f67.google.com with SMTP id i6so21734223otr.7
        for <devicetree@vger.kernel.org>; Tue, 18 Feb 2020 19:02:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rFMkjGpB5P5Yuyv7sMOcWjIo25hp6v2dU13cY3mBC+g=;
        b=IWGEUfZg1OA7o37kYIeNFpuwiz52cpdSaR1UK03zYUbmPi7ZXuFhrdaN2Jh/UhPmpK
         YYw86f6cNvHJq3W6Q2uIZqsiZUVK7l/eWZC8ij6KnOem9nSatzJiQ5MjB7TarnocC7g0
         muNkQMgiRK8i4VInyrNYfLtOVgwIkVBf3lUYTnbVTrqrvnw+ZetCeCQHgBkJvHOxiy2v
         NZBWB7fkUOcczyS9GzCntt56sGS57e0Dty/RBriD9TcZrTUHAXB/L4On1KjDcuqijToy
         nVDR3VVcwSt7MsF2Ak8Y6B3vzuofXnRBxePJA7EpfGEH7NLLG3e6XPNmQ79EspNat4jX
         QLyA==
X-Gm-Message-State: APjAAAWPuQ8kEkaiy5sxbbyoQWNVt4Id9GduKhIeay1a2ExFAblAYA6I
        a9SH9aLdPmenoRUaP2tp0g==
X-Google-Smtp-Source: APXvYqyVd0GEkqGJFCg+0jQjwfkr57L6CDJVWGnKS41CanYOhCgraDFMbXd01paM8WkuNqUqCyvUPA==
X-Received: by 2002:a05:6830:140f:: with SMTP id v15mr18148994otp.218.1582081322305;
        Tue, 18 Feb 2020 19:02:02 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id h15sm197130otq.67.2020.02.18.19.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2020 19:02:01 -0800 (PST)
Received: (nullmailer pid 14184 invoked by uid 1000);
        Wed, 19 Feb 2020 03:02:00 -0000
Date:   Tue, 18 Feb 2020 21:02:00 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree@vger.kernel.org,
        Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
        Maxime Ripard <mripard@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Steffen Trumtrar <s.trumtrar@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v3 4/5] dt-bindings: display: add data-mapping to
 panel-dpi
Message-ID: <20200219030200.GA9263@bogus>
References: <20200216181513.28109-1-sam@ravnborg.org>
 <20200216181513.28109-5-sam@ravnborg.org>
 <CAL_Jsq+AbXEiLCYiAvwr5qzbSnuo9G8bTwAM3G9J4cPYz1_FMw@mail.gmail.com>
 <20200218221638.GA27927@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200218221638.GA27927@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Feb 18, 2020 at 11:16:38PM +0100, Sam Ravnborg wrote:
> On Tue, Feb 18, 2020 at 02:13:45PM -0600, Rob Herring wrote:
> > On Sun, Feb 16, 2020 at 12:15 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> > >
> > > Add data-mapping property that can be used to specify
> > > the media format used for the connection betwwen the
> > > display controller (connector) and the panel.
> > > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > 
> > Missing blank line.
> > 
> > > ---
> > >  .../devicetree/bindings/display/panel/panel-dpi.yaml | 12 +++++++++++-
> > >  1 file changed, 11 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> > > index 40079fc24a63..6a03d2449701 100644
> > > --- a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> > > +++ b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> > > @@ -21,6 +21,16 @@ properties:
> > >        - {}
> > >        - const: panel-dpi
> > >
> > > +  data-mapping:
> > > +    enum:
> > > +      - rgb24
> > > +      - rgb565
> > > +      - bgr666
> > > +      - lvds666
> > 
> > Doesn't lvds666 come from i.MX IPU which as I remember has built-in
> > LVDS block? I'd think this format would be implicit when using the
> > LVDS block and panel. It doesn't seem this is actually used anywhere
> > either.
> I must admit that I just copied this list from Oleksandrs original
> patch. The MEDIA type it identifies(MEDIA_BUS_FMT_RGB666_1X24_CPADHI) looks special.
> I will drop lvds666 while applying, unless I get other feedback.
> (Note: travelling, earliest in the weekend)

Okay, with that:

Reviewed-by: Rob Herring <robh@kernel.org>

> 
> Btw. anyway I can add data-mapping to panel-common - and then list the
> allowed enum values in each binding?

That would be good. It should be defined explicitly that it's a single 
string as that's implicit currently.
 
Rob
