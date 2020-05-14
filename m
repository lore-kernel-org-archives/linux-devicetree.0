Return-Path: <SRS0=mbMJ=64=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B729C433E0
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 May 2020 18:16:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AFA9A20671
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 May 2020 18:16:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gcst2fNr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726119AbgENSQ6 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 14 May 2020 14:16:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726084AbgENSQ5 (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 14 May 2020 14:16:57 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE5A1C061A0E
        for <devicetree@vger.kernel.org>; Thu, 14 May 2020 11:16:57 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id a5so12887548pjh.2
        for <devicetree@vger.kernel.org>; Thu, 14 May 2020 11:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=X9IcEb8oUU7LKIFcAvF4/aFDMKlfzh+fzPyLLSBBesU=;
        b=gcst2fNrEeohJkVjZzxQXk1+oXKixHY4QoQNxlC8qMH9yj9jDhstplCLZ5AofKI7pa
         j7wBFXw8LG+c4UOhX8e0UO8JU9Fo88bHf6ZX8UfnhcG6LCOW8kAaJD80RueM59h8aVEq
         VzrLbQgzgKnHK3X+L4WHlcBYRH8LexSE558tQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=X9IcEb8oUU7LKIFcAvF4/aFDMKlfzh+fzPyLLSBBesU=;
        b=kd+t0z0yFNNXE/Rp61vneuHPapBTMgpo/pODg9aE8LvJK3FbI+TEnvXUfyORWxoGFn
         Rz6/wl/tWzC3uIWHycJiuqbeHnMYOn/q9F+VKrJpuSxlxTS9jm0WXUQx4vvG6xr4I6iC
         UIBTDb21OLugHXTyXHjx8AHBUC3wRwpMdYGl0+f6jQ7roYMYyrrM8uv4pgo+jlTf0wbj
         Kb1ecLhqZ7TguDbBUEh+YNQ7qAtCphzvd1bqlqgNvt/cs5LuC+l6vyCb3qRiBoQDeTDI
         gbAkZBCMDN/kPMDbfOosfXvlyNdDhr7QOyb1K4syy36ua1uxrmI4qe/MH15M3WvttfZM
         lbSw==
X-Gm-Message-State: AOAM532S51kRPgRxvzHFsMNTlsXy2zD+Gvf1kxHNNfHTNpe5Q1Y23qmB
        syoMbuttnvgaD28nFXfNMlRIYA==
X-Google-Smtp-Source: ABdhPJy67f13VerhcbIi7FzEODnOPa4eQfVaZ63oIrl8XMhBPo7jSnjmh95McZEPzlABL8tlU5309Q==
X-Received: by 2002:a17:90a:154b:: with SMTP id y11mr5408203pja.158.1589480216860;
        Thu, 14 May 2020 11:16:56 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:476b:691:abc3:38db])
        by smtp.gmail.com with ESMTPSA id 184sm2843588pfy.144.2020.05.14.11.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 11:16:56 -0700 (PDT)
Date:   Thu, 14 May 2020 11:16:55 -0700
From:   Prashant Malani <pmalani@chromium.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org,
        twawrzynczak@chromium.org, Benson Leung <bleung@chromium.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>
Subject: Re: [PATCH 1/2] dt-bindings: chrome: Add cros-ec-typec mux props
Message-ID: <20200514181655.GB121808@google.com>
References: <20200422222242.241699-1-pmalani@chromium.org>
 <20200511192800.GA28762@bogus>
 <20200511204635.GC136540@google.com>
 <20200512134154.GC2085641@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200512134154.GC2085641@kuha.fi.intel.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi folks,

On Tue, May 12, 2020 at 04:41:54PM +0300, Heikki Krogerus wrote:
> Hi guys,
> 
> On Mon, May 11, 2020 at 01:46:35PM -0700, Prashant Malani wrote:
> > Hi Rob,
> > 
> > Thank you for reviewing the patch. Kindly see my comments inline:
> > 
> > On Mon, May 11, 2020 at 02:28:00PM -0500, Rob Herring wrote:
> > > On Wed, Apr 22, 2020 at 03:22:39PM -0700, Prashant Malani wrote:
> > > > Add properties for mode, orientation and USB data role switches for
> > > > Type C connectors. When available, these will allow the Type C connector
> > > > class port driver to configure the various switches according to USB PD
> > > > information (like orientation, alt mode etc.) provided by the Chrome OS
> > > > EC controller.
> > > > 
> > > > Signed-off-by: Prashant Malani <pmalani@chromium.org>
> > > > ---
> > > >  .../bindings/chrome/google,cros-ec-typec.yaml | 27 ++++++++++++++++++-
> > > >  1 file changed, 26 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml b/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
> > > > index 6d7396ab8bee..b5814640aa32 100644
> > > > --- a/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
> > > > +++ b/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
> > > > @@ -21,7 +21,21 @@ properties:
> > > >      const: google,cros-ec-typec
> > > >  
> > > >    connector:
> > > > -    $ref: /schemas/connector/usb-connector.yaml#
> > > > +    allOf:
> > > > +      - $ref: /schemas/connector/usb-connector.yaml#
> > > > +      - type: object
> > > > +        properties:
> > > 
> > > These don't seem CrOS EC specific, so why document them as such. 
> > 
> > Are you referring to the "mode-switch", "orientation-switch" and
> > "usb-role-switch" properties? If so, then yes, they aren't Cros EC
> > specific. The Type C connector class framework requires the nodes to be
> > named like this, and the cros-ec-typec driver uses this framework, hence
> > the description here (the Type C connector class framework doesn't have
> > any bindings).
> > 
> > Would it be better to add in the description string that Type Connector
> > class expects these switches to be named this way? :
> > 
> > " Reference to a DT node for the USB Type C Multiplexer controlling the
> > data lines routing for this connector. This switch is assumed registered
> > with the Type C connector class framework, which requires it to be named
> > this way."
> > > 
> > > > +          mode-switch:
> > > > +            description: Reference to a DT node for the USB Type C Multiplexer
> > > > +              controlling the data lines routing for this connector.
> > > 
> > > This is for alternate mode muxing I presume.
> > 
> > Yes, that's right.
> > > 
> > > We already have a mux-control binding. Why not use that here?
> > 
> > Heikki might be able to offer more insight into why this is the case,
> > since the connector class framework seems to expect a phandle and for
> > the device driver to implement a "set" command. Heikki, would you happen to know?
> 
> The mode-switch here would actually represent the "consumer" part in
> the mux-control bindings. So the mux-controls would describe the
> relationship between the "mode-switch" and the mux controller(s),
> while the mode-switch property describes the relationship between
> something like USB Type-C Port Manager (or this cros_ec function) and
> the "mux consumer".
> 

Thanks for the explanation, Heikki.

Hi Rob,

Does the above explanation help clarify the usage here?

If so, shall I upload a new patch version with the additional text
(referencing Type C connector class framework) added to the *-switch
descriptions?

Best regards,

-Prashant
> > > > +
> > > > +          orientation-switch:
> > > > +            description: Reference to a DT node for the USB Type C orientation
> > > > +              switch for this connector.
> > > 
> > > What's in this node?
> > 
> > Similar to the other "-switch", this will contain a phandle to a device
> > which can control orientation settings for the Type C Mux. The connector
> > class API assumes the switches are named this way. For example:
> > 
> > orientation-switch:
> > https://elixir.bootlin.com/linux/v5.7-rc2/source/drivers/usb/typec/mux.c#L64
> > 
> > mode-switch:
> > https://elixir.bootlin.com/linux/v5.7-rc2/source/drivers/usb/typec/mux.c#L258
> > 
> > > 
> > > > +
> > > > +          usb-role-switch:
> > > > +            description: Reference to a DT node for the USB Data role switch
> > > > +              for this connector.
> > > >  
> > > >  required:
> > > >    - compatible
> > > > @@ -49,6 +63,17 @@ examples:
> > > >              data-role = "dual";
> > > >              try-power-role = "source";
> > > >            };
> > > > +
> > > > +          connector@1 {
> > > > +            compatible = "usb-c-connector";
> > > > +            reg = <1>;
> > > > +            power-role = "dual";
> > > > +            data-role = "host";
> > > > +            try-power-role = "source";
> > > > +            mode-switch = <&typec_mux>;
> > > > +            orientation-switch = <&typec_orientation_switch>;
> > > > +            usb-role-switch = <&typec_mux>;
> > > > +          };
> > > >          };
> > > >        };
> > > >      };
> > > > -- 
> > > > 2.26.1.301.g55bc3eb7cb9-goog
> > > > 
> 
> thanks,
> 
> -- 
> heikki
