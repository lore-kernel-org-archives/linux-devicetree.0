Return-Path: <SRS0=/Yzg=6L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D574BC54FD0
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Apr 2020 08:04:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B844F2063A
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Apr 2020 08:04:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726589AbgD0IEi (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 27 Apr 2020 04:04:38 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:34172 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726003AbgD0IEi (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 27 Apr 2020 04:04:38 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: rcn)
        with ESMTPSA id A8AAE2A00ED
Date:   Mon, 27 Apr 2020 10:04:33 +0200
From:   Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To:     Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc:     devicetree@vger.kernel.org, kernel@collabora.com,
        dri-devel@lists.freedesktop.org, robh+dt@kernel.org
Subject: Re: [PATCH] dt-bindings: display: anx7814.txt: convert to yaml
Message-ID: <20200427080433.6okx5jbq4pfasd63@rcn-XPS-13-9360>
References: <20200424065354.23781-1-ricardo.canuelo@collabora.com>
 <481401ed-93a4-6918-3d8b-6c769d8c7617@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <481401ed-93a4-6918-3d8b-6c769d8c7617@collabora.com>
User-Agent: NeoMutt/20171215
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On vie 24-04-2020 16:08:10, Enric Balletbo i Serra wrote:
> Hi Ricardo,
> 
> Thank you for your patch.

Hi Enric,

Thanks for reviewing it.

> > +      "#size-cells":
> > +        const: 0
> > +
> 
> I don't' think you need to specify this. You can drop it (better double check
> with Rob, though)

I think you're right. I put it just to be clear about it and because
some other yaml bindings specify them, but this is already well defined
in Documentation/devicetree/bindings/mediavideo-interfaces.txt, which is
referenced in the binding.

I agree with the rest of the comments.

Kind regards,
Ricardo
