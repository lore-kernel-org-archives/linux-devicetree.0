From: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v2] mtd: dataflash: add device tree probe support
Date: Wed, 20 Jul 2011 13:28:24 +0800
Message-ID: <20110720052824.GB5766@S2100-06.ap.freescale.net>
References: <1310283313-32087-1-git-send-email-shawn.guo@linaro.org>
	<1310658757-17018-1-git-send-email-shawn.guo@linaro.org>
	<20110715025407.GF2927@ponder.secretlab.ca>
	<20110715044919.GB1840@S2100-06.ap.freescale.net>
	<1311136844.20738.131.camel@sauron>
	<20110720045547.GA5766@S2100-06.ap.freescale.net>
	<1311139071.20738.147.camel@sauron>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1311139071.20738.147.camel@sauron>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Artem Bityutskiy <dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 20, 2011 at 08:17:45AM +0300, Artem Bityutskiy wrote:
> On Wed, 2011-07-20 at 12:55 +0800, Shawn Guo wrote:
> > On Wed, Jul 20, 2011 at 07:40:38AM +0300, Artem Bityutskiy wrote:
> > > On Fri, 2011-07-15 at 12:49 +0800, Shawn Guo wrote:
> > > > > > +static const struct of_device_id dataflash_dt_ids[] = {
> > > > > > +	{ .compatible = "atmel,at45xxx", },
> > > > > > +	{ .compatible = "atmel,dataflash", },
> > > > > > +	{ /* sentinel */ }
> > > > > > +};
> > > > > > +
> > > > > 
> > > > > This should be protected with a #ifdef CONFIG_OF/#else/#endif, and
> > > > > there should be a MODULE_DEVICE_TABLE().
> > > > > 
> > > > I personally hate #ifdef stuff.  But okay, I can do it since there
> > > > are people being concerned by this little waste of space.
> > > 
> > > I guess the question is - will it compile and work if CONFIG_OF is
> > > unset?
> > > 
> > Yes, it will compile, as 'struct of_device_id' is defined in
> > include/linux/mod_devicetable.h unconditionally.
> 
> And it will work correctly even though dataflash_dt_ids is not NULL, it
> will not confuse MTD layer?
> 
I think for non-dt case, dataflash_dt_ids is not used anyway.  So yes,
it will not confuse MTD layer, at least from my testing.

-- 
Regards,
Shawn
