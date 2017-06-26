From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 1/1] usb:host:xhci support option to disable the xHCI
 USB2 HW LPM
Date: Mon, 26 Jun 2017 14:03:08 -0500
Message-ID: <20170626190308.7usyayemlgekpe2s@rob-hp-laptop>
References: <1498186932-29277-1-git-send-email-tqnguyen@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1498186932-29277-1-git-send-email-tqnguyen-qTEPVZfXA3Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Thang Q. Nguyen" <tqnguyen-qTEPVZfXA3Y@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Phong Vo <pvo-qTEPVZfXA3Y@public.gmane.org>, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>, Tung Nguyen <tunguyen-qTEPVZfXA3Y@public.gmane.org>, patches-qTEPVZfXA3Y@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jun 23, 2017 at 10:02:12AM +0700, Thang Q. Nguyen wrote:
> XHCI specification 1.1 does not require xHCI-compliant controllers
> to always enable hardware USB2 LPM. However, the current xHCI
> driver always enable it when seeing HLC=1.
> This patch supports an option for users to control disabling
> USB2 Hardware LPM via DT/ACPI attribute.
> This option is needed in case user would like to disable this
> feature. For example, their xHCI controller has its USB2 HW LPM
> broken.
> 
> Signed-off-by: Tung Nguyen <tunguyen-qTEPVZfXA3Y@public.gmane.org>
> Signed-off-by: Thang Q. Nguyen <tqnguyen-qTEPVZfXA3Y@public.gmane.org>
> ---
> Changes since v2:
>  - Change code to disable HW LPM as an option for user which
>    is set via ACPI/DT.
> Changes since v1:
>  - Update DT/ACPI attribute and corresponding codes from HLE to LPM to
>    be consistent with other attribute names.
> ---
>  Documentation/devicetree/bindings/usb/usb-xhci.txt |    1 +
>  drivers/usb/host/xhci-plat.c                       |    3 +++
>  drivers/usb/host/xhci.c                            |    3 +++
>  drivers/usb/host/xhci.h                            |    1 +
>  4 files changed, 8 insertions(+), 0 deletions(-)

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
