From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/1] usb:host:xhci support option to disable the xHCI
 USB2 HW LPM
Date: Fri, 14 Jul 2017 09:34:50 -0500
Message-ID: <20170714143449.hr3eajqywafl4v3r@rob-hp-laptop>
References: <1499846808-25981-1-git-send-email-tqnguyen@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1499846808-25981-1-git-send-email-tqnguyen@apm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Thang Q. Nguyen" <tqnguyen@apm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Phong Vo <pvo@apm.com>, Loc Ho <lho@apm.com>, Tung Nguyen <tunguyen@apm.com>, patches@apm.com
List-Id: devicetree@vger.kernel.org

On Wed, Jul 12, 2017 at 03:06:48PM +0700, Thang Q. Nguyen wrote:
> XHCI specification 1.1 does not require xHCI-compliant controllers
> to always enable hardware USB2 LPM. However, the current xHCI
> driver always enable it when seeing HLC=1.
> This patch supports an option for users to control disabling
> USB2 Hardware LPM via DT/ACPI attribute.
> This option is needed in case user would like to disable this
> feature. For example, their xHCI controller has its USB2 HW LPM
> broken.
> 
> Signed-off-by: Tung Nguyen <tunguyen@apm.com>
> Signed-off-by: Thang Q. Nguyen <tqnguyen@apm.com>
> ---
> Changes since v3:
>  - Bypass updating LPM parameters when HW LPM is optionally disabled.
> Changes since v2:
>  - Change code to disable HW LPM as an option for user which
>    is set via ACPI/DT.
> Changes since v1:
>  - Update DT/ACPI attribute and corresponding codes from HLE to LPM to
>    be consistent with other attribute names.
> ---
>  Documentation/devicetree/bindings/usb/usb-xhci.txt |    1 +

I acked v3. Please add acks when posting new versions.

>  drivers/usb/host/xhci-plat.c                       |    3 +++
>  drivers/usb/host/xhci.c                            |    6 ++++++
>  drivers/usb/host/xhci.h                            |    1 +
>  4 files changed, 11 insertions(+), 0 deletions(-)
