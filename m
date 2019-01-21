Return-Path: <SRS0=chu1=P5=vger.kernel.org=devicetree-owner@kernel.org>
Received: from metis.ext.pengutronix.de ([85.220.165.71]:43877 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729580AbfAUQaK (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 21 Jan 2019 11:30:10 -0500
Message-ID: <1548088207.3287.11.camel@pengutronix.de>
Subject: Re: [PATCH v2 1/3] media: dt-bindings: media: document allegro-dvt
 bindings
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Mon, 21 Jan 2019 17:30:07 +0100
In-Reply-To: <26befa99cb1ddb0c36823cb573f2012d4bd98015.camel@ndufresne.ca>
References: <20190118133716.29288-1-m.tretter@pengutronix.de>
         <20190118133716.29288-2-m.tretter@pengutronix.de>
         <1548068375.3287.1.camel@pengutronix.de>
         <26befa99cb1ddb0c36823cb573f2012d4bd98015.camel@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Nicolas Dufresne <nicolas@ndufresne.ca>, Michael Tretter <m.tretter@pengutronix.de>, linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc: mchehab@kernel.org, robh+dt@kernel.org, kernel@pengutronix.de, tfiga@chromium.org
List-ID: <devicetree@vger.kernel.org>

On Mon, 2019-01-21 at 11:17 -0500, Nicolas Dufresne wrote:
[...]
> > > +Example:
> > > +	al5e: al5e@a0009000 {
> > 
> > Should the node names be "vpu" or "video-codec"?
> 
> Xilinx calls this IP the "vcu", so "vpu" would be even more confusing.
> Was this just a typo ?

I was just going by what is already commonly used in other device trees.
Given that "vpu" doesn't seem to be as universally accepted as for
example "gpu", maybe "video-codec" is the better choice?

In any case, it should not matter what the the IP vendor or the SoC
vendor call this, the node name should be common and descriptive of its
function, same as ethernet controller nodes should be called "ethernet".

> That being said, is this referring to the actual
> HW or the firmware that runs on a microblaze (the firmware being
> Allegro specific) ?

As I understand it this binding is referring to the whole [microblaze +
attached encoder/decoder hardware] setup that is supposed to work with
the Allegro specific firmware.

regards
Philipp
