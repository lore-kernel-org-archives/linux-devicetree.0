From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 2/3] phy: renesas: rcar-gen3-usb2: Use pdev's device
 pointer on dev_vdbg()
Date: Wed, 3 Apr 2019 11:21:25 +0200
Message-ID: <20190403092124.3bs2pbgboqp33jvm@verge.net.au>
References: <1554120083-29990-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1554120083-29990-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1554120083-29990-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Apr 01, 2019 at 09:01:22PM +0900, Yoshihiro Shimoda wrote:
> To implement multiple phy instances in the future, this patch uses
> pdev's device pointer on dev_vdbg() instead of the phy's device
> pointer.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

LGTM

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
