From: Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCH V4 2/4] drivers/perf: imx_ddr: Add ddr performance
 counter support
Date: Fri, 5 Apr 2019 15:38:46 +0100
Message-ID: <20190405143846.GB7313@fuggles.cambridge.arm.com>
References: <1550253761-26841-1-git-send-email-Frank.Li@nxp.com>
 <1550253761-26841-2-git-send-email-Frank.Li@nxp.com>
 <20190404111714.GA26392@fuggles.cambridge.arm.com>
 <CAHrpEqT67OpeGXB7wgYSsTD9ibG_jk7xO5zMFyxcG5PHFP-bJg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CAHrpEqT67OpeGXB7wgYSsTD9ibG_jk7xO5zMFyxcG5PHFP-bJg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Zhi Li <lznuaa@gmail.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, Aisheng Dong <aisheng.dong@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "festevam@gmail.com" <festevam@gmail.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, Frank Li <frank.li@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 05, 2019 at 09:34:38AM -0500, Zhi Li wrote:
> On Thu, Apr 4, 2019 at 6:17 AM Will Deacon <will.deacon@arm.com> wrote:
> >
> > Hi Frank,
> >
> > On Fri, Feb 15, 2019 at 06:03:11PM +0000, Frank Li wrote:
> > > Add ddr performance monitor support for iMX8QXP
> > >
> > > There are 4 counters for ddr perfomance events.
> > > counter 0 is dedicated for cycles.
> > > you choose any up to 3 no cycles events.
> > >
> > > for example:
> > >
> > > perf stat -a -e ddr0/read-access/,ddr0/write-access/,ddr0/precharge/ ls
> > > perf stat -a -e ddr0/cycles/,ddr0/read-access/,ddr0/write-access/ ls
> >
> > Could you elaborate a bit on DDR_CAP_AXI_ID, please? Specifically, how
> > does the COUNTER_DPCR1 register work and what happens if I specify two
> > simultaneous events with different values in config1? I'm a little wary
> > of taking raw user input and throwing it straight into a device register!
> 
> I have not find better method to do that.
> bit 0-15: AXIID
> bit  16-31: AXID_MASK
> 
> Check condition AxID && AXI_MASKING == AXI_ID && AXI_MASKING

Hmm, that doesn't really answer my second question :(

  What happens if I specify two simultaneous events with different values
  in config1?

Will
