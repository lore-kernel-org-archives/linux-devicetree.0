From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] iio: health: max30100: add config for LED current
Date: Thu, 31 Dec 2015 16:17:31 -0600
Message-ID: <20151231221731.GA4445@rob-hp-laptop>
References: <1451454288-9945-1-git-send-email-mranostay@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1451454288-9945-1-git-send-email-mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 29, 2015 at 09:44:48PM -0800, Matt Ranostay wrote:
> Allow the current for both RED and IR LEDs to be set via an device tree
> property setting.
> 
> This is an optional setting that is useful for applications that have a
> known glass attenuation factor.
> 
> Signed-off-by: Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> Changes from v2:
> * change to use microamp property name from LED class
> * updated documentation for new format
> * added allowed current index map
> 
> .../devicetree/bindings/iio/health/max30100.txt    |  8 +++
>  drivers/iio/health/max30100.c                      | 81 ++++++++++++++++++++--
>  2 files changed, 83 insertions(+), 6 deletions(-)

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
