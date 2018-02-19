Return-Path: <robherring2@gmail.com>
Date: Sun, 18 Feb 2018 18:04:21 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [RFC 2/3] usb: chipidea: Hook into mux framework to toggle usb
 switch
Message-ID: <20180219000421.gzlpomgkfbwumlki@rob-hp-laptop>
References: <1518351341-6740-1-git-send-email-yossim@codeaurora.org>
 <1518351341-6740-2-git-send-email-yossim@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1518351341-6740-2-git-send-email-yossim@codeaurora.org>
To: Yossi Mansharoff <yossim@codeaurora.org>
Cc: rfried@codeaurora.org, Peter Rosin <peda@axentia.se>, Peter Chen <peter.chen@nxp.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, Stephen Boyd <stephen.boyd@linaro.org>
List-ID: <devicetree@vger.kernel.org>

On Sun, Feb 11, 2018 at 02:15:40PM +0200, Yossi Mansharoff wrote:
> On the db410c 96boards platform we have a TC7USB40MU on the board
> to mux the D+/D- lines coming from the controller between a micro
> usb "device" port and a USB hub for "host" roles[1]. During a
> role switch, we need to toggle this mux to forward the D+/D-
> lines to either the port or the hub. Add the necessary code to do
> the role switch in chipidea core via the generic mux framework.
> Board configurations like on db410c are expected to change roles
> via the sysfs API described in
> Documentation/ABI/testing/sysfs-platform-chipidea-usb2.
> 
> [1] https://github.com/96boards/documentation/raw/master/ConsumerEdition/DragonBoard-410c/HardwareDocs/Schematics_DragonBoard.pdf
> 
> Cc: Peter Rosin <peda@axentia.se>
> Cc: Peter Chen <peter.chen@nxp.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: <devicetree@vger.kernel.org>
> Signed-off-by: Stephen Boyd <stephen.boyd@linaro.org>
> 
> Signed-off-by: Yossi Mansharoff <yossim@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt |  6 ++++++
>  drivers/usb/chipidea/Kconfig                           |  2 ++
>  drivers/usb/chipidea/core.c                            |  6 ++++++
>  drivers/usb/chipidea/host.c                            |  7 +++++++
>  drivers/usb/chipidea/udc.c                             | 13 ++++++++++++-
>  include/linux/usb/chipidea.h                           |  2 ++
>  6 files changed, 35 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
> index 0e03344..2e93181 100644
> --- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
> +++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
> @@ -76,6 +76,10 @@ Optional properties:
>    needs to make sure it does not send more than 90%
>    maximum_periodic_data_per_frame. The use case is multiple transactions, but
>    less frame rate.
> +- mux-controls: The mux control for toggling host/device output of this
> +  controller. It's expected that a mux state of 0 indicates device mode and a
> +  mux state of 1 indicates host mode.
> +- mux-control-names: Shall be "usb_switch" if mux-controls is specified.

Kind of pointless to have -names when there is only one.

Otherwise, the binding looks okay to me.

>  
>  i.mx specific properties
>  - fsl,usbmisc: phandler of non-core register device, with one
> @@ -102,4 +106,6 @@ Example:
>  		rx-burst-size-dword = <0x10>;
>  		extcon = <0>, <&usb_id>;
>  		phy-clkgate-delay-us = <400>;
> +		mux-controls = <&usb_switch>;
> +		mux-control-names = "usb_switch";
>  	};
