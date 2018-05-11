From: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH v3 1/2] vfio: platform: Fix reset module leak in error
 path
Date: Fri, 11 May 2018 13:45:44 -0600
Message-ID: <20180511134544.72b46acb@w520.home>
References: <1523438149-16433-1-git-send-email-geert+renesas@glider.be>
        <1523438149-16433-3-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1523438149-16433-3-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Baptiste Reynal <b.reynal@virtualopensystems.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, kvm@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 11 Apr 2018 11:15:48 +0200
Geert Uytterhoeven <geert+renesas@glider.be> wrote:

> If the IOMMU group setup fails, the reset module is not released.
> 
> Fixes: b5add544d677d363 ("vfio, platform: make reset driver a requirement by default")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> ---
> v3:
>   - Add Reviewed-by,
> 
> v2:
>   - Add Reviewed-by.
> ---
>  drivers/vfio/platform/vfio_platform_common.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)

Applied to next branch for v4.18 with Eric's ack.  Thanks,

Alex
