From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH v5 2/2] usb: chipidea: imx: Add binding to disable USB
 60Mhz clock
Date: Mon, 26 Sep 2016 10:18:41 +0200
Message-ID: <20160926081841.7jmvdto2ht23rdw6@pengutronix.de>
References: <1474448827-8354-1-git-send-email-fabien.lahoudere@collabora.co.uk>
 <1474448827-8354-3-git-send-email-fabien.lahoudere@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1474448827-8354-3-git-send-email-fabien.lahoudere@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
Cc: Peter.Chen@nxp.com, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 21, 2016 at 11:07:07AM +0200, Fabien Lahoudere wrote:
> This binding allow to disable the internal 60Mhz clock for USB host2 or
> host3.
> 
> Signed-off-by: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
> ---
>  Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt |  1 +
>  drivers/usb/chipidea/ci_hdrc_imx.c                     |  2 ++
>  drivers/usb/chipidea/ci_hdrc_imx.h                     |  1 +
>  drivers/usb/chipidea/usbmisc_imx.c                     | 13 +++++++++++++
>  4 files changed, 17 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
> index 0e03344..f83da66 100644
> --- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
> +++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
> @@ -84,6 +84,7 @@ i.mx specific properties
>  - over-current-active-high: over current signal polarity is high active,
>    typically over current signal polarity is low active.
>  - external-vbus-divider: enables off-chip resistor divider for Vbus
> +- disable-int60ck: disable internal 60MHz clock for usb host2 or host3 on imx53

Why do we need a binding for this? I would assume the driver should know
whether this clock is in use or not. If it doesn't that's a problem we
should solve.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
