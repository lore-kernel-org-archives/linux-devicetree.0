From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v3 0/3] Stingray thermal driver support
Date: Thu, 13 Sep 2018 15:25:45 -0700
Message-ID: <9dee54fd-eaef-5454-0c96-d105ba2e221d@gmail.com>
References: <1533819299-3401-1-git-send-email-srinath.mannam@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1533819299-3401-1-git-send-email-srinath.mannam@broadcom.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Srinath Mannam <srinath.mannam@broadcom.com>, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org



On 08/09/18 05:54, Srinath Mannam wrote:
> These patches adds the stingray thermal driver and its
> corresponding DT nodes with documentation.
> 
> Changes from v2:
>   - All stingray TMON DT nodes are combine together into single.
>     Temperature registers are combined into one mem resource.
>     brcm,tmon-mask parameter has available TMONs mask value.
>   - All available TMONs are initialized together in single
>     instance of driver probe call.
> 
> Changes from v1:
>   - Fixed auto build sparce warning.

Thermal maintainers, can you please review patch #3? The binding and DTS
changes can go through arm-soc if you would like, or you can take
patches 1 and 3 and I take patch 2, either way is fine.

Thank you

> 
> Pramod Kumar (3):
>   dt-bindings: thermal: Add binding document for SR thermal
>   arm64: dts: stingray: Add Stingray Thermal DT support.
>   thermal: broadcom: Add Stingray thermal driver
> 
>  .../bindings/thermal/brcm,sr-thermal.txt           |  23 +++
>  .../arm64/boot/dts/broadcom/stingray/stingray.dtsi |  13 ++
>  drivers/thermal/Kconfig                            |   3 +-
>  drivers/thermal/broadcom/Kconfig                   |   9 +
>  drivers/thermal/broadcom/Makefile                  |   1 +
>  drivers/thermal/broadcom/sr-thermal.c              | 216 +++++++++++++++++++++
>  6 files changed, 264 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/thermal/brcm,sr-thermal.txt
>  create mode 100644 drivers/thermal/broadcom/sr-thermal.c
> 

-- 
Florian
