From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: [PATCH 0/5] DRM OF graph clean-up
Date: Sat, 4 Feb 2017 10:47:45 +0000
Message-ID: <20170204104745.GI27312@n2100.armlinux.org.uk>
References: <20170204033635.10250-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170204033635.10250-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>, Sean Paul <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Archit Taneja <architt@codeaurora.org>, Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@freescale.com>, Xinliang Liu <z.liuxinliang@hisi>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 03, 2017 at 09:36:30PM -0600, Rob Herring wrote:
> The Armada and Rockchip drivers remain oddballs with their own graph 
> parsing. I can't see how the armada driver even can work. There's 
> nothing to instantiate the armada-drm device either in DT or the kernel.

Correct, that's sitting out of tree because it requires either legacy
code in arch/arm/mach-dove at the moment, or stuff for DT.  Each time
that I looked at the DT reserved memory stuff I've ended up giving up
as it always seemed to be half complete, and the documentation was
confusing (seemingly referring to things that weren't merged.)

Maybe that's changed today, but I've not had a chance to look at it
again.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
