From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 3/8] phy: renesas: rcar-gen3-usb2: Rename has_otg_pins to
 uses_otg_pins
Date: Tue, 25 Sep 2018 09:31:22 +0200
Message-ID: <20180925073121.q2xlc22ywl6x527w@verge.net.au>
References: <1537530804-19399-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1537530804-19399-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1537530804-19399-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Sep 21, 2018 at 08:53:19PM +0900, Yoshihiro Shimoda wrote:
> Since R-Car E3 and D3 have dedicated otg pins actually, "has_otg_pins"
> is possible to misread in the future. So, this patch renames
> has_otg_pins to uses_otg_pins.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
