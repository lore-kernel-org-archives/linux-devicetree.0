From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2 3/4] arm64: add support for i.MX8M EVK board
Date: Fri, 23 Feb 2018 15:05:10 +0800
Message-ID: <20180223070509.GP3217@dragon>
References: <20180201183126.32384-1-l.stach@pengutronix.de>
 <20180201183126.32384-3-l.stach@pengutronix.de>
 <20180205072438.nxvhlqk54d7firbz@sapphire.tkos.co.il>
 <1517829046.3175.9.camel@pengutronix.de>
 <20180223034652.GM3217@dragon>
 <20180223043242.wkrlckws73kwu6xb@tarshish>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180223043242.wkrlckws73kwu6xb@tarshish>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Baruch Siach <baruch@tkos.co.il>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, patchwork-lst@pengutronix.de, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, kernel@pengutronix.de, Fabio Estevam <fabio.estevam@nxp.com>, "A . s . Dong" <aisheng.dong@nxp.com>, linux-arm-kernel@lists.infradead.org, Lucas Stach <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

Hi Baruch,

On Fri, Feb 23, 2018 at 06:32:42AM +0200, Baruch Siach wrote:
> Hi Sawn,
> 
> On Fri, Feb 23, 2018 at 11:46:53AM +0800, Shawn Guo wrote:
> > On Mon, Feb 05, 2018 at 12:10:46PM +0100, Lucas Stach wrote:
> > > I've pushed a branch with all the MX8M work to:
> > > https://git.pengutronix.de/git/lst/linux mx8-work
> > 
> > I have some problem to boot the kernel (and dtb) built from this branch.
> > I'm running an U-Boot from NXP which works fine with NXP kernel for
> > sure.  But using this U-Boot to load your kernel gives me nothing on
> > serial, even if I put 'earlycon=ec_imx6q,0x30860000' on kernel
> > cmdline.  Anything I'm missing here?  Thanks.
> 
> FWIW, I tested these patches on the i.MX8 EVK with the attached defconfig.
> 
> Hope this helps,

Yeah, it helps a lot.  I forgot the fact that arm64 defconfig file does
not include any i.MX platform options.  The serial driver is not even
enabled.

I enabled a few more options on top of your defconfig, and now am able
to boot into the Debian prompt over NFS.

Thanks for help.

Shawn
