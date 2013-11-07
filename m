From: "Mark A. Greer" <mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
Subject: Re: crypto: omap-sham - Add code to use dmaengine API
Date: Wed, 6 Nov 2013 17:38:09 -0700
Message-ID: <20131107003809.GA8705@animalcreek.com>
References: <20131106161720.GL15603@elgon.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131106161720.GL15603-mgFCXtclrQlZLf2FXnZxJA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 06, 2013 at 07:17:20PM +0300, Dan Carpenter wrote:
> Hello Mark A. Greer,
> 
> This is a semi-automatic email about new static checker warnings.
> 
> The patch dfd061d5a8f5: "crypto: omap-sham - Add code to use 
> dmaengine API" from Dec 21, 2012, leads to the following Smatch 
> complaint:
> 
> drivers/crypto/omap-sham.c:1973 omap_sham_probe()
> 	 error: we previously assumed 'dd->dma_lch' could be null (see line 1934)

Thank you, Dan.

Will fix shortly.

Mark
--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
