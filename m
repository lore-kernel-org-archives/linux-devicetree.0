From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 5/5] rtc: isl1219: add device tree docu
Date: Tue, 24 Jul 2018 17:25:01 -0600
Message-ID: <20180724232501.GA22127@rob-hp-laptop>
References: <20180724095437.6016-1-Denis.Osterland@diehl.com>
 <20180724095437.6016-6-Denis.Osterland@diehl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180724095437.6016-6-Denis.Osterland@diehl.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Denis OSTERLAND <denis.osterland@diehl.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, "m.grzeschik@pengutronix.de" <m.grzeschik@pengutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "a.zummo@towertech.it" <a.zummo@towertech.it>, "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 24, 2018 at 11:31:22AM +0000, Denis OSTERLAND wrote:
> From: Denis Osterland <Denis.Osterland@diehl.com>
> 
> The devicetree documentation for the ISL1219 device tree
> binding is added with an short example. It is not a trivial
> device, because it supports two interrupt sources.
> 
> Signed-off-by: Denis Osterland <Denis.Osterland@diehl.com>
> ---
>  .../devicetree/bindings/rtc/isil,isl1219.txt  | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/isil,isl1219.txt

Reviewed-by: Rob Herring <robh@kernel.org>
