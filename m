From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2 1/2] vfio: platform: Fix reset module leak in error
 path
Date: Wed, 11 Apr 2018 10:09:31 +0200
Message-ID: <20180411080930.6knha76gu5f6qgnw@verge.net.au>
References: <1523375627-23746-1-git-send-email-geert+renesas@glider.be>
 <1523375627-23746-2-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1523375627-23746-2-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Baptiste Reynal <b.reynal@virtualopensystems.com>, Alex Williamson <alex.williamson@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, kvm@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 10, 2018 at 05:53:46PM +0200, Geert Uytterhoeven wrote:
> If the IOMMU group setup fails, the reset module is not released.
> 
> Fixes: b5add544d677d363 ("vfio, platform: make reset driver a requirement by default")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
