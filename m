Return-Path: <SRS0=ypAS=UL=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-oln040092070048.outbound.protection.outlook.com ([40.92.70.48]:16115
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726964AbfFLIOj (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 12 Jun 2019 04:14:39 -0400
From: Jonas Karlman <jonas@kwiboo.se>
Subject: Re: [PATCH v4 01/10] rockchip/vpu: rename from rockchip to hantro
Date: Wed, 12 Jun 2019 08:14:35 +0000
Message-ID: <VI1PR03MB4206D849E9815A7704D175DBACEC0@VI1PR03MB4206.eurprd03.prod.outlook.com>
References: <20190611125058.13470-1-p.zabel@pengutronix.de>
 <20190611125058.13470-2-p.zabel@pengutronix.de>
In-Reply-To: <20190611125058.13470-2-p.zabel@pengutronix.de>
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <F606E14485471A42A1448980D7AB16B7@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Boris Brezillon <boris.brezillon@collabora.com>, Ezequiel Garcia <ezequiel@collabora.com>, Nicolas Dufresne <nicolas@ndufresne.ca>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>
List-ID: <devicetree@vger.kernel.org>

On 2019-06-11 14:50, Philipp Zabel wrote:
> Rename the driver and all relevant identifiers from Rockchip to Hantro,
> as other Hantro IP based VPU implementations can be supported by the
> same driver.
> The RK3288 decoder is Hantro G1 based, the encoder is Hantro H1.

The RK3288 has two VPU blocks that is described as a VPU combo in the datasheet,
VPU1 (the G1) and a HEVC decoder (not sharing the Hantro G2 hw regs).
Similarly the RK3399 has two VPU blocks, VPU2 based on G1 but with regs/fields re-ranged
and the RKVDPU (new generation of the HEVC block found in RK3288).

How can we expose these secondary blocks once rockchip vpu driver has transitioned
into a hantro driver? Should a new rockchip vpu driver be created for the HEVC/RKVDEC blocks?

Regards,
Jonas

>
> This patch just renames, no functional changes.
>
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
> Changes since v3 [1]:
>  - Split rk3288_vpu_regs.h into hantro_g1_regs.h and hantro_h1_regs.h,
>    rename VDPU register defines to G1 and VEPU register defines to H1.
>  - Make Rockchip support configurable.
>  - Keep staging/media Kconfig in alphabetic order.
>
[snip]
