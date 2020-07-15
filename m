Return-Path: <SRS0=eA0J=A2=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BE91C433ED
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jul 2020 08:33:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F04BB20672
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jul 2020 08:33:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728590AbgGOIdo (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Jul 2020 04:33:44 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:39615 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726034AbgGOIdo (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 15 Jul 2020 04:33:44 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 016ABE0004;
        Wed, 15 Jul 2020 08:33:36 +0000 (UTC)
Date:   Wed, 15 Jul 2020 10:37:09 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hverkuil-cisco@xs4all.nl, dave.stevenson@raspberrypi.com,
        dongchun.zhu@mediatek.com, linux-renesas-soc@vger.kernel.org,
        laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: media: i2c: Document
 'remote-endpoint'
Message-ID: <20200715083709.h5s2gmx6qdwvxk2c@uno.localdomain>
References: <20200714142856.58365-1-jacopo+renesas@jmondi.org>
 <20200714142856.58365-3-jacopo+renesas@jmondi.org>
 <d00e9b32-5a20-77b2-e99f-ac8822041bbc@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d00e9b32-5a20-77b2-e99f-ac8822041bbc@cogentembedded.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Sergei,

On Wed, Jul 15, 2020 at 11:10:15AM +0300, Sergei Shtylyov wrote:
> Hello!
>
> On 14.07.2020 17:28, Jacopo Mondi wrote:
>
> > Document the 'remote-endpoint' property and add it to the list of required
> > endpoint properties in imx219 and ov8856 dt-schema binding files.
> >
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> >   Documentation/devicetree/bindings/media/i2c/imx219.yaml | 5 +++++
> >   Documentation/devicetree/bindings/media/i2c/ov8856.yaml | 5 +++++
> >   2 files changed, 10 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/media/i2c/imx219.yaml b/Documentation/devicetree/bindings/media/i2c/imx219.yaml
> > index dfc4d29a4f04..0251e15fe0a7 100644
> > --- a/Documentation/devicetree/bindings/media/i2c/imx219.yaml
> > +++ b/Documentation/devicetree/bindings/media/i2c/imx219.yaml
> > @@ -71,8 +71,13 @@ properties:
> >               description:
> >                 Allowed data bus frequencies.
> > +          remote-endpoint:
> > +            description: |-
> > +              phandle to the video receiver input port
>
>    s/to/of/?
>
> > +
> >           required:
> >             - link-frequencies
> > +          - remote-endpoint
> >   required:
> >     - compatible
> > diff --git a/Documentation/devicetree/bindings/media/i2c/ov8856.yaml b/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
> > index 1956b2a32bf4..c1f363bb5aee 100644
> > --- a/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
> > +++ b/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
> > @@ -84,9 +84,14 @@ properties:
> >                 Allowed data bus frequencies. 360000000, 180000000 Hz or both
> >                 are supported by the driver.
> > +          remote-endpoint:
> > +            description: |-
> > +              phandle to the video receiver input port
>
>    s/to/of/?

I see both being used in the existing Documentation.
In the media/ folder it seems like "phandle to" is the only used
version, so I think I will go with that for consistency, unless this
is grammatically wrong and I didn't realize it :)

>
> [...]
>
> MBR, Sergei
