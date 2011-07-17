From: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: Is there a binding for IORESOURCE_DMA population?
Date: Sun, 17 Jul 2011 15:41:59 +0800
Message-ID: <20110717074159.GF2374@S2100-06.ap.freescale.net>
References: <20110715163254.GG1840@S2100-06.ap.freescale.net>
	<201107152011.41546.arnd@arndb.de>
	<20110716075748.GI1840@S2100-06.ap.freescale.net>
	<201107161409.46719.arnd@arndb.de>
	<20110716143456.GA2374@S2100-06.ap.freescale.net>
	<4E21A392.3010608@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4E21A392.3010608-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Tabi Timur-B04825 <B04825-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Guo Shawn-R65073 <r65073-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Jul 16, 2011 at 10:43:31PM +0800, Tabi Timur-B04825 wrote:
> Shawn Guo wrote:
> > ssi@83fcc000 { /* SSI1 */
> > 	compatible = "fsl,imx51-ssi", "fsl,imx1-ssi";
> > 	reg =<0x83fcc000 0x4000>;
> > 	interrupts =<29>;
> > 	fsl,dma-events =<29 28 27 26>; /* TX0 RX0 TX1 RX1 */
> > 	fsl,ssi-uses-dma;
> > };
> 
> This is similar to what we do on PowerPC:
> 
>              ssi@15000 {
>                      compatible = "fsl,mpc8610-ssi";
>                      cell-index = <0>;
>                      reg = <0x15000 0x100>;
>                      interrupts = <75 2 0 0>;
>                      fsl,mode = "i2s-slave";
>                      codec-handle = <&wm8776>;
>                      fsl,playback-dma = <&dma00>;
>                      fsl,capture-dma = <&dma01>;
>                      fsl,fifo-depth = <15>;
>                      fsl,ssi-asynchronous;
>               };
> 
> Keep in mind that there already is a device-tree enabled SSI driver, so 
> you need to find a way to use that driver, instead of adding device-tree 
> support to the non-DT driver that's already there.
> 
Between a) making DT enabled SSI driver (mpc version) work for i.mx
and b) adding DT probe support for imx-ssi driver, I would absolutely
go for b).  Apparently it's much easier.

-- 
Regards,
Shawn
