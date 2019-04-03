Return-Path: <SRS0=U7QJ=SF=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-ot1-f66.google.com ([209.85.210.66]:38641 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726064AbfDCRAF (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 3 Apr 2019 13:00:05 -0400
Received: by mail-ot1-f66.google.com with SMTP id e80so16066320ote.5
        for <devicetree@vger.kernel.org>; Wed, 03 Apr 2019 10:00:04 -0700 (PDT)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com. [209.85.167.173])
        by smtp.gmail.com with ESMTPSA id 66sm7117091otn.39.2019.04.03.10.00.03
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Apr 2019 10:00:03 -0700 (PDT)
Received: by mail-oi1-f173.google.com with SMTP id v84so14179727oif.4
        for <devicetree@vger.kernel.org>; Wed, 03 Apr 2019 10:00:03 -0700 (PDT)
MIME-Version: 1.0
References: <1553628194-25119-1-git-send-email-ioana.ciornei@nxp.com>
 <1553628194-25119-3-git-send-email-ioana.ciornei@nxp.com> <20190403093132.GD7932@X250>
In-Reply-To: <20190403093132.GD7932@X250>
From: Li Yang <leoyang.li@nxp.com>
Date: Wed, 3 Apr 2019 11:59:52 -0500
Message-ID: <CADRPPNQVV_mZyK0CeFm6ROc+pi9-1GwqTpnB4cc47BrXcWrDyA@mail.gmail.com>
Subject: Re: [PATCH 2/2] Documentation: DT: Add entry for DPAA2 console
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Ioana Ciornei <ioana.ciornei@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Wed, Apr 3, 2019 at 4:32 AM Shawn Guo <shawnguo@kernel.org> wrote:
>
> On Tue, Mar 26, 2019 at 07:23:31PM +0000, Ioana Ciornei wrote:
> > This patch adds a devicetree binding documentation for
> > FSL's DPAA2 console.
> >
> > Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> > ---
> >  Documentation/devicetree/bindings/misc/fsl,dpaa2-console.txt | 11 +++++++++++
> >  MAINTAINERS                                                  |  1 +
> >  2 files changed, 12 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/misc/fsl,dpaa2-console.txt
> >
> > diff --git a/Documentation/devicetree/bindings/misc/fsl,dpaa2-console.txt b/Documentation/devicetree/bindings/misc/fsl,dpaa2-console.txt
> > new file mode 100644
> > index 000000000000..1442ba5d2d98
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/misc/fsl,dpaa2-console.txt
> > @@ -0,0 +1,11 @@
> > +DPAA2 console support
> > +
> > +Required properties:
> > +
> > +    - compatible
> > +        Value type: <string>
> > +        Definition: Must be "fsl,dpaa2-console".
> > +    - reg
> > +        Value type: <prop-encoded-array>
> > +        Definition: A standard property.  Specifies the region where the MCFBA
> > +                    (MC firmware base address) register can be found.
>
> Which kernel driver is using the bindings?

The driver is submitted here at https://lkml.org/lkml/2019/3/26/1074,
probably I can take this patch together with the driver after I
finished reviewing it.

Regards,
Leo
