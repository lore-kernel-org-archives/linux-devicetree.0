Return-Path: <SRS0=K2f+=KA=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-ed1-f67.google.com ([209.85.208.67]:43673 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727532AbeGPQLQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 16 Jul 2018 12:11:16 -0400
Received: by mail-ed1-f67.google.com with SMTP id b20-v6so4782411edt.10
        for <devicetree@vger.kernel.org>; Mon, 16 Jul 2018 08:43:15 -0700 (PDT)
Date: Mon, 16 Jul 2018 17:43:07 +0200
From: Anthony Brandon <anthony@amarulasolutions.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: sound: wm8994: document
 wlf,spkmode-pu property
Message-ID: <20180716154307.GA8613@Fenrir>
References: <20180709160631.GU18740@imbe.wolfsonmicro.main>
 <1531158406-18646-1-git-send-email-anthony@amarulasolutions.com>
 <20180711191346.GA5912@rob-hp-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180711191346.GA5912@rob-hp-laptop>
Sender: devicetree-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: mark.rutland@arm.com, lee.jones@linaro.org, patches@opensource.cirrus.com, ckeepax@opensource.cirrus.com, alberto@amarulasolutions.com, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi,

Is there anything more I can do to get this (and patch 3/4) applied?
Or just wait a bit longer?
I'm asking because I noticed that changes 2 and 4 have been applied but
these have not.

Regards,
Anthony

On Wed, Jul 11, 2018 at 01:13:46PM -0600, Rob Herring wrote:
> On Mon, Jul 09, 2018 at 07:46:43PM +0200, Anthony Brandon wrote:
> > Add the wlf,spkmode-pu property to control the Speaker Mode pull-up from
> > the device tree.
> > 
> > Signed-off-by: Anthony Brandon <anthony@amarulasolutions.com>
> > ---
> >  Documentation/devicetree/bindings/sound/wm8994.txt | 3 +++
> >  1 file changed, 3 insertions(+)
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
