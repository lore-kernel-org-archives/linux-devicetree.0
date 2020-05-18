Return-Path: <SRS0=92uP=7A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF388C433DF
	for <linux-devicetree@archiver.kernel.org>; Mon, 18 May 2020 21:28:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9232F2081A
	for <linux-devicetree@archiver.kernel.org>; Mon, 18 May 2020 21:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1589837280;
	bh=q5dlVXtQD3lurrxdAyfl30JujBbLvlebr+YdpIWmh5A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=GEs8/cEKQis7vRCOrXxuHoTlv3PmthKk/k59vaaaJOi83NqOIiGL4WChFTDUmTgpE
	 5QdRm9BwqpWCH8nabdAyEQm9MTiqLDacTpcZz1fjycIo7MBzb8UEFpaFiG0Q4CKvg/
	 dPsCN3VcyuFkbutKknNmrpaO1ln0lUPKE3nM2Zu8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727037AbgERV2A (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 18 May 2020 17:28:00 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:42286 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726250AbgERV17 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 18 May 2020 17:27:59 -0400
Received: by mail-io1-f66.google.com with SMTP id e18so12310744iog.9
        for <devicetree@vger.kernel.org>; Mon, 18 May 2020 14:27:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=7FQwau3PCqaM/9zZ31O1gXyxqGZu0XGLSVBElgDs3LI=;
        b=rSmYGz4mhQk8U0chfgWOBKMa8doH/Py3zPduTpdfDmcS/evDBCI6HjtTa3Yez8yx0l
         +flU/jYosw+VnDZxtiZVw/jH7B4Wid8kGFHSQ1VFeCvyOu05TyWQhrXdkk1GFBXUji7o
         Hqy3hglwnQZFxVaussZi9W8PWbmHFp4+rLqDwPob9+3CzecQNjLzhC/v23R1aya4WTx+
         OnD6FjB9ADH/8k7xVK240FkyKpaX5Qo4H5/T0HeQGFx6fVlTlP44prQgeJpErsl7Xh7k
         TfOqxJATnEf99MWq0An/3pQ2EY6WIhyW37bNHmuQuSd2ZfmgGjdvoH3BTQZZIjPIDQy0
         iGtQ==
X-Gm-Message-State: AOAM533E/cYBohntUNGIsoHqbFXykqpyeQmycJP+qlmVVynMok5LwcHI
        DbrZBciskn8GQQIXJl53I4plaRQ=
X-Google-Smtp-Source: ABdhPJyP1G2iCjtRxtRLACkM46A2uYvHx8oxBdf8Gy6hJ8mmM56dfpTSJL0ube0FqvJR5rLwIzDkrg==
X-Received: by 2002:a05:6602:1616:: with SMTP id x22mr15107056iow.70.1589837278706;
        Mon, 18 May 2020 14:27:58 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id c7sm5257708ilf.36.2020.05.18.14.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 14:27:58 -0700 (PDT)
Received: (nullmailer pid 9009 invoked by uid 1000);
        Mon, 18 May 2020 21:27:57 -0000
Date:   Mon, 18 May 2020 15:27:57 -0600
From:   Rob Herring <robh@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Ricardo =?iso-8859-1?Q?Ca=F1uelo?= 
        <ricardo.canuelo@collabora.com>, kernel@collabora.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        geert+renesas@glider.be, xuwei5@hisilicon.com
Subject: Re: [PATCH v2 6/6] dt-bindings: drm: bridge: adi,adv7511.txt:
 convert to yaml
Message-ID: <20200518212757.GA15067@bogus>
References: <20200511110611.3142-1-ricardo.canuelo@collabora.com>
 <20200511110611.3142-7-ricardo.canuelo@collabora.com>
 <20200514015412.GF7425@pendragon.ideasonboard.com>
 <20200514093617.dwhmqaasc3z5ixy6@rcn-XPS-13-9360>
 <20200514152239.GG5955@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200514152239.GG5955@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, May 14, 2020 at 06:22:39PM +0300, Laurent Pinchart wrote:
> Hi Ricardo,
> 
> On Thu, May 14, 2020 at 11:36:17AM +0200, Ricardo Cañuelo wrote:
> > Hi Laurent, thanks for the thorough review. Some comments below:
> > 
> > On jue 14-05-2020 04:54:12, Laurent Pinchart wrote:
> > > > +description: |
> > > > +  The ADV7511, ADV7511W and ADV7513 are HDMI audio and video
> > > > +  transmitters compatible with HDMI 1.4 and DVI 1.0. They support color
> > > > +  space conversion, S/PDIF, CEC and HDCP. They support RGB input
> > > > +  interface.
> > > 
> > > I would write the last sentence as "The transmitter input is parallel
> > > RGB or YUV data." as YUV is also supported.
> > 
> > Ok.
> > 
> > > > +  adi,input-colorspace:
> > > > +    description: Input color space.
> > > > +    allOf:
> > > > +      - $ref: /schemas/types.yaml#/definitions/string
> > > > +      - enum: [ rgb, yuv422, yuv444 ]
> > > 
> > > Isn't string implied ? Can't you write
> > > 
> > >   adi,input-colorspace:
> > >     description: Input color space.
> > >     enum: [ rgb, yuv422, yuv444 ]
> > 
> > example-schema.yaml says that
> > 
> >     Vendor specific properties have slightly different schema
> >     requirements than common properties. They must have at least a type
> >     definition and 'description'.
> > 
> > However, dt_binding_check doesn't seem to enforce this rule for string
> > properties, and I saw a couple of vendor-specific string properties in
> > other bindings that don't define the type either, so I'm going to follow
> > your suggestion but only for string properties, the rest need a type
> > definition.
> 
> I'll defer to Rob to tell the law here :-)

Yes, if you have a string with defined values, then a type isn't needed. 
That only applies to strings as numeric values need a size.

> 
> > I noticed I can remove the "allOf" keywords from these too.

Yes, that's a recent change. Both forms still work.


> > > > +  adi,embedded-sync:
> > > > +    description:
> > > > +      The input uses synchronization signals embedded in the data
> > > > +      stream (similar to BT.656). Defaults to 0 (separate H/V
> > > > +      synchronization signals).
> > > > +    allOf:
> > > > +      - $ref: /schemas/types.yaml#/definitions/uint32
> > > > +      - enum: [ 0, 1 ]
> > > > +      - default: 0
> > > 
> > > This be a boolean property (it is read as a bool by the driver, the
> > > property being absent means false, the property being present means
> > > true).
> > 
> > You're completely right.
> > 
> > > > +  ports:
> > > > +    description:
> > > > +      The ADV7511(W)/13 has two video ports and one audio port. This node
> > > > +      models their connections as documented in
> > > > +      Documentation/devicetree/bindings/media/video-interfaces.txt
> > > > +      Documentation/devicetree/bindings/graph.txt
> > > > +    type: object
> > > > +    properties:
> > > > +      port@0:
> > > > +        description: Video port for the RGB, YUV or DSI input.
> > > 
> > > s/RGB, YUV or DSI/RGB or YUV/
> > 
> > Ok.
> > 
> > > > +if:
> > > > +  not:
> > > > +    properties:
> > > > +      adi,input-colorspace:
> > > > +        contains:
> > > > +          enum: [ rgb, yuv444 ]
> > > > +      adi,input-clock:
> > > > +        contains:
> > > > +          const: 1x
> > > 
> > > As both properties take a single value, I think you can omit
> > > "contains:".
> > 
> > I think it's required here, removing it makes the test fail.
> 
> I thought the following could work:
> 
> if:
>   not:
>     properties:
>       adi,input-colorspace:
>         enum: [ rgb, yuv444 ]
>       adi,input-clock:
>         items:
>           - const: 1x
> 
> But no big deal, contains: is ok too.

In theory the above should work. However, this is probably a case where 
we don't fix-up the properties. If you look at the DT yaml encoding, 
everything is an array (as dtc doesn't know). For schemas, the tooling 
expands scalars to arrays.

Rob
