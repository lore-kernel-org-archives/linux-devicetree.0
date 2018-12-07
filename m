Return-Path: <robherring2@gmail.com>
Date: Fri, 7 Dec 2018 17:19:18 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 2/5] dt-bindings: rtc: pcf85363: Document pcf85263
 real-time clock
Message-ID: <20181207231918.GA18691@bogus>
References: <1544182066-31528-1-git-send-email-biju.das@bp.renesas.com>
 <1544182066-31528-3-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1544182066-31528-3-git-send-email-biju.das@bp.renesas.com>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Mark Rutland <mark.rutland@arm.com>, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Chris Paterson <Chris.Paterson2@renesas.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Fri,  7 Dec 2018 11:27:43 +0000, Biju Das wrote:
> The pcf85263 RTC is compatible with the pcf85363 RTC.
> 
> The difference between the pcf85263 and pcf85363 RTC is that the latter has
> 64 bytes more RAM. This renders them incompatible from a DT point of view.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> V1-->V2
> 	* Incorporated Simon's review comment.
> V2-->V3
> 	* No Change.
> V3-->V4
> 	* No Change.
> ---
>  Documentation/devicetree/bindings/rtc/pcf85363.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
