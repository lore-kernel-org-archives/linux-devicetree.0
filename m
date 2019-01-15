From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/5] dt-binding: pcf8523: add xtal load capacitance
Date: Tue, 15 Jan 2019 15:06:57 -0600
Message-ID: <20190115210657.GA24662@bogus>
References: <20190108185414.26922-1-sam@ravnborg.org>
 <20190108185414.26922-3-sam@ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190108185414.26922-3-sam@ravnborg.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Andrew Jeffery <andrew@aj.id.au>, Fabio Estevam <fabio.estevam@nxp.com>, Joel Stanley <joel@jms.id.au>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, =?iso-8859-1?Q?S=F8ren?= Andersen <san@skov.dk>
List-Id: devicetree@vger.kernel.org

On Tue,  8 Jan 2019 19:54:11 +0100, Sam Ravnborg wrote:
> The NXP pcf8523 supports two different xtal load capacitance
> - 7000fF  (7pF)    HW default
> - 12500fF (12.5pF) Minimum power consumption, driver default
> 
> To obtain a precise RTC the pcf8523 must be configured
> with the correct capacitance load of the xtal.
> 
> Add a property to specify the xtal capacitance load.
> The default value matches that of the current Linux driver.
> 
> With a dedicated binding remove the entry in rtc.txt
> 
> Signed-off-by: Søren Andersen <san@skov.dk>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Alessandro Zummo <a.zummo@towertech.it>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> ---
>  Documentation/devicetree/bindings/rtc/nxp,pcf8523.txt | 18 ++++++++++++++++++
>  Documentation/devicetree/bindings/rtc/rtc.txt         |  1 -
>  2 files changed, 18 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/rtc/nxp,pcf8523.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
