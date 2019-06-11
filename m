Return-Path: <SRS0=XYop=UK=vger.kernel.org=devicetree-owner@kernel.org>
Received: from metis.ext.pengutronix.de ([85.220.165.71]:56965 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404156AbfFKLw1 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 11 Jun 2019 07:52:27 -0400
Message-ID: <1560253940.13886.7.camel@pengutronix.de>
Subject: Re: [PATCH v3 09/10] media: hantro: add initial i.MX8MM support
 (untested)
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Tue, 11 Jun 2019 13:52:20 +0200
In-Reply-To: <a49db696-a31e-7f80-f2c3-bcb162c03dee@xs4all.nl>
References: <20190531085523.10892-1-p.zabel@pengutronix.de>
         <20190531085523.10892-10-p.zabel@pengutronix.de>
         <a49db696-a31e-7f80-f2c3-bcb162c03dee@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Boris Brezillon <boris.brezillon@collabora.com>, Ezequiel Garcia <ezequiel@collabora.com>, Nicolas Dufresne <nicolas@ndufresne.ca>, Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org, kernel@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

On Mon, 2019-06-03 at 14:54 +0200, Hans Verkuil wrote:
> On 5/31/19 10:55 AM, Philipp Zabel wrote:
> > This should enable MPEG-2 decoding on the Hantro G1 and JPEG encoding on
> > the Hantro H1 on i.MX8MM.
> 
> That's the i.MX8M Mini, right? I think that's the official name for this
> SoC.

Correct.

> In any case, I don't like merging this until someone was able to test it.

Agreed. That's why I kept this separate from the i.MX8MQ support patch.

regards
Philipp
