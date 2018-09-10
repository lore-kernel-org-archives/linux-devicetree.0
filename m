From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Subject: RE: [PATCH 0/3] *** SUBJECT HERE ***
Date: Mon, 10 Sep 2018 12:21:14 +0000
Message-ID: <2E89032DDAA8B9408CB92943514A0337019831680C@SW-EX-MBX01.diasemi.com>
References: <cover.1536580772.git.Adam.Thomson.Opensource@diasemi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1536580772.git.Adam.Thomson.Opensource@diasemi.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Hans de Goede <hdegoede@redhat.com>, Li Jun <jun.li@nxp.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Support Opensource <Support.Opensource@diasemi.com>
List-Id: devicetree@vger.kernel.org

On 10 September 2018 13:19, Adam Thomson wrote:

> This patch set adds DT bindings support for PPS APDOs, and updates the FUSB302
> to use the generic connector bindings allowing for PPS support in this Type-C
> port controller. Existing FUSB302 device specific bindings still work, but
> are now deprecated in favour of the generic connector approach.

Please ignore as suffering finger trouble. Will resend with patches corrected.

> 
> Changes in v2:
> 	- Added Reviewed-by tags to patches
> 	- Rebase code against latest usb-next branch (v4.19-rc2)
> 
> Adam Thomson (3):
>   dt-bindings: connector: Add support for USB-PD PPS APDOs to bindings
>   dt-bindings: usb: fusb302: Use usb-connector bindings for
>     configuration
>   usb: typec: fusb302: Populate tcpc fwnode for TCPM property handling
> 
>  .../bindings/connector/usb-connector.txt           |  8 +++---
>  .../devicetree/bindings/usb/fcs,fusb302.txt        | 32 +++++++++++++++++-----
>  drivers/usb/typec/fusb302/fusb302.c                |  3 ++
>  include/dt-bindings/usb/pd.h                       | 26 ++++++++++++++++++
>  4 files changed, 58 insertions(+), 11 deletions(-)
> 
> --
> 1.9.1
