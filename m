From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [RFC PATCH v3 07/17] ARM: dts: imx: cpus/cpu nodes dts updates
Date: Thu, 25 Apr 2013 09:59:27 +0100
Message-ID: <20130425085926.GA25870@e102568-lin.cambridge.arm.com>
References: <1366824502-19729-1-git-send-email-lorenzo.pieralisi@arm.com>
 <1366824502-19729-8-git-send-email-lorenzo.pieralisi@arm.com>
 <20130425054426.GG1389@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20130425054426.GG1389@S2101-09.ap.freescale.net>
Content-Disposition: inline
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawn.guo@linaro.org>
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>, Jon Medhurst <tixy@linaro.org>, Dave Martin <dave.martin@linaro.org>, Andrew Lunn <andrew@lunn.ch>, Tony Lindgren <tony@atomide.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Linus Walleij <linus.walleij@linaro.org>, Will Deacon <Will.Deacon@arm.com>, Viresh Kumar <viresh.kumar@linaro.org>, Mark Rutland <Mark.Rutland@arm.com>, Lennert Buytenhek <kernel@wantstofly.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Magnus Damm <magnus.damm@gmail.com>, Catalin Marinas <Catalin.Marinas@arm.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>, David Brown <davidb@codeaurora.org>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Dinh Nguyen <dinguyen@altera.com>, Arnd Bergmann <arnd@arndb.de>, Stephen Warren <swarren@wwwdotorg.org>, Sekhar Nori <nsekhar@ti.com>, devicetree-discuss
List-Id: devicetree@vger.kernel.org

On Thu, Apr 25, 2013 at 06:44:28AM +0100, Shawn Guo wrote:
> On Wed, Apr 24, 2013 at 06:28:12PM +0100, Lorenzo Pieralisi wrote:
> > This patch updates the in-kernel dts files according to the latest cpus
> > and cpu bindings updates for ARM.
> > 
> > Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> > ---
> >  arch/arm/boot/dts/imx23.dtsi  | 8 ++++++--
> >  arch/arm/boot/dts/imx28.dtsi  | 8 ++++++--
> >  arch/arm/boot/dts/imx6dl.dtsi | 2 ++
> >  arch/arm/boot/dts/imx6q.dtsi  | 1 +
> >  4 files changed, 15 insertions(+), 4 deletions(-)
> > 
> > diff --git a/arch/arm/boot/dts/imx23.dtsi b/arch/arm/boot/dts/imx23.dtsi
> > index 56afcf4..0aae18b 100644
> > --- a/arch/arm/boot/dts/imx23.dtsi
> > +++ b/arch/arm/boot/dts/imx23.dtsi
> > @@ -23,8 +23,12 @@
> >  	};
> >  
> >  	cpus {
> > -		cpu@0 {
> > -			compatible = "arm,arm926ejs";
> > +		#address-cells = <0>;
> > +		#size-cells = <0>;
> > +
> > +		cpu {
> > +			compatible = "arm,arm926ej-s";
> > +			device_type = "cpu";
> >  		};
> >  	};
> >  
> > diff --git a/arch/arm/boot/dts/imx28.dtsi b/arch/arm/boot/dts/imx28.dtsi
> > index 7ba4966..07f131fc 100644
> > --- a/arch/arm/boot/dts/imx28.dtsi
> > +++ b/arch/arm/boot/dts/imx28.dtsi
> > @@ -32,8 +32,12 @@
> >  	};
> >  
> >  	cpus {
> > -		cpu@0 {
> > -			compatible = "arm,arm926ejs";
> > +		#address-cells = <0>;
> > +		#size-cells = <0>;
> > +
> > +		cpu {
> > +			compatible = "arm,arm926ej-s";
> > +			device_type = "cpu";
> >  		};
> >  	};
> >  
> > diff --git a/arch/arm/boot/dts/imx6dl.dtsi b/arch/arm/boot/dts/imx6dl.dtsi
> > index 63fafe2..b76d85e 100644
> > --- a/arch/arm/boot/dts/imx6dl.dtsi
> > +++ b/arch/arm/boot/dts/imx6dl.dtsi
> > @@ -16,12 +16,14 @@
> >  
> >  		cpu@0 {
> >  			compatible = "arm,cortex-a9";
> > +			device_type = "cpu";
> >  			reg = <0>;
> >  			next-level-cache = <&L2>;
> >  		};
> >  
> >  		cpu@1 {
> >  			compatible = "arm,cortex-a9";
> > +			device_type = "cpu";
> >  			reg = <1>;
> >  			next-level-cache = <&L2>;
> >  		};
> > diff --git a/arch/arm/boot/dts/imx6q.dtsi b/arch/arm/boot/dts/imx6q.dtsi
> > index cba021e..65c1b62 100644
> > --- a/arch/arm/boot/dts/imx6q.dtsi
> > +++ b/arch/arm/boot/dts/imx6q.dtsi
> > @@ -17,6 +17,7 @@
> >  
> >  		cpu@0 {
> >  			compatible = "arm,cortex-a9";
> > +			device_type = "cpu";
> 
> Shouldn't this line be added for cpu@1, cpu@2 and cpu@3 too?  Other than
> that,

Yes, you are right, fixed. Thanks for reviewing.

Lorenzo

> 
> Acked-by: Shawn Guo <shawn.guo@linaro.org>
> 
> >  			reg = <0>;
> >  			next-level-cache = <&L2>;
> >  			operating-points = <
> > -- 
> > 1.7.12
> > 
> > 
> 
> 
