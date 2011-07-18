From: Tabi Timur-B04825 <B04825-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: Is there a binding for IORESOURCE_DMA population?
Date: Mon, 18 Jul 2011 11:19:52 +0000
Message-ID: <4E2416D7.30106@freescale.com>
References: <20110715163254.GG1840@S2100-06.ap.freescale.net>
	<201107152011.41546.arnd@arndb.de>
	<20110716075748.GI1840@S2100-06.ap.freescale.net>
	<201107161409.46719.arnd@arndb.de>
	<20110716143456.GA2374@S2100-06.ap.freescale.net>
	<4E21A392.3010608@freescale.com>
	<20110717074159.GF2374@S2100-06.ap.freescale.net>
	<4E22E66D.5010809@freescale.com>
	<20110718043940.GD15023@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110718043940.GD15023-e0URQFbLeQY2iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Content-Language: en-US
Content-ID: <BBA587D266F36449AF199E0A166D3449-KZfg59tc24wqcZcGjlUOXw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Guo Shawn-R65073 <r65073-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Grant Likely wrote:
> That said, since the fsl-ssi.c driver already implements a DT binding,
> the imx driver definitely should implement the same binding unless
> there is a really strong technical reason not to.

What's the point of having two drivers for the same device that implement 
the same DT binding?

-- 
Timur Tabi
Linux kernel developer at Freescale
