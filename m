From: Rob Herring <robh@kernel.org>
Subject: Re: [v2 1/1] usb:host:xhci support option to disable xHCI 1.0 USB2
 HW LPM
Date: Tue, 30 May 2017 17:32:25 -0500
Message-ID: <20170530223225.n6ikci5o3nz7xstj@rob-hp-laptop>
References: <1495265096-14851-1-git-send-email-tqnguyen@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1495265096-14851-1-git-send-email-tqnguyen@apm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Thang Q. Nguyen" <tqnguyen@apm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <felipe.balbi@linux.intel.com>, Mark Rutland <mark.rutland@arm.com>, Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Phong Vo <pvo@apm.com>, Loc Ho <lho@apm.com>, Duc Tran <dxtran@apm.com>, Quang Han <qhan@apm.com>, Tung Nguyen <tunguyen@apm.com>, patches@apm.com
List-Id: devicetree@vger.kernel.org

On Sat, May 20, 2017 at 02:24:56PM +0700, Thang Q. Nguyen wrote:
> XHCI specification 1.1 does not require xHCI 1.0 compliant controllers
> to always enable hardware USB2 LPM.
> However, the current xHCI driver always enable it by setting HLE=1 when
> seeing HLC=1. This makes certain xHCI controllers that have broken USB2
> HW LPM fail to work as there is no way to disable this feature.
> This patch adds support to control disabling USB2 Hardware LPM via
> DT/ACPI attribute.
> 
> Signed-off-by: Tung Nguyen <tunguyen@apm.com>
> Signed-off-by: Thang Q. Nguyen <tqnguyen@apm.com>
> ---
> Changes since v1:
>  - Update DT/ACPI attribute and corresponding codes from HLE to LPM to
>   be consistent with other attribute names.
> ---
>  Documentation/devicetree/bindings/usb/usb-xhci.txt |    1 +

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/usb/host/xhci-plat.c                       |    3 +++
>  drivers/usb/host/xhci.c                            |    7 ++++++-
>  drivers/usb/host/xhci.h                            |    1 +
>  4 files changed, 11 insertions(+), 1 deletions(-)
