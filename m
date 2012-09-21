From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [RFC PATCH 1/3] amba-clcd: Add Device Tree support to amba-clcd
 driver
Date: Fri, 21 Sep 2012 13:43:45 +0200
Message-ID: <20120921114345.GE24458@pengutronix.de>
References: <1348070666-9153-1-git-send-email-ryan.harkin@linaro.org>
 <1348070666-9153-2-git-send-email-ryan.harkin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1348070666-9153-2-git-send-email-ryan.harkin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
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
To: Ryan Harkin <ryan.harkin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org, tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org, liviu.dudau-5wv7dgnIgG8@public.gmane.org, shiraz.hashim-qxv4g6HH51o@public.gmane.org, viresh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, arnd.bergmann-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 19, 2012 at 05:04:24PM +0100, Ryan Harkin wrote:
> Add support to parse the display configuration from device tree.
> 
> If the board does not provide platform specific functions in the struct
> clcd_board contained with the amba device info, then defaults are provided
> by the driver.
> 
> The device tree configuration can either ask for a DMA setup or provide a
> framebuffer address to be remapped into the driver.
> 
> Signed-off-by: Ryan Harkin <ryan.harkin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---

[...]

> +
> +struct clcd_panel *getPanel(struct device_node *node)
> +{
> +	static struct clcd_panel panel;
> +
> +	panel.mode.refresh      = get_val(node, "refresh");
> +	panel.mode.xres         = get_val(node, "xres");
> +	panel.mode.yres         = get_val(node, "yres");
> +	panel.mode.pixclock     = get_val(node, "pixclock");
> +	panel.mode.left_margin  = get_val(node, "left_margin");
> +	panel.mode.right_margin = get_val(node, "right_margin");
> +	panel.mode.upper_margin = get_val(node, "upper_margin");
> +	panel.mode.lower_margin = get_val(node, "lower_margin");
> +	panel.mode.hsync_len    = get_val(node, "hsync_len");
> +	panel.mode.vsync_len    = get_val(node, "vsync_len");
> +	panel.mode.sync         = get_val(node, "sync");

We are currently discussing a common panel description for the
devicetree. You are invited to join in here:

http://comments.gmane.org/gmane.linux.drivers.devicetree/21386

We shouldn't add any more device specific panel descriptions.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
