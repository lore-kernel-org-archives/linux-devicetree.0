From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v2 01/11] staging: drm/imx: Add LDB support
Date: Thu, 28 Mar 2013 10:58:27 +0100
Message-ID: <1364464707.4018.32.camel@pizza.hi.pengutronix.de>
References: <1364405445-5271-1-git-send-email-p.zabel@pengutronix.de>
 <1364405445-5271-2-git-send-email-p.zabel@pengutronix.de>
 <20130328060806.GI5429@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130328060806.GI5429-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
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
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Martin Fuzzey <mfuzzey-mB3Nsq4MPf1BDgjK7y7TUQ@public.gmane.org>, Sean Cross <xobs-nXMMniAx+RbQT0dZR+AlfA@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Donnerstag, den 28.03.2013, 14:08 +0800 schrieb Shawn Guo:
> On Wed, Mar 27, 2013 at 06:30:35PM +0100, Philipp Zabel wrote:
> > +config DRM_IMX_LDB
> > +	tristate "Support for LVDS displays"
> > +	help
> > +	  Choose this to enable the internal LVDS Display Bridge (LDB)
> > +	  found on i.MX53 and i.MX6 processors.
> > +	depends on DRM_IMX
> > +
> 
> Shouldn't we select OF_VIDEOMODE here, since of_get_drm_display_mode()
> is called there.

Yes, will fix.

thank you
Philipp
