From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4] extcon: gpio: Add the support for Device tree bindings
Date: Fri, 27 May 2016 10:29:34 -0500
Message-ID: <20160527152934.GB12024@rob-hp-laptop>
References: <1464263265-20187-1-git-send-email-vreddytalla@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1464263265-20187-1-git-send-email-vreddytalla@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Venkat Reddy Talla <vreddytalla@nvidia.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: devicetree@vger.kernel.org

On Thu, May 26, 2016 at 05:17:45PM +0530, Venkat Reddy Talla wrote:
> Add the support for Device tree bindings of extcon-gpio driver.
> The extcon-gpio device tree node must include the both 'extcon-id' and
> 'gpios' property.

I think extcon bindings are a mess in general...

> For example:
> 	usb_cable: extcon-gpio-0 {
> 		compatible = "extcon-gpio";
> 		extcon-id = <EXTCON_USB>;
> 		gpios = <&gpio6 1 GPIO_ACTIVE_HIGH>;
> 	}
> 	ta_cable: extcon-gpio-1 {
> 		compatible = "extcon-gpio";
> 		extcon-id = <EXTCON_CHG_USB_DCP>;
> 		gpios = <&gpio3 2 GPIO_ACTIVE_LOW>;
> 		debounce-ms = <50>;	/* 50 millisecond */
> 		wakeup-source;
> 	}

This is all 1 logical connector, the USB connector. Why are you 
describing cables? Those are not part of the h/w and are dynamic. 
Describe this as a connector which is one thing (i.e. node). Use a 
compatible string that reflects the type of connector 
(usb-microab-connector), not the driver you want to use. Then define 
GPIO lines needed to provide state information like VBus, ID, charger 
modes and control lines like soft connect (D+ pullup enable), VBus 
enable, etc.

> 	&dwc3_usb {
> 		extcon = <&usb_cable>;
> 	};
> 	&charger {
> 		extcon = <&ta_cable>;
> 	};

Rob
