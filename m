From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 6/9] NFC: trf7970a: Remove support for
 'vin-voltage-override' DT property
Date: Fri, 28 Apr 2017 15:23:38 -0500
Message-ID: <20170428202338.iosgu2o4yxg3foig@rob-hp-laptop>
References: <20170425224356.11498-1-mgreer@animalcreek.com>
 <20170425224356.11498-7-mgreer@animalcreek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170425224356.11498-7-mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Greer <mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 25, 2017 at 03:43:53PM -0700, Mark Greer wrote:
> The 'vin-voltage-override' DT property is used by the trf7970a
> driver to override the voltage presented to the driver by the
> regulator subsystem.  This is unnecessary as properly specifying
> the regulator chain via DT properties will accomplish the same
> thing.  Therefore, remove support for 'vin-voltage-override'.
> 
> Signed-off-by: Mark Greer <mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/net/nfc/trf7970a.txt |  2 --
>  drivers/nfc/trf7970a.c                                 | 11 +----------
>  2 files changed, 1 insertion(+), 12 deletions(-)

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
