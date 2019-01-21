From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 4/6] dt-binding: pcf85063: add xtal load capacitance
Date: Mon, 21 Jan 2019 09:25:13 -0600
Message-ID: <20190121152513.GA29037@bogus>
References: <20190119090031.29147-1-sam@ravnborg.org>
 <20190119090031.29147-5-sam@ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190119090031.29147-5-sam@ravnborg.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Alessandro Zummo <a.zummo@towertech.it>, Andrew Jeffery <andrew@aj.id.au>, Fabio Estevam <fabio.estevam@nxp.com>, Joel Stanley <joel@jms.id.au>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, =?iso-8859-1?Q?S=F8ren?= Andersen <san@skov.dk>
List-Id: devicetree@vger.kernel.org

On Sat, 19 Jan 2019 10:00:29 +0100, Sam Ravnborg wrote:
> The NXP pcf85063 supports two different xtal load capacitance
> - 7000fF  (7pF)    HW default, Linux driver default
> - 12500fF (12.5pF) Minimum power consumption
> 
> To obtain a precise RTC the pcf85063 must be configured
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
> Cc: Urs Fässler <urs.fassler@bbv.ch>
> ---
>  Documentation/devicetree/bindings/rtc/nxp,pcf85063.txt | 18 ++++++++++++++++++
>  Documentation/devicetree/bindings/rtc/rtc.txt          |  1 -
>  2 files changed, 18 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/rtc/nxp,pcf85063.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
