From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 2/6] dt-bindings: rtc: Add quartz-load-femtofarads
 property
Date: Mon, 21 Jan 2019 09:24:34 -0600
Message-ID: <20190121152434.GA27828@bogus>
References: <20190119090031.29147-1-sam@ravnborg.org>
 <20190119090031.29147-3-sam@ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190119090031.29147-3-sam@ravnborg.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Alessandro Zummo <a.zummo@towertech.it>, Andrew Jeffery <andrew@aj.id.au>, Fabio Estevam <fabio.estevam@nxp.com>, Joel Stanley <joel@jms.id.au>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
List-Id: devicetree@vger.kernel.org

On Sat, 19 Jan 2019 10:00:27 +0100, Sam Ravnborg wrote:
> The quartz-load-femtofarads are relevant for
> several users. Add it as a common property in rtc.
> Note that valid values and default values must be documented.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Suggested-by: Rob Herring <robh+dt@kernel.org>
> Cc: Alessandro Zummo <a.zummo@towertech.it>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> ---
>  Documentation/devicetree/bindings/rtc/rtc.txt | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
