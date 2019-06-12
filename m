Return-Path: <SRS0=ypAS=UL=vger.kernel.org=devicetree-owner@kernel.org>
Received: from bhuna.collabora.co.uk ([46.235.227.227]:44406 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730856AbfFLIXV (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 12 Jun 2019 04:23:21 -0400
Date: Wed, 12 Jun 2019 10:23:16 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v4 01/10] rockchip/vpu: rename from rockchip to hantro
Message-ID: <20190612102316.271e8d27@collabora.com>
In-Reply-To: <VI1PR03MB4206D849E9815A7704D175DBACEC0@VI1PR03MB4206.eurprd03.prod.outlook.com>
References: <20190611125058.13470-1-p.zabel@pengutronix.de>
        <20190611125058.13470-2-p.zabel@pengutronix.de>
        <VI1PR03MB4206D849E9815A7704D175DBACEC0@VI1PR03MB4206.eurprd03.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Ezequiel Garcia <ezequiel@collabora.com>, Nicolas Dufresne <nicolas@ndufresne.ca>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>
List-ID: <devicetree@vger.kernel.org>

On Wed, 12 Jun 2019 08:14:35 +0000
Jonas Karlman <jonas@kwiboo.se> wrote:

> On 2019-06-11 14:50, Philipp Zabel wrote:
> > Rename the driver and all relevant identifiers from Rockchip to Hantro,
> > as other Hantro IP based VPU implementations can be supported by the
> > same driver.
> > The RK3288 decoder is Hantro G1 based, the encoder is Hantro H1.  
> 
> The RK3288 has two VPU blocks that is described as a VPU combo in the datasheet,
> VPU1 (the G1) and a HEVC decoder (not sharing the Hantro G2 hw regs).
> Similarly the RK3399 has two VPU blocks, VPU2 based on G1 but with regs/fields re-ranged
> and the RKVDPU (new generation of the HEVC block found in RK3288).
> 
> How can we expose these secondary blocks once rockchip vpu driver has transitioned
> into a hantro driver? Should a new rockchip vpu driver be created for the HEVC/RKVDEC blocks?

Yes, if those are not Hantro IPs a new driver should be created. I'm
currently working on providing generic m2m helpers for stateless codecs
to limit the code duplication incurred by this split. The good thing is
that it should also help shrink the code of the cedrus driver (and more
generally all stateless codec drivers).
