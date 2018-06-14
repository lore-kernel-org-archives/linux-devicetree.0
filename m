From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 1/4] arm: dts: add support for Laird WB45N cpu module and
 DVK
Date: Thu, 14 Jun 2018 15:00:28 +0200
Message-ID: <20180614130028.GA16660@piout.net>
References: <1528966340-23216-1-git-send-email-ben.whitten@lairdtech.com>
 <03f0f635-3fc2-085b-20e0-e1fcaa9e8062@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <03f0f635-3fc2-085b-20e0-e1fcaa9e8062@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Ben Whitten <ben.whitten@gmail.com>, devicetree@vger.kernel.org, Ben Whitten <ben.whitten@lairdtech.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 14/06/2018 14:52:25+0200, Nicolas Ferre wrote:
> > +	gpio_keys {
> > +		compatible = "gpio-keys";
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +		irqbtn@pb18 {
> 
> I'm not sure that the @pb18 can be used like this. This address extension
> must be used in a "reg" property in the node. dtc used with warning switch
> on might trigger an error for this.
> 

Indeed, no unit-address without a reg property.


-- 
Alexandre Belloni, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
