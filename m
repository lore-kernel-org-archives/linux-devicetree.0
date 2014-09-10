From: Robin Gong <b38343@freescale.com>
Subject: Re: [PATCH v1] ARM: dts: imx6dl: disable dma support for spi on
 i.mx6dl
Date: Wed, 10 Sep 2014 13:16:16 +0800
Message-ID: <20140910051615.GA29006@Robin-OptiPlex-780>
References: <1410312816-32171-1-git-send-email-b38343@freescale.com>
 <20140910032128.GD18566@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20140910032128.GD18566@dragon>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawn.guo@freescale.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux@arm.linux.org.uk, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, linux-kernel@vger.kernel.org, robh+dt@kernel.org, kernel@pengutronix.de, galak@codeaurora.org, Frank.Li@freescale.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 10, 2014 at 11:21:30AM +0800, Shawn Guo wrote:
> On Wed, Sep 10, 2014 at 09:33:36AM +0800, Robin Gong wrote:
> > There is one weird data in rxfifo after one full rx/tx transfer
> > done sometimes. It looks a design issue and hard to workaround
> > totally, so disable dma functhion here. And will re-enable it
> > once the root cause found.
> > 
> > Signed-off-by: Robin Gong <b38343@freescale.com>
> > ---
> >  arch/arm/boot/dts/imx6dl.dtsi | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/imx6dl.dtsi b/arch/arm/boot/dts/imx6dl.dtsi
> > index b453e0e..e84a1ff 100644
> > --- a/arch/arm/boot/dts/imx6dl.dtsi
> > +++ b/arch/arm/boot/dts/imx6dl.dtsi
> > @@ -102,6 +102,22 @@
> >  	};
> >  };
> >  
> > +&ecspi1 {
> > +	dma-names = "", "";
> > +};
> > +
> > +&ecspi2 {
> > +	dma-names = "", "";
> > +};
> > +
> > +&ecspi3 {
> > +	dma-names = "", "";
> > +};
> > +
> > +&ecspi4 {
> > +	dma-names = "", "";
> > +};
> > +
> 
> This looks odd.  Can we drop the dma properties from imx6qdl.dtsi,
> and only add them in imx6q.dtsi instead?
> 
> Shawn
>
Ok, I'll send v2.
> >  &hdmi {
> >  	compatible = "fsl,imx6dl-hdmi";
> >  };
> > -- 
> > 1.9.1
> > 
