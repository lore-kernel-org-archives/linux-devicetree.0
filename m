From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/5] devicetree: property-units: Add femtofarads unit
Date: Tue, 15 Jan 2019 15:04:11 -0600
Message-ID: <20190115210411.GA20241@bogus>
References: <20190108185414.26922-1-sam@ravnborg.org>
 <20190108185414.26922-2-sam@ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190108185414.26922-2-sam@ravnborg.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Andrew Jeffery <andrew@aj.id.au>, Fabio Estevam <fabio.estevam@nxp.com>, Joel Stanley <joel@jms.id.au>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
List-Id: devicetree@vger.kernel.org

On Tue,  8 Jan 2019 19:54:10 +0100, Sam Ravnborg wrote:
> When dealing with capacitance of 0.5 pF then
> a smaller unit is preferred.
> Add femtofarads to deal with this.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Alessandro Zummo <a.zummo@towertech.it>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---
>  Documentation/devicetree/bindings/property-units.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
