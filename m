Return-Path: <SRS0=8UcW=CC=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CBA7C433E3
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Aug 2020 23:57:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DF3A62063A
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Aug 2020 23:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1598313470;
	bh=Y7k1LC8m0F2WeEDSyAJUABgPlOCaq85S4nlerxLUIOc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=lNnYpLd+uji+Vobe4RSDZ3iu/dVXj88bAIavYhTYFqaOBLwindCs1ytBgHLVnVNoR
	 HfQTXrj5DYM/HP8n89vmP1dIn84P48IqyXlzLSxmn3QU9+q5WB0tNqk/afhHEExVGp
	 spFg0d5aEADcdjGbk703i947F5k4oQeSZwwEFs3I=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726531AbgHXX5u (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 24 Aug 2020 19:57:50 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:33835 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726189AbgHXX5t (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 24 Aug 2020 19:57:49 -0400
Received: by mail-io1-f66.google.com with SMTP id w20so7312123iom.1
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2020 16:57:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2clxok4AT1thROfwSbp1ZaG/t9IqMzKpuWHCwXIuuw8=;
        b=OAXI5CoA0nztx+xv4/Kiugh86OV85iBvC6lhbs3i+6Ex78lZCmGybbmei7FnL5LYy+
         gv6kw2qPinZQ6fdWlpbzRoH0e6AL3pKZyRoYnSylUirIYunvov0sFUzMc9yY9v6HJlNC
         EKHEB7kBb0cYYdSDo7rtOa43sToD4/tLMJ/1LQJKdgSiwNK2zGPch0+P/zCT6ENG5ICR
         KygVmnjqwPr8v+QQXKhsRbYxcs2EUkhTrNs1/tt8DZ0ZyZTqPtQAgejfagIXWGT/tzuE
         in4D3xZRcGqzppt1skRPwGfB3j9hfEAt28tPqBod6hbuawWgdeBm7wQiQAruQeEP31g3
         soHw==
X-Gm-Message-State: AOAM532L27HSqeLfoqYxUCXPOjGNCVVsTbZdCWhq429q2StxbK93Hogz
        4RwlWUcsRAeiQZ9x91CJuQ==
X-Google-Smtp-Source: ABdhPJw6gpTNfKL44uq2crG2J2o6tmfpSN21xd0JhIWEBKjVjxayb3fOGQQZo8l8xCU91noaKdmQng==
X-Received: by 2002:a02:8e:: with SMTP id 136mr8157636jaa.111.1598313468506;
        Mon, 24 Aug 2020 16:57:48 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id e6sm7550534iod.53.2020.08.24.16.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2020 16:57:47 -0700 (PDT)
Received: (nullmailer pid 3582064 invoked by uid 1000);
        Mon, 24 Aug 2020 23:57:45 -0000
Date:   Mon, 24 Aug 2020 17:57:45 -0600
From:   Rob Herring <robh@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
        Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
        Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/8] dt-bindings: display: mxsfb: Add and fix compatible
 strings
Message-ID: <20200824235745.GA3579749@bogus>
References: <20200813012910.13576-1-laurent.pinchart@ideasonboard.com>
 <20200813012910.13576-3-laurent.pinchart@ideasonboard.com>
 <20200816063933.GC1201814@ravnborg.org>
 <20200817000406.GC7729@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200817000406.GC7729@pendragon.ideasonboard.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Aug 17, 2020 at 03:04:06AM +0300, Laurent Pinchart wrote:
> Hi Sam,
> 
> On Sun, Aug 16, 2020 at 08:39:33AM +0200, Sam Ravnborg wrote:
> > On Thu, Aug 13, 2020 at 04:29:04AM +0300, Laurent Pinchart wrote:
> > > Additional compatible strings have been added in DT source for the
> > > i.MX6SL, i.MX6SLL, i.MX6UL and i.MX7D without updating the bindings.
> > > Most of the upstream DT sources use the fsl,imx28-lcdif compatible
> > > string, which mostly predates the realization that the LCDIF in the
> > > i.MX6 and newer SoCs have extra features compared to the i.MX28.
> > > 
> > > Update the bindings to add the missing compatible strings, with the
> > > correct fallback values. This fails to validate some of the upstream DT
> > > sources. Instead of adding the incorrect compatible fallback to the
> > > binding, the sources should be updated separately.
> > > 
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > >  .../devicetree/bindings/display/mxsfb.yaml     | 18 +++++++++++++-----
> > >  1 file changed, 13 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/display/mxsfb.yaml b/Documentation/devicetree/bindings/display/mxsfb.yaml
> > > index 202381ec5bb7..ec6533b1d4a3 100644
> > > --- a/Documentation/devicetree/bindings/display/mxsfb.yaml
> > > +++ b/Documentation/devicetree/bindings/display/mxsfb.yaml
> > > @@ -15,11 +15,19 @@ description: |
> > >  
> > >  properties:
> > >    compatible:
> > > -    enum:
> > > -      - fsl,imx23-lcdif
> > > -      - fsl,imx28-lcdif
> > > -      - fsl,imx6sx-lcdif
> > > -      - fsl,imx8mq-lcdif
> > > +    oneOf:
> > > +      - enum:
> > > +          - fsl,imx23-lcdif
> > > +          - fsl,imx28-lcdif
> > > +          - fsl,imx6sx-lcdif
> >
> > Indent correct.
> > 
> > > +      - items:
> > > +        - enum:
> > > +          - fsl,imx6sl-lcdif
> > > +          - fsl,imx6sll-lcdif
> > > +          - fsl,imx6ul-lcdif
> > > +          - fsl,imx7d-lcdif
> > > +          - fsl,imx8mq-lcdif
> >
> > Indent shall be two more spaces like above.
> > (This is at least my best uderstanding)
> 
> I think you're right. I wonder why dt_binding_check doesn't complain.
> I'll fix it anyway.

Because I haven't integrated yamllint yet. I do have a config file at 
least.

> 
> > > +        - const: fsl,imx6sx-lcdif
> > 
> > With the above the following compatibles are supported:
> > 
> > 	"fsl,imx23-lcdif"
> > 	"fsl,imx28-lcdif"
> > 	"fsl,imx6sx-lcdif"
> > 	"fsl,imx8mq-lcdif"
> > 
> > 	"fsl,imx6sl-lcdif", "fsl,imx6sx-lcdif"
> > 	"fsl,imx6sll-lcdif", "fsl,imx6sx-lcdif"
> > 	"fsl,imx6ul-lcdif", "fsl,imx6sx-lcdif"
> > 	"fsl,imx7d-lcdif", "fsl,imx6sx-lcdif"
> > 	"fsl,imx8mq-lcdif", "fsl,imx6sx-lcdif"
> > 
> > So the fallback value is the later "fsl,imx6sx-lcdif" which looks ok.
> > 
> > With indent fixed (or explained why I am wrong):
> > Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> > 
> > >  
> > >    reg:
> > >      maxItems: 1
> 
> -- 
> Regards,
> 
> Laurent Pinchart
