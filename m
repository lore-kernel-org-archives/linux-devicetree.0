From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: power: supply: add battery charge
 voltage/current
Date: Wed, 31 May 2017 13:50:15 -0500
Message-ID: <20170531185015.ahruipzepmusuk7r@rob-hp-laptop>
References: <20170526110413.24836-1-enric.balletbo@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170526110413.24836-1-enric.balletbo@collabora.com>
Sender: linux-pm-owner@vger.kernel.org
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: sre@kernel.org, mark.rutland@arm.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@networkimprov.net
List-Id: devicetree@vger.kernel.org

On Fri, May 26, 2017 at 01:04:10PM +0200, Enric Balletbo i Serra wrote:
> Add charging voltage and current characteristics to the battery DT for
> proper handling of the battery by fuel-gauge and charger chips.
> 
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
> Changes since v2:
>  - Requested by Sebastian Reichel
>    - Move to its own patch and apply to simple-battery framework.
> Changes since v1:
>  - Requested by Rob Herring
>    - Rename ti,charge-* to charge-* to be standard properties.
>    - Use unit suffixes as per bindings/property-units.txt
> 
>  Documentation/devicetree/bindings/power/supply/battery.txt | 4 ++++
>  1 file changed, 4 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
