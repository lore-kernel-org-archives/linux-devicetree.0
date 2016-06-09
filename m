From: Bin Liu <b-liu-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v3 1/4] USB: Fix of_usb_get_dr_mode_by_phy with a shared
 phy block
Date: Thu, 9 Jun 2016 09:30:04 -0500
Message-ID: <20160609143004.GA2167@uda0271908>
References: <1465138776-6003-1-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1465138776-6003-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Sun, Jun 05, 2016 at 04:59:33PM +0200, Hans de Goede wrote:
> Some SoCs have a single phy-hw-block with multiple phys, this is
> modelled by a single phy dts node, so we end up with multiple
> controller nodes with a phys property pointing to the phy-node
> of the otg-phy.
> 
> Only one of these controllers typically is an otg controller, yet we
> were checking the first controller who uses a phy from the block and
> then end up looking for a dr_mode property in e.g. the ehci controller.
> 
> This commit fixes this by adding an arg0 parameter to
> of_usb_get_dr_mode_by_phy and make of_usb_get_dr_mode_by_phy
> check that this matches the phandle args[0] value when looking for
> the otg controller.
> 
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
> Changes in v2:
> -Add a args0 parameter instead of looking for nodes with a dr_mode property
> Changes in v3:
> -No changes
> ---
>  drivers/usb/common/common.c  | 31 ++++++++++++++++++-------------
>  drivers/usb/phy/phy-am335x.c |  2 +-
>  include/linux/usb/of.h       |  4 ++--
>  3 files changed, 21 insertions(+), 16 deletions(-)

This breaks am335x.

[   17.433166] /ocp/usb@47400000/usb@47401000: could not get #phy-cells
for /ocp/usb@47400000/usb-phy@47401300
[   17.443627] /ocp/usb@47400000/usb@47401800: could not get #phy-cells
for /ocp/usb@47400000/usb-phy@47401b00
[   17.454005] am335x-phy-driver 47401300.usb-phy: dr_mode 0
[   17.460518] 47401300.usb-phy supply vcc not found, using dummy
regulator
[   17.469685] /ocp/usb@47400000/usb@47401000: could not get #phy-cells
for /ocp/usb@47400000/usb-phy@47401300
[   17.479998] /ocp/usb@47400000/usb@47401800: could not get #phy-cells
for /ocp/usb@47400000/usb-phy@47401b00
[   17.490342] am335x-phy-driver 47401b00.usb-phy: dr_mode 0

Regards,
-Bin.

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
