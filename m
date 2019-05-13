From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v3 0/4] Add reset controller support for BM1880 SoC
Date: Mon, 13 May 2019 19:36:37 +0530
Message-ID: <20190513140637.GA19120@Mani-XPS-13-9360>
References: <20190510184525.13568-1-manivannan.sadhasivam@linaro.org>
 <1557745589.4442.5.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1557745589.4442.5.camel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: robh+dt@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, haitao.suo@bitmain.com, darren.tsao@bitmain.com, alec.lin@bitmain.com
List-Id: devicetree@vger.kernel.org

Hi Philipp,

On Mon, May 13, 2019 at 01:06:29PM +0200, Philipp Zabel wrote:
> Hi,
> 
> On Sat, 2019-05-11 at 00:15 +0530, Manivannan Sadhasivam wrote:
> > Hello,
> > 
> > This patchset adds reset controller support for Bitmain BM1880 SoC.
> > BM1880 SoC has only one reset controller and the reset-simple driver
> > has been reused here.
> > 
> > This patchset has been tested on 96Boards Sophon Edge board.
> > 
> > Thanks,
> > Mani
> > 
> > Changes in v3:
> > 
> > * Removed the clk-rst part as it turned out be the clock gating register set.
> 
> Thank you, I'd like to pick up patches 1, 3, and 4.
> 
> Since patch 2 depends on patch 1, you could either temporarily replace
> the constants with their numerical value, until patch 1 is merged, or I
> could provide a stable branch that contains patch 1 after v5.2-rc1.
> 

I can use the numerical value in meantime, please pick those patches and I'll
take the dts through arm-soc tree.

Thanks,
Mani

> regards
> Philipp
