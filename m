Return-Path: <SRS0=c2W6=4V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FSL_HELO_FAKE,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCF3BC3F2CE
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Mar 2020 17:53:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AE1E124654
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Mar 2020 17:53:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="R2Wn7R6w"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727084AbgCDRxo (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 4 Mar 2020 12:53:44 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:41515 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729749AbgCDRxo (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 4 Mar 2020 12:53:44 -0500
Received: by mail-pl1-f196.google.com with SMTP id t14so1328404plr.8
        for <devicetree@vger.kernel.org>; Wed, 04 Mar 2020 09:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=J9VCtnnz3Nd7elOdqb9vblPcNeduHwOUxl7qeFTsSH0=;
        b=R2Wn7R6wnkJLtjbAhVCnpK4/qjSirzEVjomk2VO+kbZQrTr5F92eQWXa9fkC5cYi6Z
         T893huW5IjKoblnhiA50YB2dWaRvmqOaxW9T4/TlLXmjer4IfY8zwGKSOhIKrjVUC28R
         zZZu9t5AN/l05dILV9tJywL+X0Rs9AU6rGb60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=J9VCtnnz3Nd7elOdqb9vblPcNeduHwOUxl7qeFTsSH0=;
        b=PhuBoXOIdX9U+L/i58H7xnAyKR7Ue/dZf2oIVYfyTeSWd/AweYQc96uL8gTCNsAVQc
         45foaro2yRYvS/FfqaEMhpfHjZH7l8a9ArzVizetHoNcCBZJoVGaIWJ+tebiYPfKwILA
         7a1XR1gjK1azysdnDlC35agr0JLiNbDPNcIjpd8iaFv+CHR2Qitvp/vKoajk49H79HyP
         mthsIhzLnu0isAoB/dzdtc1V6+T0haMD3TmLOeYqDkx14zi/HZ+hU+TgLDd2+Zw/dMo+
         j1Ow/1iRauXppKypmuy9ApPCishIQBF9ZILp1EK5PPpjQK8MgbnokQXbU2/PRacE3fec
         5HvQ==
X-Gm-Message-State: ANhLgQ3VZjC1R5ygKj18vvu+8tYJuQRB5mkP6wWb2UpIzbgh27j7C3sT
        YM+xJJ3joT+XIfCk9iQV2aTT0Q==
X-Google-Smtp-Source: ADFU+vvq/oz4PxdN/eoQl5JOtR3XyQpVIKwZUj3+l+sWzZihPaB0ZxYsAuC8Zp7jxEAQWjie7hViTA==
X-Received: by 2002:a17:902:8a81:: with SMTP id p1mr3998136plo.284.1583344421959;
        Wed, 04 Mar 2020 09:53:41 -0800 (PST)
Received: from google.com ([2620:15c:202:201:476b:691:abc3:38db])
        by smtp.gmail.com with ESMTPSA id i15sm9972411pfk.115.2020.03.04.09.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2020 09:53:41 -0800 (PST)
Date:   Wed, 4 Mar 2020 09:53:40 -0800
From:   Prashant Malani <pmalani@chromium.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-kernel@vger.kernel.org, enric.balletbo@collabora.com,
        bleung@chromium.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Guenter Roeck <groeck@chromium.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: Add cros-ec Type C port driver
Message-ID: <20200304175340.GA133748@google.com>
References: <20200220003102.204480-1-pmalani@chromium.org>
 <20200220003102.204480-2-pmalani@chromium.org>
 <20200227151216.GA18240@kuha.fi.intel.com>
 <20200227231547.GA30103@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200227231547.GA30103@bogus>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Rob,

Thanks for reviewing the patch. Please see inline.

On Thu, Feb 27, 2020 at 05:15:47PM -0600, Rob Herring wrote:
> On Thu, Feb 27, 2020 at 05:12:16PM +0200, Heikki Krogerus wrote:
> > Hi,
> > 
> > On Wed, Feb 19, 2020 at 04:30:55PM -0800, Prashant Malani wrote:
> > > Some Chrome OS devices with Embedded Controllers (EC) can read and
> > > modify Type C port state.
> > > 
> > > Add an entry in the DT Bindings documentation that lists out the logical
> > > device and describes the relevant port information, to be used by the
> > > corresponding driver.
> > > 
> > > Signed-off-by: Prashant Malani <pmalani@chromium.org>
> > > ---
> > > 
> > > Changes in v3:
> > > - Fixed license identifier.
> > > - Renamed "port" to "connector".
> > > - Made "connector" be a "usb-c-connector" compatible property.
> > > - Updated port-number description to explain min and max values,
> > >   and removed $ref which was causing dt_binding_check errors.
> > > - Fixed power-role, data-role and try-power-role details to make
> > >   dt_binding_check pass.
> > > - Fixed example to include parent EC SPI DT Node.
> > > 
> > > Changes in v2:
> > > - No changes. Patch first introduced in v2 of series.
> > > 
> > >  .../bindings/chrome/google,cros-ec-typec.yaml | 86 +++++++++++++++++++
> > >  1 file changed, 86 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml b/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
> > > new file mode 100644
> > > index 00000000000000..97fd982612f120
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
> > > @@ -0,0 +1,86 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Google Chrome OS EC(Embedded Controller) Type C port driver.
> > > +
> > > +maintainers:
> > > +  - Benson Leung <bleung@chromium.org>
> > > +  - Prashant Malani <pmalani@chromium.org>
> > > +
> > > +description:
> > > +  Chrome OS devices have an Embedded Controller(EC) which has access to
> > > +  Type C port state. This node is intended to allow the host to read and
> > > +  control the Type C ports. The node for this device should be under a
> > > +  cros-ec node like google,cros-ec-spi.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: google,cros-ec-typec
> > > +
> > > +  connector:
> > > +    description: A node that represents a physical Type C connector port
> > > +      on the device.
> > > +    type: object
> > > +    properties:
> > > +      compatible:
> > > +        const: usb-c-connector
> > > +      port-number:
> > > +        description: The number used by the Chrome OS EC to identify
> > > +          this type C port. Valid values are 0 - (EC_USB_PD_MAX_PORTS - 1).
> > > +      power-role:
> > > +        description: Determines the power role that the Type C port will
> > > +          adopt.
> > > +        maxItems: 1
> > > +        contains:
> > > +          enum:
> > > +            - sink
> > > +            - source
> > > +            - dual
> > > +      data-role:
> > > +        description: Determines the data role that the Type C port will
> > > +          adopt.
> > > +        maxItems: 1
> > > +        contains:
> > > +          enum:
> > > +            - host
> > > +            - device
> > > +            - dual
> > > +      try-power-role:
> > > +        description: Determines the preferred power role of the Type C port.
> > > +        maxItems: 1
> > > +        contains:
> > > +          enum:
> > > +            - sink
> > > +            - source
> > > +            - dual
> > > +
> > > +    required:
> > > +      - port-number
> > > +      - power-role
> > > +      - data-role
> > > +      - try-power-role
> > 
> > Do you really need to redefine those?
> 
> No.
> 
> > 
> > I think you just need to mention that there is a required sub-node
> > "connector", and the place where it's described. So something
> > like this:
> > 
> >         Required sub-node:
> >         - connector : The "usb-c-connector". The bindings of the
> >           connector node are specified in:
> > 
> >                 Documentation/devicetree/bindings/connector/usb-connector.txt
> 
> Ideally, we'd convert this to schema first and then here just have:

I've converted this to schema here: https://lkml.org/lkml/2020/3/4/790
I've sent that patch separately from this series, since there is ongoing
discussion regarding the structure of the bindings (and use of OF graph
API) here.


> 
> connector:
>   $ref: /schemas/connector/usb-connector.yaml#
> 
> > 
> > 
> > Then you just need to define the Chrome OS EC specific properties, so
> > I guess just the "port-number".
> 
> 'reg' as Stephen suggested.
> 
> Rob
