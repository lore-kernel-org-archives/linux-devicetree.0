From: Roger Quadros <rogerq@ti.com>
Subject: Re: [PATCH v4 0/5] PHY: Add support for SERDES in TI's AM654 platform
Date: Wed, 10 Apr 2019 11:41:07 +0300
Message-ID: <3cd1371d-36fd-c907-b532-3a6f46f4eabf@ti.com>
References: <20190405110834.13083-1-kishon@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190405110834.13083-1-kishon@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Kishon,

On 05/04/2019 14:08, Kishon Vijay Abraham I wrote:
> This patch series
>   *) adds support for SERDES module in am654
>   *) modifies phy_reset API to invoke pm_runtime_get/pm_runtime_put since
> the reset callback can access registers.
>   *) Add *release* phy_ops to be invoked when the consumer relinquishes
> PHY
> 
> Changes from v3:
>   *) Moved SERDES driver to use regfield
>   *) Removed reg-names binding and updated Documentation for
>      power-domains
> 
> Changes from v2:
>   *) Fix typos pointed out by Roger
>   *) Add dt-binding Documentation in a new file ti,phy-am654-serdes.txt
>   *) Add Roger's patch to support all CLKSEL values.
> 
> Changes from v1:
>   *) Add *release* phy ops
>   *) Populate release phy_ops in phy-am654-serdes to cleanup
> initializations done in of_xlate
> 
> Kishon Vijay Abraham I (4):
>   phy: core: Add *release* phy_ops invoked when the consumer
>     relinquishes PHY
>   phy: core: Invoke pm_runtime_get_*/pm_runtime_put_* before invoking
>     reset callback
>   dt-bindings: phy: ti: Add dt binding documentation for SERDES in
>     AM654x SoC
>   phy: ti: Add a new SERDES driver for TI's AM654x SoC

For these patches,

Reviewed-by: Roger Quadros <rogerq@ti.com>

> 
> Roger Quadros (1):
>   phy: ti: am654-serdes: Support all clksel values
> 
>  .../bindings/phy/ti,phy-am654-serdes.txt      |  82 +++
>  drivers/phy/phy-core.c                        |  11 +
>  drivers/phy/ti/Kconfig                        |  12 +
>  drivers/phy/ti/Makefile                       |   1 +
>  drivers/phy/ti/phy-am654-serdes.c             | 658 ++++++++++++++++++
>  include/dt-bindings/phy/phy-am654-serdes.h    |  13 +
>  include/linux/phy/phy.h                       |   2 +
>  7 files changed, 779 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/ti,phy-am654-serdes.txt
>  create mode 100644 drivers/phy/ti/phy-am654-serdes.c
>  create mode 100644 include/dt-bindings/phy/phy-am654-serdes.h
> 

cheers,
-roger
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
