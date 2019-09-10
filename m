From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 3/7] dt-bindings: mv88e6xxx: add ability to set default
 queue priorities per port
Date: Tue, 10 Sep 2019 09:42:24 -0700
Message-ID: <23101286-4da2-2a53-e7cd-71ead263bbaa@gmail.com>
References: <20190910154238.9155-1-bob.beckett@collabora.com>
 <20190910154238.9155-4-bob.beckett@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190910154238.9155-4-bob.beckett@collabora.com>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Robert Beckett <bob.beckett@collabora.com>, netdev@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Jiri Pirko <jiri@resnulli.us>, Ido Schimmel <idosch@mellanox.com>
List-Id: devicetree@vger.kernel.org

On 9/10/19 8:41 AM, Robert Beckett wrote:
> Document a new setting for Marvell switch chips to set the default queue
> priorities per port.
> 
> Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
> ---
>  Documentation/devicetree/bindings/net/dsa/marvell.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/marvell.txt b/Documentation/devicetree/bindings/net/dsa/marvell.txt
> index 6f9538974bb9..e097c3c52eac 100644
> --- a/Documentation/devicetree/bindings/net/dsa/marvell.txt
> +++ b/Documentation/devicetree/bindings/net/dsa/marvell.txt
> @@ -47,6 +47,10 @@ Optional properties:
>  			  bus. The node must contains a compatible string of
>  			  "marvell,mv88e6xxx-mdio-external"
>  
> +Optional properties for ports:
> +- defqpri=<n>		: Enforced default queue priority for the given port.
> +			  Valid range is 0..3

This is a vendor specific driver/property,
marvell,default-queue-priority (which be cheapskate on words) would be
more readable. But still, I have some more fundamental issues with the
general approach, see my response in the cover letter.
-- 
Florian
