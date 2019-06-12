Return-Path: <SRS0=ypAS=UL=vger.kernel.org=devicetree-owner@kernel.org>
Received: from bhuna.collabora.co.uk ([46.235.227.227]:44462 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405127AbfFLIac (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 12 Jun 2019 04:30:32 -0400
Date: Wed, 12 Jun 2019 10:30:28 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v4 00/10] Rename Rockchip VPU driver to Hantro, add
 initial i.MX8M support
Message-ID: <20190612103028.47b8e129@collabora.com>
In-Reply-To: <d6a0007c-72b9-f45d-2f4c-736dd1214dbd@xs4all.nl>
References: <20190611125058.13470-1-p.zabel@pengutronix.de>
        <aa108619-2c1b-56af-0db7-cf27b3e66c29@xs4all.nl>
        <d6a0007c-72b9-f45d-2f4c-736dd1214dbd@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Ezequiel Garcia <ezequiel@collabora.com>, Nicolas Dufresne <nicolas@ndufresne.ca>, Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org, kernel@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

On Wed, 12 Jun 2019 10:00:45 +0200
Hans Verkuil <hverkuil@xs4all.nl> wrote:

> On 6/12/19 9:55 AM, Hans Verkuil wrote:
> > On 6/11/19 2:50 PM, Philipp Zabel wrote:  
> >> There are several other SoCs that contain Hantro IP based VPUs, such as
> >> NXP i.MX8MQ (Hantro G1 and G2) and i.MX8MM (Hantro G1, G2, and H1). To
> >> maximize code sharing, add initial support for these SoCs to the
> >> Rockchip VPU driver, after renaming it to Hantro VPU.
> >>
> >> This series is based on the br-v5.3g tag, commit e568d2cc1ef6
> >> ("rockchip/vpu: Add support for MPEG-2 decoding on RK3288") with
> >> https://patchwork.linuxtv.org/patch/56402/ ("rockchip/vpu: Add support
> >> for MPEG-2 decoding on RK3328") applied on top. It supports MPEG-2
> >> decoding on i.MX8MQ. MPEG-2 decoding and JPEG encoding on i.MX8MM may
> >> or may not work, I don't have the hardware to test.
> >>
> >> Changes since v3:
> >>  - Split rk3288_vpu_regs.h into hantro_g1_regs.h and hantro_h1_regs.h,
> >>    rename VDPU register defines to G1 and VEPU register defines to H1.
> >>  - Make Rockchip / i.MX8M support configurable.
> >>  - Keep staging/media Kconfig in alphabetic order.
> >>  - Rename bases to reg_bases
> >>  - Move dynamic clocks before i.MX8M support.  
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

Ack. Actually, Ezequiel and I are waiting for this series to land
before sending new patches, so that'd be nice to have at least patches
1 to 7 applied really soon.

> 
> So if a v5 applies cleanly and doesn't throw up new sparse/smatch issues,
> then I'll take it.

Great!
