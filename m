From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH v2 RESEND 0/5] clk: bcm21664: add common clock support
Date: Mon, 28 Apr 2014 22:48:28 -0700
Message-ID: <20140429054828.7224.12978@quantum>
References: <1398115587-32529-1-git-send-email-elder@linaro.org>
 <20140426000915.7224.11265@quantum> <20140426030212.GI1127@beef>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20140426030212.GI1127@beef>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Matt Porter <mporter@linaro.org>
Cc: devicetree@vger.kernel.org, bcm@fixthebug.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Alex Elder <elder@linaro.org>
List-Id: devicetree@vger.kernel.org

Quoting Matt Porter (2014-04-25 20:02:12)
> On Fri, Apr 25, 2014 at 05:09:15PM -0700, Mike Turquette wrote:
> > Quoting Alex Elder (2014-04-21 14:26:22)
> > > This is series has two parts.  The first two patches are changes
> > > to the existing Broadcom Kona family clock code to prepare for the
> > > addition of support for another SoC, bcm21664.
> > > 
> > > The remaining three define the binding and code for bcm21664, and
> > > replace the use of "fake" clocks in the device tree with the real
> > > ones.  This ends up being a fairly straightforward definition of
> > > the clocks on this SoC; the rest of the clock code is shared with
> > > other SoCs that use the Kona style clock system.
> > 
> > Hi Alex,
> > 
> > I'm happy to take only the clk patches or I can take the DT stuff as
> > well if it gets some Acks. Let me know how you want it handled.
> 
> Hi Mike,
> 
> Since there's a strict ordering requirement in this series (due to
> shared use of a DT include by the driver and dts) I'd like it if you
> could take the entire series through your tree to keep these together.
> I've acked the dts patch.

No problem. Taken into clk-next with your Ack added to patch #5.

Regards,
Mike

> 
> Thanks,
> Matt
> 
> > > This series depends on the following patch, which has been taken
> > > into the clk-fixes tree:
> > >     clk: bcm281xx: don't use unnamed structs or unions
> > >     https://lkml.org/lkml/2014/4/7/322
> > > 
> > > In addition, it depends on the version 4 of the following series,
> > > just (re)posted for review:
> > >     clk: bcm281xx: updates
> > >     https://lkml.org/lkml/2014/4/8/485
> > > 
> > > The patches in this series--based on the current linus/master branch
> > > plus the patches mentioned above--are available here:
> > >     http://git.linaro.org/git/landing-teams/working/broadcom/kernel.git
> > >     Branch review/bcm21664-clock-v2
> > > 
> > > Alex Elder (5):
> > >   clk: bcm281xx: move compatible string definitions
> > >   ARM: dts: revise kona clock binding document
> > >   ARM: dts: define clock binding for bcm21664
> > >   clk: bcm21664: use common clock framework
> > >   ARM: dts: use real clocks for bcm21664
> > > 
> > >  .../devicetree/bindings/clock/bcm-kona-clock.txt   | 116 ++++++---
> > >  arch/arm/boot/dts/bcm21664.dtsi                    | 190 +++++++++-----
> > >  drivers/clk/bcm/Kconfig                            |   2 +-
> > >  drivers/clk/bcm/Makefile                           |   1 +
> > >  drivers/clk/bcm/clk-bcm21664.c                     | 290 +++++++++++++++++++++
> > >  drivers/clk/bcm/clk-bcm281xx.c                     |  12 -
> > >  include/dt-bindings/clock/bcm21664.h               |  62 +++++
> > >  include/dt-bindings/clock/bcm281xx.h               |  12 +
> > >  8 files changed, 565 insertions(+), 120 deletions(-)
> > >  create mode 100644 drivers/clk/bcm/clk-bcm21664.c
> > >  create mode 100644 include/dt-bindings/clock/bcm21664.h
> > > 
> > > -- 
> > > 1.9.1
