Return-Path: <SRS0=Tykm=BJ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D628C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Jul 2020 06:33:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 713242075F
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Jul 2020 06:33:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726287AbgG3Gdo (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 30 Jul 2020 02:33:44 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:52390 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726261AbgG3Gdn (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 30 Jul 2020 02:33:43 -0400
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 8631E2001E;
        Thu, 30 Jul 2020 08:33:40 +0200 (CEST)
Date:   Thu, 30 Jul 2020 08:33:39 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Marek Vasut <marex@denx.de>
Cc:     dri-devel@lists.freedesktop.org, Eric Anholt <eric@anholt.net>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH V2 1/2] dt-bindings: Add DT bindings for Toshiba TC358762
 DSI-to-DPI bridge
Message-ID: <20200730063339.GA1434697@ravnborg.org>
References: <20200729164554.114735-1-marex@denx.de>
 <20200729165904.GB1372716@ravnborg.org>
 <81d8eed6-bac7-4e84-ff42-d158941d6620@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81d8eed6-bac7-4e84-ff42-d158941d6620@denx.de>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=WzHobfHSo-pyJhVskOMA:9 a=CjuIK1q_8ugA:10
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Jul 29, 2020 at 11:36:27PM +0200, Marek Vasut wrote:
> On 7/29/20 6:59 PM, Sam Ravnborg wrote:
> 
> Hi,
> 
> [...]
> >> +      port@0:
> >> +        type: object
> >> +        additionalProperties: false
> >> +
> >> +        description: |
> >> +          Video port for MIPI DSI input
> >> +
> >> +        properties:
> >> +          reg:
> >> +            const: 0
> >> +
> >> +        patternProperties:
> > Not happy with the use of "patternProperties" when there is no pattern.
> 
> So how should this be changed ?

Delete the "patternProperties" line and adjust indent on the following
lines. Then this should continue to be valid syntax and validate the
example.

	Sam

