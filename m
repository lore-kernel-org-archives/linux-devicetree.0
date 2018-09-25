From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 7/8] phy: renesas: rcar-gen3-usb2: add conditions for
 uses_otg_pins == false
Date: Tue, 25 Sep 2018 09:30:50 +0200
Message-ID: <20180925073049.hv6ecnm7okgotvdd@verge.net.au>
References: <1537530804-19399-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1537530804-19399-8-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1537530804-19399-8-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Sep 21, 2018 at 08:53:23PM +0900, Yoshihiro Shimoda wrote:
> If uses_otg_pins is set to false, this driver 1) should disable otg
> related interruptions, and 2) should not get ID pin signal, to avoid
> unexpected behaviors. So, this patch adds conditions for it.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
