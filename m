Return-Path: <SRS0=VloT=6N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B75CAC83003
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Apr 2020 08:54:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9CAB820775
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Apr 2020 08:54:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726355AbgD2Iyv (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 29 Apr 2020 04:54:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726345AbgD2Iyu (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Wed, 29 Apr 2020 04:54:50 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEF17C03C1AD
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2020 01:54:50 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: rcn)
        with ESMTPSA id 7E19926B66A
Date:   Wed, 29 Apr 2020 10:54:45 +0200
From:   Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        jason@lakedaemon.net, dri-devel@lists.freedesktop.org,
        tomi.valkeinen@ti.com, kernel@collabora.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH] dt-bindings: display: ti,tfp410.txt: convert to yaml
Message-ID: <20200429085445.5g42pouc3jfgwjuv@rcn-XPS-13-9360>
Mail-Followup-To: Sam Ravnborg <sam@ravnborg.org>, robh+dt@kernel.org,
        devicetree@vger.kernel.org, jason@lakedaemon.net,
        dri-devel@lists.freedesktop.org, tomi.valkeinen@ti.com,
        kernel@collabora.com, linux-arm-kernel@lists.infradead.org
References: <20200428092048.14939-1-ricardo.canuelo@collabora.com>
 <20200428192117.GA13894@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200428192117.GA13894@ravnborg.org>
User-Agent: NeoMutt/20171215
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On mar 28-04-2020 21:21:17, Sam Ravnborg wrote:
> Hi Ricardo.
> 
> Thanks for looking into this bridge binding.
> Some comments in the following.

Thanks for reviewing it, Sam. I agree with your suggestions, some
comments below:

> Can you define it as an enum like this:
> 
> 	enum: [-4, -3, -2, -1, 0, 1, 2, 3]
> 
> And then maybe in the descrition describe how they map to 0..7.
> The problem is that the binding is an API so we cannot just change
> the interpretation of the value 0 etc.

This is similar to what I wanted to do at first, specifying minimum and
maximum values, but it'd have the same problem with the yaml
checker. See, problem is in the yaml checking itself, the actual
parameter parsing in the driver already works with negative integers.

The issue with this particular property is that:

  - it's vendor specific, so it must have a type definition.

  - the actual value is signed, so the proper type definition to use
    should be a signed integer.

  - but then, if you use a negative value for this it will be cast into
    a very large u32 (that's what cells are, after all) beyond the
    maximum value of a positive int32.

  - Range constraints can't be properly checked either, since any
    negative integer interpreted as unsigned will result in a positive
    number beyond the top end of the value range (3 in this case).

So unless there's a way of making the yaml check process aware of
negative integers, I think the only way to pass the checks is to use
unsigned integers and avoid defining the range constraints.

FWIW, the only other similar case I found (adi,ltc2983.yaml) uses uint64
and no range constraints.

Cheers,
Ricardo
