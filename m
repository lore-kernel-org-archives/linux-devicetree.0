Return-Path: <SRS0=ypAS=UL=vger.kernel.org=devicetree-owner@kernel.org>
Received: from metis.ext.pengutronix.de ([85.220.165.71]:42323 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437339AbfFLJqj (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 12 Jun 2019 05:46:39 -0400
Message-ID: <1560332796.5160.3.camel@pengutronix.de>
Subject: Re: [PATCH v4 00/10] Rename Rockchip VPU driver to Hantro, add
 initial i.MX8M support
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Wed, 12 Jun 2019 11:46:36 +0200
In-Reply-To: <d6a0007c-72b9-f45d-2f4c-736dd1214dbd@xs4all.nl>
References: <20190611125058.13470-1-p.zabel@pengutronix.de>
         <aa108619-2c1b-56af-0db7-cf27b3e66c29@xs4all.nl>
         <d6a0007c-72b9-f45d-2f4c-736dd1214dbd@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc: devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>, Nicolas Dufresne <nicolas@ndufresne.ca>, Boris Brezillon <boris.brezillon@collabora.com>, kernel@pengutronix.de, Mauro Carvalho Chehab <mchehab@kernel.org>, Ezequiel Garcia <ezequiel@collabora.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, 2019-06-12 at 10:00 +0200, Hans Verkuil wrote:
> On 6/12/19 9:55 AM, Hans Verkuil wrote:
> > On 6/11/19 2:50 PM, Philipp Zabel wrote:
> > > There are several other SoCs that contain Hantro IP based VPUs, such as
> > > NXP i.MX8MQ (Hantro G1 and G2) and i.MX8MM (Hantro G1, G2, and H1). To
> > > maximize code sharing, add initial support for these SoCs to the
> > > Rockchip VPU driver, after renaming it to Hantro VPU.
> > > 
> > > This series is based on the br-v5.3g tag, commit e568d2cc1ef6
> > > ("rockchip/vpu: Add support for MPEG-2 decoding on RK3288") with
> > > https://patchwork.linuxtv.org/patch/56402/ ("rockchip/vpu: Add support
> > > for MPEG-2 decoding on RK3328") applied on top. It supports MPEG-2
> > > decoding on i.MX8MQ. MPEG-2 decoding and JPEG encoding on i.MX8MM may
> > > or may not work, I don't have the hardware to test.
> > > 
> > > Changes since v3:
> > >  - Split rk3288_vpu_regs.h into hantro_g1_regs.h and hantro_h1_regs.h,
> > >    rename VDPU register defines to G1 and VEPU register defines to H1.
> > >  - Make Rockchip / i.MX8M support configurable.
> > >  - Keep staging/media Kconfig in alphabetic order.
> > >  - Rename bases to reg_bases
> > >  - Move dynamic clocks before i.MX8M support.
> > 
> > Can you please rebase this on top of the media_tree master? This series
> > doesn't apply there.
> > 
> > I'd like to get this rename series in asap since keeping this out-of-tree
> > is a pain.
> > 
> > It looks in good shape in general.
> 
> In fact, I would like to hold off on applying any other rockchip patches
> until this is in (and that means any pending rockchip patches probably
> need rebasing).
> 
> So if a v5 applies cleanly and doesn't throw up new sparse/smatch issues,
> then I'll take it.

I've rebased onto media-tree master, checked sparse/smatch, and resent.
The RK3328 patch is pulled out from under it and sent separately on top
of the series.

regards
Philipp
