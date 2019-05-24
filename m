From: Eduardo Valentin <edubezval@gmail.com>
Subject: Re: [PATCH] dt-bindings: thermal: Make cooling-maps property optional
Date: Thu, 23 May 2019 19:50:18 -0700
Message-ID: <20190524025017.GA4146@localhost.localdomain>
References: <20190515093647.47656-1-andy.tang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190515093647.47656-1-andy.tang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yuantian Tang <andy.tang@nxp.com>
Cc: rui.zhang@intel.com, robh+dt@kernel.org, daniel.lezcano@linaro.org, mark.rutland@arm.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, May 15, 2019 at 05:36:47PM +0800, Yuantian Tang wrote:
> There may be no cooling device on system, or there are no enough
> cooling devices for each thermal zone in multiple thermal zone
> cases since cooling devices can't be shared.
> So make this property optional to remove such limitations.

Yeah, I am  not sure that is enough reason to make this property
optional. Let me maybe ask you why do you care creating a thermal
zone if your control has no actions? Or rather, why bothering
setting up a control that has no actuators?

> 
> Signed-off-by: Yuantian Tang <andy.tang@nxp.com>
> ---
>  .../devicetree/bindings/thermal/thermal.txt        |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/thermal.txt b/Documentation/devicetree/bindings/thermal/thermal.txt
> index ca14ba9..694e834 100644
> --- a/Documentation/devicetree/bindings/thermal/thermal.txt
> +++ b/Documentation/devicetree/bindings/thermal/thermal.txt
> @@ -142,11 +142,11 @@ Required properties:
>  - trips:		A sub-node which is a container of only trip point nodes
>    Type: sub-node	required to describe the thermal zone.
>  
> +
> +Optional property:
>  - cooling-maps:		A sub-node which is a container of only cooling device
>    Type: sub-node	map nodes, used to describe the relation between trips
>  			and cooling devices.
> -
> -Optional property:
>  - coefficients:		An array of integers (one signed cell) containing
>    Type: array		coefficients to compose a linear relation between
>    Elem size: one cell	the sensors listed in the thermal-sensors property.
> -- 
> 1.7.1
> 
