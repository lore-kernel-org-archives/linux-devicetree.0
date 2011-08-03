From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v4 0/2] Add device tree support for i.mx51/53 boards
Date: Wed, 3 Aug 2011 09:45:36 +0200
Message-ID: <20110803074536.GA17990@pengutronix.de>
References: <1312267943-25551-1-git-send-email-shawn.guo@linaro.org>
	<20110802140610.GC20071@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110802140610.GC20071-e0URQFbLeQY2iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 02, 2011 at 03:06:10PM +0100, Grant Likely wrote:
> On Tue, Aug 02, 2011 at 02:52:21PM +0800, Shawn Guo wrote:
> > Changes since v3:
> >  * Fix machine_desc table for ARD matching
> >  * Turn the board setup that dt needs into callback
> > 
> > Changes since v2:
> >  * Drop iomuxc device tree support patch
> > 
> > Changes since v1:
> >  * Address comments on v1 given by Grant and Sascha
> >  * Add i.mx51 Babbage support
> > 
> > Shawn Guo (2):
> >       arm/mx5: add device tree support for imx53 boards
> >       arm/mx5: add device tree support for imx51 babbage
> 
> Looks good.
> 
> Sascha, assuming you're okay with it, I'd *really* like to ask Arnd to
> send this out to Linus immediately.  It may not be perfect, and we may
> change the device disable/enable policy, but it is useful enough that
> having it in mainline will help developers who want to start hacking
> on DT support.

ups, /me is missing on Cc.

Go ahead, I'm fine with it.

Sascha


-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
