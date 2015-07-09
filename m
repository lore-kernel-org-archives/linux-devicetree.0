From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v6 4/6] ARM: vf610: enable NAND Flash Controller
Date: Thu, 9 Jul 2015 09:55:51 +0800
Message-ID: <20150709015551.GJ28488@tiger>
References: <1434668319-6651-1-git-send-email-stefan@agner.ch>
 <1434668319-6651-5-git-send-email-stefan@agner.ch>
 <20150708093801.GG28488@tiger>
 <BLU436-SMTP255283C042EDEF59D9BA0CFB8910@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <BLU436-SMTP255283C042EDEF59D9BA0CFB8910@phx.gbl>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bill Pringlemeir <bpringle@sympatico.ca>
Cc: mark.rutland@arm.com, boris.brezillon@free-electrons.com, shawn.guo@linaro.org, marb@ixxat.de, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, devicetree@vger.kernel.org, bpringlemeir@gmail.com, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>, sebastian@breakpoint.cc, robh+dt@kernel.org, linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, galak@codeaurora.org, computersforpeace@gmail.com, dwmw2@infradead.org, aaron@tastycactus.com
List-Id: devicetree@vger.kernel.org

On Wed, Jul 08, 2015 at 10:32:54AM -0400, Bill Pringlemeir wrote:
> 
> On  8 Jul 2015, shawnguo@kernel.org wrote:
> > On Fri, Jun 19, 2015 at 12:58:37AM +0200, Stefan Agner wrote:
> >> Enable the NAND Flash Controller driver which is part of the Vybrid
> >> SoC by default.
> >>
> >> Signed-off-by: Stefan Agner <stefan@agner.ch>
> >> ---
> >> arch/arm/mach-imx/Kconfig | 1 +
> >> 1 file changed, 1 insertion(+)
> >>
> >> diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
> >> index 3a3d3e9..9358135 100644
> >> --- a/arch/arm/mach-imx/Kconfig
> >> +++ b/arch/arm/mach-imx/Kconfig
> >>>> -589,6 +589,7 @@ config SOC_VF610
> >> 	select PINCTRL_VF610
> >> 	select PL310_ERRATA_769419 if CACHE_L2X0
> >> 	select SMP_ON_UP if SMP
> >> +	select HAVE_NAND_VF610_NFC
> 
> > I'm not sure about the benefit of having this option, except we have
> > to have this additional architecture patch.
> 
> For other SOC, like the PowerPC or ColdFire CPUs with this controller,
> it was a way to mark the controller as populated.  Otherwise, the
> Kconfig entry to select the controller will pop up for everybody.

IMHO, having the option pop up for everybody isn't really a problem.  On
the other hand, we can even compile test the driver on any architecture
without the COMPILE_TEST dependency.

But if MTD maintainer has a different opinion, we can still have a
'depends on SOC_VF610' to save this patch.

Shawn
