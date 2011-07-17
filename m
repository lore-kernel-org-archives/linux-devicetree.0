From: Tabi Timur-B04825 <B04825-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: Is there a binding for IORESOURCE_DMA population?
Date: Sun, 17 Jul 2011 13:41:02 +0000
Message-ID: <4E22E66D.5010809@freescale.com>
References: <20110715163254.GG1840@S2100-06.ap.freescale.net>
	<201107152011.41546.arnd@arndb.de>
	<20110716075748.GI1840@S2100-06.ap.freescale.net>
	<201107161409.46719.arnd@arndb.de>
	<20110716143456.GA2374@S2100-06.ap.freescale.net>
	<4E21A392.3010608@freescale.com>
	<20110717074159.GF2374@S2100-06.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110717074159.GF2374-+NayF8gZjK2ctlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
Content-Language: en-US
Content-ID: <4DFF33684FC7AD4BB7785A801FE5A58D-KZfg59tc24wqcZcGjlUOXw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Guo Shawn-R65073 <r65073-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Shawn Guo wrote:
>> >
> Between a) making DT enabled SSI driver (mpc version) work for i.mx
> and b) adding DT probe support for imx-ssi driver, I would absolutely
> go for b).  Apparently it's much easier.

Absolutely not!  It's ridiculous to have two drivers for the same exact 
device that are both device-tree enabled.  It's already bad enough that we 
have fsl-ssi.c and imx-ssi.c.  imx-ssi.c should never have been created, 
but there's no way I will approve enhancing imx-ssi.c to also support 
device trees, when fsl-ssi.c already does this.

-- 
Timur Tabi
Linux kernel developer at Freescale
