From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH 1/3] dt/bindings: arm-pl330: add description of
 arm,pl330-periph-burst
Date: Fri, 5 Aug 2016 09:04:11 +0530
Message-ID: <20160805033410.GJ9681@localhost>
References: <1470365602-32586-1-git-send-email-shawn.lin@rock-chips.com>
 <1470365602-32586-2-git-send-email-shawn.lin@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1470365602-32586-2-git-send-email-shawn.lin@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Rob Herring <robh+dt@kernel.org>, Huibin Hong <huibin.hong@rock-chips.com>, Xing Zheng <zhengxing@rock-chips.com>, devicetree@vger.kernel.org, dianders@chromium.org, briannorris@chromium.org, Caesar Wang <wxt@rock-chips.com>, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Aug 05, 2016 at 10:53:20AM +0800, Shawn Lin wrote:
> This patch adds the "arm,pl330-periph-burst" for arm-pl330 to
> support busrt mode.

why should this be DT property. Only reason I can think of if some hw
versions support this and some won't.

If all are supporting, please enable it everywhere for obvious reasons.

-- 
~Vinod
