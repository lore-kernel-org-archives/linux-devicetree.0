From: Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCH V12 2/4] drivers/perf: imx_ddr: Add ddr performance
 counter support
Date: Tue, 14 May 2019 15:55:41 +0100
Message-ID: <20190514145541.GC2825@fuggles.cambridge.arm.com>
References: <1556736193-29411-1-git-send-email-Frank.Li@nxp.com>
 <1556736193-29411-2-git-send-email-Frank.Li@nxp.com>
 <CAHQ1cqGszjTZ+kSTeqHjoZ-QPKd6f1Afn+00-haJy_dJY4X4+g@mail.gmail.com>
 <CAHrpEqQKyH0+vXJfWf0fuUDvQnSCKjrBmU8megsUWX1mHdbfrw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CAHrpEqQKyH0+vXJfWf0fuUDvQnSCKjrBmU8megsUWX1mHdbfrw@mail.gmail.com>
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, Aisheng Dong <aisheng.dong@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Andrey Smirnov <andrew.smirnov@gmail.com>, "festevam@gmail.com" <festevam@gmail.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, Frank Li <frank.li@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 14, 2019 at 08:53:18AM -0500, Zhi Li wrote:
> On Tue, May 7, 2019 at 2:30 PM Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
> >
> > On Wed, May 1, 2019 at 11:43 AM Frank Li <frank.li@nxp.com> wrote:
> > >
> > > Add ddr performance monitor support for iMX8QXP
> > >
> > > There are 4 counters for ddr perfomance events.
> > > counter 0 is dedicated for cycles.
> > > you choose any up to 3 no cycles events.
> > >
> > > for example:
> > >
> > > perf stat -a -e imx8_ddr0/read-cycles/,imx8_ddr0/write-cycles/,imx8_ddr0/precharge/ ls
> > > perf stat -a -e imx8_ddr0/cycles/,imx8_ddr0/read-access/,imx8_ddr0/write-access/ ls
> > >
> > > Support below events.
> > >
> > >   imx8_ddr0/activate/                                     [Kernel PMU event]
> > >   imx8_ddr0/axid-read/                                    [Kernel PMU event]
> > >   imx8_ddr0/axid-write/                                   [Kernel PMU event]
> > >   imx8_ddr0/cycles/                                       [Kernel PMU event]
> > >   imx8_ddr0/hp-read-credit-cnt/                           [Kernel PMU event]
> > >   imx8_ddr0/hp-read/                                      [Kernel PMU event]
> > >   imx8_ddr0/hp-req-nodcredit/                             [Kernel PMU event]
> > >   imx8_ddr0/hp-xact-credit/                               [Kernel PMU event]
> > >   imx8_ddr0/load-mode/                                    [Kernel PMU event]
> > >   imx8_ddr0/lp-read-credit-cnt/                           [Kernel PMU event]
> > >   imx8_ddr0/lp-req-nocredit/                              [Kernel PMU event]
> > >   imx8_ddr0/lp-xact-credit/                               [Kernel PMU event]
> > >   imx8_ddr0/mwr/                                          [Kernel PMU event]
> > >   imx8_ddr0/precharge/                                    [Kernel PMU event]
> > >   imx8_ddr0/raw-hazard/                                   [Kernel PMU event]
> > >   imx8_ddr0/read-access/                                  [Kernel PMU event]
> > >   imx8_ddr0/read-activate/                                [Kernel PMU event]
> > >   imx8_ddr0/read-command/                                 [Kernel PMU event]
> > >   imx8_ddr0/read-cycles/                                  [Kernel PMU event]
> > >   imx8_ddr0/read-modify-write-command/                    [Kernel PMU event]
> > >   imx8_ddr0/read-queue-depth/                             [Kernel PMU event]
> > >   imx8_ddr0/read-write-transition/                        [Kernel PMU event]
> > >   imx8_ddr0/read/                                         [Kernel PMU event]
> > >   imx8_ddr0/refresh/                                      [Kernel PMU event]
> > >   imx8_ddr0/selfresh/                                     [Kernel PMU event]
> > >   imx8_ddr0/wr-xact-credit/                               [Kernel PMU event]
> > >   imx8_ddr0/write-access/                                 [Kernel PMU event]
> > >   imx8_ddr0/write-command/                                [Kernel PMU event]
> > >   imx8_ddr0/write-credit-cnt/                             [Kernel PMU event]
> > >   imx8_ddr0/write-cycles/                                 [Kernel PMU event]
> > >   imx8_ddr0/write-queue-depth/                            [Kernel PMU event]
> > >   imx8_ddr0/write/
> > >
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> >
> > Don't really have anything to suggest, that I already haven't. LGTM, so:
> >
> > Reviewed-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> 
> 
> Will Deacon:
>             Is it okay to pick up these patches?  Andrey always acked.

It's the merge window at the moment, so it's too late for 5.2. I'll have a
look at these in a couple of weeks as candidates for 5.3.

Thanks,

Will
