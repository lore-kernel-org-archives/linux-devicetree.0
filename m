From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH v5 2/2] phy: qualcomm: Add Synopsys High-Speed USB PHY
 driver
Date: Thu, 20 Dec 2018 08:48:50 +0800
Message-ID: <20181220004848.GB16635@dragon>
References: <20181127100722.9993-1-shawn.guo@linaro.org>
 <20181127100722.9993-3-shawn.guo@linaro.org>
 <20181219200107.GD1997@jackp-linux.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181219200107.GD1997@jackp-linux.qualcomm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jack Pham <jackp@codeaurora.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, Sriharsha Allenki <sallenki@codeaurora.org>, Anu Ramanathan <anur@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Dec 19, 2018 at 12:01:07PM -0800, Jack Pham wrote:
> Hi Shawn,
> 
> On Tue, Nov 27, 2018 at 06:07:22PM +0800, Shawn Guo wrote:
> > It adds Synopsys 28nm Femto High-Speed USB PHY driver support, which
> > is usually paired with Synopsys DWC3 USB controllers on Qualcomm SoCs.
> > 
> > Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> > ---
> >  drivers/phy/qualcomm/Kconfig                  |  10 +
> >  drivers/phy/qualcomm/Makefile                 |   1 +
> >  .../phy/qualcomm/phy-qcom-usb-hs-snsp-28nm.c  | 529 ++++++++++++++++++
> 
> Just caught this...
> s/snsp/snps/ in the file name? The bindings doc in Patch 1 is named
> correctly.

Oops, I will fix it with v6.  Thanks for spotting it.

Shawn
