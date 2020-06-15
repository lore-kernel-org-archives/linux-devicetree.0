Return-Path: <SRS0=vQ7I=74=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06BC2C433DF
	for <linux-devicetree@archiver.kernel.org>; Mon, 15 Jun 2020 09:38:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D859D206D7
	for <linux-devicetree@archiver.kernel.org>; Mon, 15 Jun 2020 09:38:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729040AbgFOJiR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 15 Jun 2020 05:38:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728773AbgFOJiR (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 15 Jun 2020 05:38:17 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA990C061A0E
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2020 02:38:16 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: rcn)
        with ESMTPSA id 531BF2A2050
Message-ID: <8ad9a397a5fa6cebd2a4e0170dfa96ad73907faf.camel@collabora.com>
Subject: Re: [PATCH v3 5/5] dt-bindings: display: ti,tfp410.yaml: make the
 ports node optional
From:   Ricardo =?ISO-8859-1?Q?Ca=F1uelo?= <ricardo.canuelo@collabora.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     devicetree@vger.kernel.org, jason@lakedaemon.net, airlied@linux.ie,
        dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
        tomi.valkeinen@ti.com, kernel@collabora.com,
        linux-arm-kernel@lists.infradead.org
Date:   Mon, 15 Jun 2020 11:38:07 +0200
In-Reply-To: <20200611160817.GA6031@pendragon.ideasonboard.com>
References: <20200611102356.31563-1-ricardo.canuelo@collabora.com>
         <20200611102356.31563-6-ricardo.canuelo@collabora.com>
         <20200611160817.GA6031@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Laurent,

Thanks for reviewing the patch

On Thu, 2020-06-11 at 19:08 +0300, Laurent Pinchart wrote:
> Hi Ricardo,
> 
> Thank you for the patch.
> 
> On Thu, Jun 11, 2020 at 12:23:56PM +0200, Ricardo Cañuelo wrote:
> > Make the ports node optional, since there are some DTs that don't define
> > any ports for ti,tfp410.
> > 
> > Signed-off-by: Ricardo Cañuelo <ricardo.canuelo@collabora.com>
> 
> Shouldn't we fix those DTs instead ? What's the point of a TFP410
> without ports in DT ?

This comes from the discussion in the previous version of this series.

In the DTs that don't define any ports (it's dove-sbc-a510.dts only, actually)
it's not clear how to define the ports (I'm not familiar with this board).
Initially I defined a set of empty ports just to comply with the binding
requirements, but Rob suggested that we might as well declare them as optional,
since having an empty port definition with no remote endpoints is no better than
having no ports at all.

I understand both opinions but I just don't know which is the best option at
this point.

Cheers,
Ricardo

