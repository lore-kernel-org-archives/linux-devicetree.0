Return-Path: <SRS0=Yfpp=IP=linux.intel.com=heikki.krogerus@kernel.org>
Date: Mon, 28 May 2018 16:04:39 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH v5] usb: gadget: udc: renesas_usb3: Add register of usb
 role switch
Message-ID: <20180528130439.GD29600@kuha.fi.intel.com>
References: <1527232376-5613-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1527232376-5613-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com, hdegoede@redhat.com, andy.shevchenko@gmail.com, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Fri, May 25, 2018 at 04:12:56PM +0900, Yoshihiro Shimoda wrote:
> @@ -2573,6 +2635,12 @@ static void renesas_usb3_init_ram(struct renesas_usb3 *usb3, struct device *dev,
>  	EXTCON_NONE,
>  };
>  
> +static struct usb_role_switch_desc renesas_usb3_role_switch_desc = {

You can constify that.

> +	.set = renesas_usb3_role_switch_set,
> +	.get = renesas_usb3_role_switch_get,
> +	.allow_userspace_control = true,
> +};
> +
>  static int renesas_usb3_probe(struct platform_device *pdev)
>  {
>  	struct renesas_usb3 *usb3;

Thanks,

-- 
heikki
