Return-Path: <SRS0=VR/D=2D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08994C3B18A
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Dec 2019 20:38:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 480D42479D
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Dec 2019 20:38:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727877AbfLMPZz (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 13 Dec 2019 10:25:55 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59034 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727621AbfLMPZz (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 13 Dec 2019 10:25:55 -0500
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 4024B28A0D1;
        Fri, 13 Dec 2019 15:25:53 +0000 (GMT)
Date:   Fri, 13 Dec 2019 16:25:50 +0100
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v3 5/7] media: dt-bindings: rockchip: Document RK3399
 Video Decoder bindings
Message-ID: <20191213162550.59730f89@collabora.com>
In-Reply-To: <20191213152332.GF4860@pendragon.ideasonboard.com>
References: <20191213125414.90725-1-boris.brezillon@collabora.com>
        <20191213125414.90725-6-boris.brezillon@collabora.com>
        <20191213152332.GF4860@pendragon.ideasonboard.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, 13 Dec 2019 17:23:32 +0200
Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> Hi Boris,
> 
> Thank you for the patch.
> 
> On Fri, Dec 13, 2019 at 01:54:12PM +0100, Boris Brezillon wrote:
> > Document the Rockchip RK3399 Video Decoder bindings.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> > Changes in v3:
> > * Fix dtbs_check failures
> > ---
> >  .../bindings/media/rockchip,vdec.yaml         | 71 +++++++++++++++++++
> >  1 file changed, 71 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> > new file mode 100644
> > index 000000000000..7167c3d6a389
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> > @@ -0,0 +1,71 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/rockchip,vdec.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Rockchip Video Decoder (VDec) Device Tree Bindings
> > +
> > +maintainers:
> > +  - Heiko Stuebner <heiko@sntech.de>
> > +
> > +description: |-
> > +  The Rockchip rk3399 has a stateless Video Decoder that can decodes H.264,
> > +  HEVC an VP9 streams.
> > +
> > +properties:
> > +  compatible:
> > +    const: rockchip,rk3399-vdec
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: The Video Decoder AXI interface clock
> > +      - description: The Video Decoder AHB interface clock
> > +      - description: The Video Decoded CABAC clock
> > +      - description: The Video Decoder core clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: aclk  
> 
> How about calling it "axi" ? None of the other clock names have "clk".
> 
> > +      - const: iface  
> 
> And "ahb" here, as the AXI interface clock is also an interface clock ?

Sure, I can do that.
