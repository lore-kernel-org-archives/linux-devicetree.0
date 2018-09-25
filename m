From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 8/8] phy: renesas: rcar-gen3-usb2: add is_otg_channel to
 use "role" sysfs
Date: Tue, 25 Sep 2018 09:31:01 +0200
Message-ID: <20180925073059.2ijq4qzqd5vup3ug@verge.net.au>
References: <1537530804-19399-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1537530804-19399-9-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1537530804-19399-9-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Sep 21, 2018 at 08:53:24PM +0900, Yoshihiro Shimoda wrote:
> Even if a board doesn't have otg pins connection, this hardware can
> change the role by a register setting. So, this patch adds
> "is_otg_channel" for it.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
