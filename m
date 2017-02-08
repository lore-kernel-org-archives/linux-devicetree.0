From: Richard Leitner <richard.leitner@skidata.com>
Subject: Re: [PATCH v4] usb: misc: add USB251xB/xBi Hi-Speed Hub Controller
 Driver
Date: Wed, 8 Feb 2017 09:58:48 +0100
Message-ID: <ade53079-b4ac-5290-6d05-0d71ddc62ad0@skidata.com>
References: <1486543976-28006-1-git-send-email-richard.leitner@skidata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1486543976-28006-1-git-send-email-richard.leitner@skidata.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com, andriy.shevchenko@linux.intel.com, stern@rowland.harvard.edu, dev@g0hl1n.net
List-Id: devicetree@vger.kernel.org

On 02/08/2017 09:52 AM, Richard Leitner wrote:
> From: Richard Leitner <dev@g0hl1n.net>

Please drop/ignore that "From". This patch is from:
	Richard Leitner <richard.leitner@skidata.com>

> 
> This patch adds a driver for configuration of the Microchip USB251xB/xBi
> USB 2.0 hub controller series with USB 2.0 upstream connectivity, SMBus
> configuration interface and two to four USB 2.0 downstream ports.
> 
> Furthermore add myself as a maintainer for this driver.
> 
> The datasheet can be found at the manufacturers website, see [1]. All
> device-tree exposed configuration features have been tested on a i.MX6
> platform with a USB2512B hub.
> 
> [1] http://ww1.microchip.com/downloads/en/DeviceDoc/00001692C.pdf
> 
> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> ---
> CHANGES v4:
> 	- use utf8s_to_utf16s() instead of ascii2utf16le()
> 	- remove ascii2utf16le() in lib/string.c again
> 	- remove changes in drivers/usb/core/hcd.c again
> 	  (I will post a separate patch for using utf8s_to_utf16s()
> 	  in there too)
> 
> CHANGES v3:
> 	- move ascii2utf16le() to lib/string.c and also use it also for
> 		ascii2desc in drivers/usb/core/hcd.c
> 	- remove platform data support from usb251xb driver
> 
> CHANGES v2:
> 	- fix max-{b,s}p-current property name
> 	- add descriptor string handling from platform_data
> 	- fix non-dt handling
> ---
>  Documentation/devicetree/bindings/usb/usb251xb.txt |  83 +++
>  MAINTAINERS                                        |   8 +
>  drivers/usb/misc/Kconfig                           |   9 +
>  drivers/usb/misc/Makefile                          |   1 +
>  drivers/usb/misc/usb251xb.c                        | 674 +++++++++++++++++++++
>  5 files changed, 775 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/usb251xb.txt
>  create mode 100644 drivers/usb/misc/usb251xb.c
