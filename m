From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 1/3] arm: imx6sx: udoo: Use the correct style for SPDX
 License Identifier
Date: Wed, 12 Jun 2019 16:12:31 +0800
Message-ID: <20190612081230.GC11086@dragon>
References: <20190601070718.26971-1-pbrobinson@gmail.com>
 <20190601070718.26971-2-pbrobinson@gmail.com>
 <20190611224933.GA8624@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190611224933.GA8624@bogus>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Peter Robinson <pbrobinson@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 11, 2019 at 04:49:33PM -0600, Rob Herring wrote:
> On Sat, Jun 01, 2019 at 08:07:16AM +0100, Peter Robinson wrote:
> > Use the SPDX License Identifier for GPL-2.0+ OR X11
> > 
> > Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> > ---
> >  arch/arm/boot/dts/imx6sx-udoo-neo-basic.dts   | 39 +------------------
> >  .../arm/boot/dts/imx6sx-udoo-neo-extended.dts | 39 +------------------
> >  arch/arm/boot/dts/imx6sx-udoo-neo-full.dts    | 39 +------------------
> >  arch/arm/boot/dts/imx6sx-udoo-neo.dtsi        | 39 +------------------
> >  4 files changed, 4 insertions(+), 152 deletions(-)
> > 
> > diff --git a/arch/arm/boot/dts/imx6sx-udoo-neo-basic.dts b/arch/arm/boot/dts/imx6sx-udoo-neo-basic.dts
> > index db0feb9b9f5d..b6fbceaf6889 100644
> > --- a/arch/arm/boot/dts/imx6sx-udoo-neo-basic.dts
> > +++ b/arch/arm/boot/dts/imx6sx-udoo-neo-basic.dts
> > @@ -1,43 +1,6 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR X11)
> 
> This should actually be MIT, not X11. If you look at X11 SPDX 
> definition, it is for a specifc X Consortium copyright and adds a no 
> advertising clause on top of MIT.

Okay.  I just got it fixed on my branch.

Shawn
