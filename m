Return-Path: <SRS0=21hy=4I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AED9EC11D0C
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Feb 2020 19:14:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8707F2465D
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Feb 2020 19:14:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="czF5Mdgu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728855AbgBTTOB (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 20 Feb 2020 14:14:01 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:36316 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728111AbgBTTOA (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 20 Feb 2020 14:14:00 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CB488563;
        Thu, 20 Feb 2020 20:13:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1582226039;
        bh=gZwjMsgBdJ7cjOIuVKbX6JBxZRJ2zvDLN5OL1pMq0pg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=czF5MdgufJzCiszRL1sU1Ozt2MmetdJqtVdmjRVXR0QP+c3m3hi1POi7GG0BlvFEA
         9JtwgcdNWL69VLGeJ0/evIOOnR7Ia8YaYQed97bbT5WrnBJct73C/UF3tRj4Kr03js
         xNn2/BXtmr5Moc6jHPkuH/iaz62vo9Xjt5FvoKqU=
Date:   Thu, 20 Feb 2020 21:13:39 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Chen-Yu Tsai <wens@csie.org>, dri-devel@lists.freedesktop.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Sean Paul <seanpaul@chromium.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>, devicetree@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: display: sun4i-tcon: Add LVDS Dual Link
 property
Message-ID: <20200220191339.GJ4998@pendragon.ideasonboard.com>
References: <20200214123244.109300-1-maxime@cerno.tech>
 <20200214131025.GI4831@pendragon.ideasonboard.com>
 <20200214154405.f5zuicm6uhhiczfs@gilmour.lan>
 <20200214154953.GJ4831@pendragon.ideasonboard.com>
 <20200217174253.mj53us4bb7h2lyca@gilmour.lan>
 <20200217181006.GE4830@pendragon.ideasonboard.com>
 <20200220175307.qool442lm7qjqb5h@gilmour.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200220175307.qool442lm7qjqb5h@gilmour.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Maxime,

On Thu, Feb 20, 2020 at 06:53:07PM +0100, Maxime Ripard wrote:
> On Mon, Feb 17, 2020 at 08:10:06PM +0200, Laurent Pinchart wrote:
> > On Mon, Feb 17, 2020 at 06:42:53PM +0100, Maxime Ripard wrote:
> >> On Fri, Feb 14, 2020 at 05:49:53PM +0200, Laurent Pinchart wrote:
> >>> On Fri, Feb 14, 2020 at 04:44:05PM +0100, Maxime Ripard wrote:
> >>>> On Fri, Feb 14, 2020 at 03:10:25PM +0200, Laurent Pinchart wrote:
> >>>>> On Fri, Feb 14, 2020 at 01:32:43PM +0100, Maxime Ripard wrote:
> >>>>>> SoCs that have multiple TCONs can use the two set of pins on the first TCON
> >>>>>> to drive a dual-link display. Add a property to enable the dual link.
> >>>>>>
> >>>>>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> >>>>>> ---
> >>>>>>  .../bindings/display/allwinner,sun4i-a10-tcon.yaml         | 7 +++++++
> >>>>>>  1 file changed, 7 insertions(+)
> >>>>>>
> >>>>>> diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
> >>>>>> index 86ad617d2327..aa6dd8409dbc 100644
> >>>>>> --- a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
> >>>>>> +++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
> >>>>>> @@ -105,6 +105,13 @@ properties:
> >>>>>>          - const: edp
> >>>>>>          - const: lvds
> >>>>>>
> >>>>>> +  allwinner,lvds-dual-link:
> >>>>>> +    type: boolean
> >>>>>> +    description: |
> >>>>>> +      On a SoC with two TCON with LVDS support, the first TCON can
> >>>>>> +      operate over both pins sets to output in a dual-link setup. This
> >>>>>> +      will be triggered by setting this property.
> >>>>>
> >>>>> Could you maybe provide an example of how this property is supposed to
> >>>>> be used ? I'm especially wondering what ports are used in that case and
> >>>>> how they're connected.
> >>>>
> >>>> It's pretty trivial to support, it's only a property to set on the
> >>>> encoder node itself.
> >>>>
> >>>> I'm not really sure what you meant by your question with the ports
> >>>> though :/
> >>>
> >>> I assume that, in the single-link case, you have two TCON instances that
> >>> operate independently, each of them with one port that models an LVDS
> >>> connection to a panel.
> >>
> >> Indeed,
> >>
> >>> In the dual-link mode, how does that look like ? Does the TCON
> >>> instance that operate in dual-link mode have two ports in DT ? There
> >>> are two physical ports, so I think it makes sense to always have two
> >>> ports in DT. That's what we're doing for the LVDS encoders on R-Car
> >>> Gen3, in order to specify in DT which LVDS input of the dual-link
> >>> panel is connected to which LVDS output of the SoC. That allows
> >>> configuring the LVDS encoder to send the even and odd pixels on the
> >>> right port.
> >>
> >> As far as I can tell, you can't control that in our TCON. It just on
> >> more lanes, that's it. Also, we currently have multiple ports, to map
> >> another feature of the TCON, which is that it can drive directly a
> >> panel, or will send its output to the HDMI / TV encoders. Adding
> >> another port in that will break the current binding we have.
> >
> > This will create one issue though, in that the dual-link sinks are
> > supposed to have two input ports, in order to expose the odd and even
> > pixels ordering. If you have a single ouput port in your TCON, how will
> > you interface with such sinks ?
> 
> I guess we could create multiple endpoints in the same port? That's
> not going to be trivial either though given the current binding we
> have :/

That's however not really how endpoints are supposed to be used.

Let's try to find a solution. Could you show me a DT example that
explains why having two ports would create backward-compatibility issues
?

-- 
Regards,

Laurent Pinchart
