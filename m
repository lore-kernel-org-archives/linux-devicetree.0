From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 2/8] phy: renesas: rcar-gen3-usb2: fix vbus_ctrl for role
 sysfs
Date: Tue, 25 Sep 2018 09:30:38 +0200
Message-ID: <20180925073037.fqcomitltrw3uf6d@verge.net.au>
References: <1537530804-19399-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1537530804-19399-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1537530804-19399-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Sep 21, 2018 at 08:53:18PM +0900, Yoshihiro Shimoda wrote:
> This patch fixes and issue that the vbus_ctrl is disabled by
> rcar_gen3_init_from_a_peri_to_a_host(), so a usb host cannot
> supply the vbus.
> 
> Note that this condition will exit when the otg irq happens
> even if we don't apply this patch.
> 
> Fixes: 9bb86777fb71 ("phy: rcar-gen3-usb2: add sysfs for usb role swap")
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
