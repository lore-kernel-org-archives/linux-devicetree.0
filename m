From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH] net: phy: micrel: workaround for errata #2 for KSZ9031
Date: Mon, 14 May 2018 12:42:58 +0300
Message-ID: <e7952210-b57a-a6d0-afaf-b4a3f95e0f2e@cogentembedded.com>
References: <20180514082218.29158-1-m.felsch@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180514082218.29158-1-m.felsch@pengutronix.de>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Marco Felsch <m.felsch@pengutronix.de>, robh+dt@kernel.org, mark.rutland@arm.com, andrew@lunn.ch, f.fainelli@gmail.com
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, Markus Niebel <Markus.Niebel@tqs.de>
List-Id: devicetree@vger.kernel.org

On 5/14/2018 11:22 AM, Marco Felsch wrote:

> From: Markus Niebel <Markus.Niebel@tqs.de>
> 
> handle errata #2 for KSZ9031: force 1000Base-T master
> 
> Attention: enabling the workaround will cause no link to
> other GIGE master.
> 
> Signed-off-by: Markus Niebel <Markus.Niebel@tqs.de>
> [m.felsch@pengutronix.de: move dt binding to the KSZ9031 entry]
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>   .../devicetree/bindings/net/micrel-ksz90x1.txt |  3 +++
>   drivers/net/phy/micrel.c                       | 18 ++++++++++++++++++
>   2 files changed, 21 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/micrel-ksz90x1.txt b/Documentation/devicetree/bindings/net/micrel-ksz90x1.txt
> index 42a248301615..e2465fbbbcef 100644
> --- a/Documentation/devicetree/bindings/net/micrel-ksz90x1.txt
> +++ b/Documentation/devicetree/bindings/net/micrel-ksz90x1.txt
> @@ -57,6 +57,9 @@ KSZ9031:
>         - txd2-skew-ps : Skew control of TX data 2 pad
>         - txd3-skew-ps : Skew control of TX data 3 pad
>   
> +    - force-master: Boolean, force phy to master mode. This is a

    Not "micrel,force-master"?

> +                    workaround at least for KSZ9031 errata #2.
> +
>   Examples:
>   
>   	mdio {
[...]

MBR, Sergei
