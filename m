Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC08CC2BB85
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 18:50:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C95622074D
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 18:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1586890224;
	bh=lvFXa5byTCGcjch4iZAVG5nUPoTyTKdmh35P9tr1QDM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=GHlajjIvlFsFFxLhh8svxfouD2jBi/CHRgUkHlf3vhUym1vDctpkymfqSvDaokaHo
	 vJJFRVO9/Bo9kr9FLMcsK8x/iDNVrRCcTxo1f5EJwErreh3l3WIHzKH7J/rGnLa1HD
	 O5Rb/VghsLl131D/RzRJOYxwWdfgmuizRuBqVGQE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504454AbgDNSuX (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 14:50:23 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:32861 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2504447AbgDNSuS (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 14 Apr 2020 14:50:18 -0400
Received: by mail-oi1-f196.google.com with SMTP id m14so11378751oic.0
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2020 11:50:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kJLKdHg7KIg/aTBSlFX54Ej5jM2zmSmmce3CtEkyB7I=;
        b=EFfUXf/s6EwY8dvyPWcqx3CqdpuIV+mNDudespioTLmrQuWAN8FDLjMJVAwTvEnOFL
         4p/R72AfNEypCc74v0McQytFllvCgzfiiUOf6So3dyhRq9w3phJZt6Ac4aOUyyAPN6+P
         W0zn5PqsbDFOWEtmJY4MTRbal4BOR5cb1hwK0MZvgGY7oJiyeCtH31o2N4rlnxwYlV1Q
         XathF8yeNUO6sGRVPDiH3ZZuSFIpZAtZBrSGWiW07C0Y5Uz2hureHnXn76/a6R3v+vIL
         bDynl4RyjTqHEu3uq8gq/v0Wf8KDeKpLBl8gHVIMXR583mj6HzM6XrvXXr0sFUjOERij
         j+lA==
X-Gm-Message-State: AGi0PuYWW+XNZWT8Cy/8hfWL8uzEBEIEtrOxoiWqzAL7/m0/qq7v21Eh
        RbN628TBspRDOPp/E8Ashw==
X-Google-Smtp-Source: APiQypLtzcCchzUOXF79zl2rruN1jX08r+ZXPGNG5bSH7kuzpzTlmA+Lg4AZoqfdULLBgml6tPBQTg==
X-Received: by 2002:aca:b382:: with SMTP id c124mr15504007oif.64.1586890217621;
        Tue, 14 Apr 2020 11:50:17 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id o128sm5788648oih.41.2020.04.14.11.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 11:50:16 -0700 (PDT)
Received: (nullmailer pid 3195 invoked by uid 1000);
        Tue, 14 Apr 2020 18:50:16 -0000
Date:   Tue, 14 Apr 2020 13:50:16 -0500
From:   Rob Herring <robh@kernel.org>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        devicetree@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
        Marek Belisko <marek@goldelico.com>
Subject: Re: [PATCH v2 24/36] dt-bindings: display: convert toppoly panels to
 DT Schema
Message-ID: <20200414185016.GA31449@bogus>
References: <20200408195109.32692-1-sam@ravnborg.org>
 <20200408195109.32692-25-sam@ravnborg.org>
 <981A14FA-AFB0-47B6-9EEF-E1C09828976F@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <981A14FA-AFB0-47B6-9EEF-E1C09828976F@goldelico.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Apr 09, 2020 at 08:21:16AM +0200, H. Nikolaus Schaller wrote:
> Hi Sam,
> 
> > Am 08.04.2020 um 21:50 schrieb Sam Ravnborg <sam@ravnborg.org>:
> > 
> > v2:
> >  - dropped use of spi-slave.yaml (Maxime)
> >  - added unevaluatedProperties (Maxime)
> > 
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Marek Belisko <marek@goldelico.com>
> > Cc: H. Nikolaus Schaller <hns@goldelico.com>
> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > ---
> > .../bindings/display/panel/tpo,td.yaml        | 65 +++++++++++++++++++
> > .../bindings/display/panel/tpo,td028ttec1.txt | 32 ---------
> > .../bindings/display/panel/tpo,td043mtea1.txt | 33 ----------
> > 3 files changed, 65 insertions(+), 65 deletions(-)
> > create mode 100644 Documentation/devicetree/bindings/display/panel/tpo,td.yaml
> > delete mode 100644 Documentation/devicetree/bindings/display/panel/tpo,td028ttec1.txt
> > delete mode 100644 Documentation/devicetree/bindings/display/panel/tpo,td043mtea1.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/display/panel/tpo,td.yaml b/Documentation/devicetree/bindings/display/panel/tpo,td.yaml
> > new file mode 100644
> > index 000000000000..4aa605613445
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/panel/tpo,td.yaml
> > @@ -0,0 +1,65 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/panel/tpo,td.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Toppoly TD Panels
> > +
> > +description: |
> > +  The panel must obey the rules for a SPI slave device as specified in
> > +  spi/spi-controller.yaml
> > +
> > +maintainers:
> > +  - Marek Belisko <marek@goldelico.com>
> > +  - H. Nikolaus Schaller <hns@goldelico.com>
> > +
> > +allOf:
> > +  - $ref: panel-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +        # Toppoly TD028TTEC1 Panel
> > +      - tpo,td028ttec1
> > +        # Toppoly TD043MTEA1 Panel
> > +      - tpo,td043mtea1
> > +
> > +  reg: true
> > +  label: true
> > +  reset-gpios: true
> > +  backlight: true
> > +  port: true
> > +
> > +required:
> > +  - compatible
> > +  - port
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    spi {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        panel: panel@0 {
> > +            compatible = "tpo,td043mtea1";
> > +            reg = <0>;
> > +            spi-max-frequency = <100000>;
> > +            spi-cpol;
> > +            spi-cpha;
> > +
> > +            label = "lcd";
> > +
> > +            reset-gpios = <&gpio7 7 0>;
> > +
> > +            port {
> > +                lcd_in: endpoint {
> > +                    remote-endpoint = <&dpi_out>;
> > +                };
> > +            };
> > +        };
> > +    };
> 
> I think it is possible to add two examples (the one for tpo,td028ttec1)
> as well. The reason is that it must also have spi-cs-high; which isn't
> documented anywhere else and wasn't in tpo,td028ttec1.txt.

I don't think we need another example because examples are not a 
enumeration for what's allowed. There should be an if/then schema though 
for this. That can be a follow-up IMO.

Rob
