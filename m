From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] iio: proximity: as3935: add missing required
 spi-max-frequency
Date: Mon, 22 May 2017 19:31:42 -0500
Message-ID: <20170523003142.spslp7wtnmcoex2o@rob-hp-laptop>
References: <20170517020310.21355-1-matt.ranostay@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170517020310.21355-1-matt.ranostay-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matt Ranostay <matt.ranostay-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, May 16, 2017 at 07:03:10PM -0700, Matt Ranostay wrote:
> spi-max-frequency is required to be set for the as3935 part, and
> document such usage.
> 
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Matt Ranostay <matt.ranostay-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/iio/proximity/as3935.txt | 2 ++
>  1 file changed, 2 insertions(+)

Applied, thanks.

Rob
