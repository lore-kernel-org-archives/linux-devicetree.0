From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] pinctrl: imx5: start numbering pad from 0
Date: Thu, 16 Aug 2012 11:45:11 +0800
Message-ID: <20120816034506.GI2258@S2101-09.ap.freescale.net>
References: <CAP1dx+zQvBurT9oCmfJ0dGHHV3rbgdy+0Yh_hoPL9jQB8QNxKw@mail.gmail.com>
 <CAKGA1bmHqyDGyvZjEcQ+RO1jHiZNZKNu3BGkyUXzYfwVaySYEQ@mail.gmail.com>
 <CAP1dx+x0_j_f3Pj+9+YHcwoTqjGLXouf7t+SoCCMVGKJNOHCPw@mail.gmail.com>
 <20120815054436.GK2232@pengutronix.de>
 <20120815065526.GG19681@shlinux2.ap.freescale.net>
 <20120815075117.GL2232@pengutronix.de>
 <20120815092539.GH19681@shlinux2.ap.freescale.net>
 <20120815135947.GC2258@S2101-09.ap.freescale.net>
 <20120815153107.GG2258@S2101-09.ap.freescale.net>
 <CAKGA1bkNEJbQgwcdZs8PozCgVyOfUE=bDCGkRkKV3VMfbvRMgw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKGA1bkNEJbQgwcdZs8PozCgVyOfUE=bDCGkRkKV3VMfbvRMgw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Matt Sealey <matt-sEEEE4iEDtaXzmuOJsdVMQ@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Dong Aisheng <dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 15, 2012 at 11:49:01AM -0500, Matt Sealey wrote:
> > Rather than betting how DTC will implement macro, we'd better make the
> > the safest assumption - it will not support that syntax.
> 
> It won't.

There were a lot of pushing on macro support for DTC.  Though it's
going to be very slow, I guess someday we will have it at least for
those simple and straight-forward syntax.

But right, we shouldn't make any assumption on that.

> DT is defined by properties and those properties have cells.
> Properties
> that have more than one cell or multiple definitions in them have to have a
> #size-cells property to go with it somehow.
> 
> I don't see what the problem would be here; you want to define pin properties,
> sure, they are intrinsically defined by 3 possible registers and value pairs. In
> actual fact if you drill down to this, what happens is you get a pin property
> which defines offsets into the unit, and values to stuff into those
> registers, so
> you could either dictate a size-cell of 6 (3 pairs of reg-value) or 2
> (reg, value).
> It would be more convenient for a driver to know what those pairs are maybe,
> so 6 is better.

<snip>

> iomuxc@0x73f08000 {
>   fsl,iomux-pins = <mux value ctrl value ipp value
> /* MX53_PIN_SD4_CMD__SD4_CMD */
>                             mux value ctrl value ipp value
>        /* etc. */
>                             ...>;
> 
I do not see problem with this approach either.  But, this is nothing
IMX specific.  Essentially, this becomes a common binding for
configuring a pin with arbitrary number of register/value pairs.

-- 
Regards,
Shawn
