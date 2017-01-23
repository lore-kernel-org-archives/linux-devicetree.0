From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] iio:temperature:Add irq and threshold events support for
 TI TMP007 sensor
Date: Mon, 23 Jan 2017 11:10:08 -0600
Message-ID: <20170123171008.s3hkvmxhro4qycia@rob-hp-laptop>
References: <20170121150147.GA7781@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170121150147.GA7781-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Manivannan Sadhasivam <manivannanece23-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Jan 21, 2017 at 08:31:47PM +0530, Manivannan Sadhasivam wrote:
> This patch adds support for ALERT irq and limit threshold events for TI TMP007 - 16 bit IR thermopile sensor
> with integrated math engine.
> 
> Following threshold events are supported:
> 1. TObj high limit
> 2. TObj low limit
> 3. TDie high limit
> 4. TDie low limit
> 
> Signed-off-by: Manivannan Sadhasivam <manivannanece23-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  .../devicetree/bindings/iio/temperature/tmp007.txt |   8 +

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

>  drivers/iio/temperature/tmp007.c                   | 334 ++++++++++++++++++---
>  2 files changed, 304 insertions(+), 38 deletions(-)
