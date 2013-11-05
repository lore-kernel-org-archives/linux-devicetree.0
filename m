From: Peter Chen <peter.chen@freescale.com>
Subject: Re: [PATCH v3 04/11] ARM: dts: imx6: add anatop phandle for usbphy
Date: Tue, 5 Nov 2013 10:53:08 +0800
Message-ID: <20131105025307.GC13472@shlinux1.ap.freescale.net>
References: <1383616183-10511-1-git-send-email-peter.chen@freescale.com>
 <1383616183-10511-5-git-send-email-peter.chen@freescale.com>
 <20131105024130.GG19770@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20131105024130.GG19770@S2101-09.ap.freescale.net>
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
Cc: marex@denx.de, devicetree@vger.kernel.org, m.grzeschik@pengutronix.de, frank.li@freescale.com, linux-doc@vger.kernel.org, alexander.shishkin@linux.intel.com, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, rob.herring@calxeda.com, balbi@ti.com, kernel@pengutronix.de, grant.likely@linaro.org, festevam@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Nov 05, 2013 at 10:41:33AM +0800, Shawn Guo wrote:
> On Tue, Nov 05, 2013 at 09:49:36AM +0800, Peter Chen wrote:
> > Add anatop phandle for usbphy
> > 
> > Signed-off-by: Peter Chen <peter.chen@freescale.com>
> > ---
> >  arch/arm/boot/dts/imx6qdl.dtsi |    2 ++
> >  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> Does imx6sl.dtsi need the same update?
> 

It is needed (for chipidea, it is the same), but I still have
no time to test on it. Will add them later.

Peter

> Shawn
> 
> > 
> > diff --git a/arch/arm/boot/dts/imx6qdl.dtsi b/arch/arm/boot/dts/imx6qdl.dtsi
> > index 226ce75..bb79678 100644
> > --- a/arch/arm/boot/dts/imx6qdl.dtsi
> > +++ b/arch/arm/boot/dts/imx6qdl.dtsi
> > @@ -559,6 +559,7 @@
> >  				reg = <0x020c9000 0x1000>;
> >  				interrupts = <0 44 0x04>;
> >  				clocks = <&clks 182>;
> > +				fsl,anatop = <&anatop>;
> >  			};
> >  
> >  			usbphy2: usbphy@020ca000 {
> > @@ -566,6 +567,7 @@
> >  				reg = <0x020ca000 0x1000>;
> >  				interrupts = <0 45 0x04>;
> >  				clocks = <&clks 183>;
> > +				fsl,anatop = <&anatop>;
> >  			};
> >  
> >  			snvs@020cc000 {
> > -- 
> > 1.7.1
> > 
> > 

-- 

Best Regards,
Peter Chen
