From: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH 1/1] staging: pi433: fix problem with division in
 rf69_set_deviation
Date: Fri, 28 Jul 2017 17:01:18 -0700
Message-ID: <20170729000118.GA28861@kroah.com>
References: <39f4e59cae6d241235f8f2cc6eebb33c-EhVcX1pHQwdXWkQFBhENSgEKLlwACzJXX19HAVhEWENbS1kLMF52CEtUX1pBSEwcXlJRL1lQWAheVn4GUFc=-webmailer1@server05.webmailer.hosteurope.de>
 <201707172156.DCyTyWc2%fengguang.wu@intel.com>
 <652336354.3806.1500549785404@ox.hosteurope.de>
 <20170720113705.d65hxm3jbki2ynqd@mwanda>
 <CAMuHMdVgw=V6f8wzcXvS3gk8GK0bOpdgs_jxL6Y_X9idJD_x3Q@mail.gmail.com>
 <255867683.7064.1500566196444@ox.hosteurope.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <255867683.7064.1500566196444-mPx3TeDXVI9fnkZfMEZNjw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marcus Wolf <marcus.wolf-hymvNObv7Fheq5RAq1AYSxS11BummzK+@public.gmane.org>
Cc: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, driverdevel <devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "kbuild-all-JC7UmRfGjtg@public.gmane.org" <kbuild-all-JC7UmRfGjtg@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 20, 2017 at 05:56:36PM +0200, Marcus Wolf wrote:
> Fixes problem with division in rf69_set_deviation
> 
> Fixes: 874bcba65f9a ("staging: pi433: New driver")
> Signed-off-by: Marcus Wolf <linux-hymvNObv7Fheq5RAq1AYSxS11BummzK+@public.gmane.org>
> 
> diff --git a/drivers/staging/pi433/rf69.c b/drivers/staging/pi433/rf69.c
> --- a/drivers/staging/pi433/rf69.c
> +++ b/drivers/staging/pi433/rf69.c
> @@ -221,7 +221,7 @@ int rf69_set_frequency(struct spi_device *spi, u32
> frequency)

Patch is line-wrapped and does not apply :(
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
