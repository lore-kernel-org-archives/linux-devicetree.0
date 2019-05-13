From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v3 0/4] Add reset controller support for BM1880 SoC
Date: Mon, 13 May 2019 16:46:54 +0200
Message-ID: <1557758814.4442.9.camel@pengutronix.de>
References: <20190510184525.13568-1-manivannan.sadhasivam@linaro.org>
         <1557745589.4442.5.camel@pengutronix.de>
         <20190513140637.GA19120@Mani-XPS-13-9360>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190513140637.GA19120@Mani-XPS-13-9360>
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: robh+dt@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, haitao.suo@bitmain.com, darren.tsao@bitmain.com, alec.lin@bitmain.com
List-Id: devicetree@vger.kernel.org

On Mon, 2019-05-13 at 19:36 +0530, Manivannan Sadhasivam wrote:
> Hi Philipp,
> 
> On Mon, May 13, 2019 at 01:06:29PM +0200, Philipp Zabel wrote:
> > Hi,
> > 
> > On Sat, 2019-05-11 at 00:15 +0530, Manivannan Sadhasivam wrote:
> > > Hello,
> > > 
> > > This patchset adds reset controller support for Bitmain BM1880 SoC.
> > > BM1880 SoC has only one reset controller and the reset-simple driver
> > > has been reused here.
> > > 
> > > This patchset has been tested on 96Boards Sophon Edge board.
> > > 
> > > Thanks,
> > > Mani
> > > 
> > > Changes in v3:
> > > 
> > > * Removed the clk-rst part as it turned out be the clock gating register set.
> > 
> > Thank you, I'd like to pick up patches 1, 3, and 4.
> > 
> > Since patch 2 depends on patch 1, you could either temporarily replace
> > the constants with their numerical value, until patch 1 is merged, or I
> > could provide a stable branch that contains patch 1 after v5.2-rc1.
> > 
> 
> I can use the numerical value in meantime, please pick those patches and I'll
> take the dts through arm-soc tree.

Done.

regards
Philipp
