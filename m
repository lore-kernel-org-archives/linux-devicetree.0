From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Is there a binding for IORESOURCE_DMA population?
Date: Sun, 17 Jul 2011 22:39:40 -0600
Message-ID: <20110718043940.GD15023@ponder.secretlab.ca>
References: <20110715163254.GG1840@S2100-06.ap.freescale.net>
	<201107152011.41546.arnd@arndb.de>
	<20110716075748.GI1840@S2100-06.ap.freescale.net>
	<201107161409.46719.arnd@arndb.de>
	<20110716143456.GA2374@S2100-06.ap.freescale.net>
	<4E21A392.3010608@freescale.com>
	<20110717074159.GF2374@S2100-06.ap.freescale.net>
	<4E22E66D.5010809@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4E22E66D.5010809-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
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

On Sun, Jul 17, 2011 at 01:41:02PM +0000, Tabi Timur-B04825 wrote:
> Shawn Guo wrote:
> >> >
> > Between a) making DT enabled SSI driver (mpc version) work for i.mx
> > and b) adding DT probe support for imx-ssi driver, I would absolutely
> > go for b).  Apparently it's much easier.
> 
> Absolutely not!  It's ridiculous to have two drivers for the same exact 
> device that are both device-tree enabled.  It's already bad enough that we 
> have fsl-ssi.c and imx-ssi.c.  imx-ssi.c should never have been created, 
> but there's no way I will approve enhancing imx-ssi.c to also support 
> device trees, when fsl-ssi.c already does this.

I would disagree here.  I absolutely do think that the drivers should
be consolidated if they are the same device, but until someone
actually steps up to do that work, and as long as the current drivers
use different interfaces, then I have no problem adding the DT
bindings to the imx-ssi.c driver.

That said, since the fsl-ssi.c driver already implements a DT binding,
the imx driver definitely should implement the same binding unless
there is a really strong technical reason not to.

g.
