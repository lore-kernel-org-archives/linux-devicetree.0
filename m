From: Ray Jui <ray.jui@broadcom.com>
Subject: Re: [PATCH v6 0/3] Stingray thermal driver support
Date: Mon, 4 Feb 2019 16:16:19 -0800
Message-ID: <a6113115-453c-4606-f99d-c79263d8f4bb@broadcom.com>
References: <1546505734-24527-1-git-send-email-srinath.mannam@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1546505734-24527-1-git-send-email-srinath.mannam@broadcom.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Srinath Mannam <srinath.mannam@broadcom.com>, daniel.lezcano@linaro.org, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

Hi Zhang/Eduardo,

Can this patch series be merged? It looks like Srinath has addressed all
review comments?

The following tag should be added to the binding document patch:

Reviewed-by: Rob Herring <robh@kernel.org>

Thanks,

Ray

On 1/3/2019 12:55 AM, Srinath Mannam wrote:
> These patches adds the stingray thermal driver and its
> corresponding DT nodes with documentation.
> 
> Changes from v5
>   - Addressed Eduardo Valentin comments.
> 
> Changes from v4
>   - Addressed Rob Herring comments on DT parameters and
>     thermal driver architecture.
>   - Removed brcm,max-crit-temp DT parameter
>   - Changed driver to thermal sensor registration model.
>   - Added trip DT properties.
> 
> Changes from v3
>   - Addressed Daniel lezcano comments.
>   - Elaborated commit description of thermal driver patch.
>   - Added brcm,max-crit-temp DT parameter.
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
> 
> Pramod Kumar (3):
>   dt-bindings: thermal: Add binding document for SR thermal
>   thermal: broadcom: Add Stingray thermal driver
>   arm64: dts: stingray: Add Stingray Thermal DT support.
> 
>  .../bindings/thermal/brcm,sr-thermal.txt           | 105 ++++++++++++++++++
>  .../arm64/boot/dts/broadcom/stingray/stingray.dtsi |  89 +++++++++++++++
>  drivers/thermal/Kconfig                            |   3 +-
>  drivers/thermal/broadcom/Kconfig                   |   9 ++
>  drivers/thermal/broadcom/Makefile                  |   1 +
>  drivers/thermal/broadcom/sr-thermal.c              | 122 +++++++++++++++++++++
>  6 files changed, 328 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/thermal/brcm,sr-thermal.txt
>  create mode 100644 drivers/thermal/broadcom/sr-thermal.c
> 
