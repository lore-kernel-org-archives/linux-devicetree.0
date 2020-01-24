Return-Path: <SRS0=u7up=3N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3294C2D0DB
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Jan 2020 16:28:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A6E9B20704
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Jan 2020 16:28:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387668AbgAXQ2o (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 24 Jan 2020 11:28:44 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:60550 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388341AbgAXQ2o (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 24 Jan 2020 11:28:44 -0500
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 246CF294C97;
        Fri, 24 Jan 2020 16:28:42 +0000 (GMT)
Date:   Fri, 24 Jan 2020 17:28:38 +0100
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel@lists.freedesktop.org,
        Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Rob Herring <robh+dt@kernel.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        devicetree@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        intel-gfx-trybot@lists.freedesktop.org, kernel@collabora.com,
        Chris Healy <cphealy@gmail.com>
Subject: Re: [PATCH v8 10/12] drm/bridge: panel: Propage bus format/flags
Message-ID: <20200124172838.11e250bd@collabora.com>
In-Reply-To: <20200124162550.GA5835@ravnborg.org>
References: <20200123095333.2085810-1-boris.brezillon@collabora.com>
        <20200123095333.2085810-11-boris.brezillon@collabora.com>
        <20200124162550.GA5835@ravnborg.org>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, 24 Jan 2020 17:25:50 +0100
Sam Ravnborg <sam@ravnborg.org> wrote:

> On Thu, Jan 23, 2020 at 10:53:31AM +0100, Boris Brezillon wrote:
> > So that the previous bridge element in the chain knows which input
> > format the panel bridge expects.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>  
> 
> Subject: [PATCH v8 10/12] drm/bridge: panel: Propage bus format/flags
> s/Propage/Propagate/
> ?
> 

Oops. I'll fix it when applying, unless there are other things to fix in
the v8.
