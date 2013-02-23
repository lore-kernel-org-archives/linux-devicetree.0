From: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH] dma: imx-dma: Add oftree support
Date: Sat, 23 Feb 2013 17:57:48 +0100
Message-ID: <20130223165748.GE10660@pengutronix.de>
References: <1361543838-12604-1-git-send-email-mpa@pengutronix.de>
 <201302221446.07069.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201302221446.07069.arnd-r2nGTMty4D4@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, djbw-b10kYP2dOMg@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Arnd,

On Fri, Feb 22, 2013 at 02:46:06PM +0000, Arnd Bergmann wrote:
> On Friday 22 February 2013, Markus Pargmann wrote:
> > Adding devicetree support for imx-dma driver. Use driver name for
> > function 'imx_dma_is_general_purpose' because the devicename for
> > devicetree initialized devices is different.
> > 
> > Signed-off-by: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> 
> Hi Markus,
> 
> Please make sure you are following the generic dma binding from
> Documentation/devicetree/bindings/dma/dma.txt that is getting added
> in Linux-3.9.
> 
> > +++ b/Documentation/devicetree/bindings/dma/fsl-imx-dma.txt
> > @@ -0,0 +1,13 @@
> > +* Freescale Direct Memory Access (DMA) Controller for i.MX
> > +
> > +Required properties:
> > +- compatible : Should be "fsl,<chip>-dma". chip can be imx1, imx21 or imx27
> > +- reg : Should contain DMA registers location and length
> > +- interrupts : First item should be DMA interrupt, second one is optional and
> > +  should contain DMA Error interrupt
> > +
> > +dma: dma@10001000 {
> > +       compatible = "fsl,imx27-dma";
> > +       reg = <0x10001000 0x1000>;
> > +       interrupts = <32 33>;
> > +};
> 
> In particular, the "#dma-cells" property is required here, along with
> dma-channels and dma-requests. You also need to describe the format
> of the "dmas" property in slave drivers referring to this node.
> In a lot of cases, you only need a single cell there, which is the
> request line number.
> 
> 	Arnd

Thanks, I changed the patch to use the generic DMA bindings, see V2.
However I couldn't find any information about the number of supported
DMA requests.

Markus

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
