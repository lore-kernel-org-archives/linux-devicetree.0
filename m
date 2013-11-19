From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 7/7] ARM: shmobile: armadillo-reference: Use low level
 IRQ for ST1231
Date: Tue, 19 Nov 2013 10:42:14 +0900
Message-ID: <20131119014214.GF17628@verge.net.au>
References: <1383999839-3339-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <1383999839-3339-8-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1383999839-3339-8-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-sh-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
List-Id: devicetree@vger.kernel.org

On Sat, Nov 09, 2013 at 01:23:59PM +0100, Laurent Pinchart wrote:
> The device is configured to generate an active-low interrupt signal that
> needs to be acknowledged by the host. Configure the IRQ to trigger on
> low level.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks, I have queued this up.
