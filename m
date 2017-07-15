From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 2/2] power: supply: ltc2941-battery-gauge: Add support
 for LTC2942
Date: Fri, 14 Jul 2017 20:30:38 -0500
Message-ID: <20170715013038.gdnon3fm6lxfuvol@rob-hp-laptop>
References: <20170711125821.nt5opxjvbjcppiaw@lenoch>
 <20170711130020.kfimnv6em3besr3j@lenoch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170711130020.kfimnv6em3besr3j@lenoch>
Sender: linux-pm-owner@vger.kernel.org
To: Ladislav Michl <ladis@linux-mips.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, Mike Looijmans <mike.looijmans@topic.nl>, Javier Martinez Canillas <javier@osg.samsung.com>, Sebastian Reichel <sre@kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 11, 2017 at 03:00:20PM +0200, Ladislav Michl wrote:
> LTC2942 is pin compatible with LTC2941 providing additional
> informations about battery voltage and temperature. It can
> be runtime detected using bit A7 in the Status register.
> 
> Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
> ---
>  Changes:
>  - v2: reworked voltage computing to not overflow and keep presision
>  - v3: update devicetree binding documentation
>  - v4: add ltc2942 devicetree compatible
> 
>  .../devicetree/bindings/power/supply/ltc2941.txt   | 15 ++--

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/power/supply/ltc2941-battery-gauge.c       | 85 +++++++++++++++++-----
>  2 files changed, 74 insertions(+), 26 deletions(-)
