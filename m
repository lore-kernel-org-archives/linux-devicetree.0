From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 0/8] firmware: arm_scpi: add support for legacy SCPI
 protocol
Date: Thu, 3 Nov 2016 10:12:29 +0100
Message-ID: <3a1824cc-83b4-a7ae-4a72-03f83bc2348f@baylibre.com>
References: <1478148731-11712-1-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1478148731-11712-1-git-send-email-sudeep.holla@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 11/03/2016 05:52 AM, Sudeep Holla wrote:
> Hi,
> 
> This is minor rework of the series[1] from Neil Armstrong's to support
> legacy SCPI protocol to make DT bindings more generic and move out all
> the platform specific bindings out of the generic binding document.
> 
> --
> Regards,
> Sudeep
> 
> [1] http://www.spinics.net/lists/arm-kernel/msg534999.html
> 
> Neil Armstrong (4):
>   firmware: arm_scpi: increase MAX_DVFS_OPPS to 16 entries
>   firmware: arm_scpi: add alternative legacy structures, functions and
>     macros
>   firmware: arm_scpi: allow firmware with get_capabilities not
>     implemented
>   Documentation: bindings: Add support for Amlogic GXBB SCPI protocol
> 
> Sudeep Holla (4):
>   firmware: arm_scpi: add command indirection to support legacy commands
>   Documentation: bindings: decouple juno specific details from generic
>     binding
>   Documentation: bindings: add compatible specific to legacy SCPI
>     protocol
>   firmware: arm_scpi: add support for legacy SCPI compatible
> 
>  .../devicetree/bindings/arm/amlogic,scpi.txt       |  20 ++
>  Documentation/devicetree/bindings/arm/arm,scpi.txt |  24 +-
>  .../devicetree/bindings/arm/juno,scpi.txt          |  26 ++
>  drivers/firmware/arm_scpi.c                        | 276 ++++++++++++++++++---
>  4 files changed, 300 insertions(+), 46 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/arm/amlogic,scpi.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/juno,scpi.txt
> 

Hi Sudeep,

Ok for me, I submitted the fix for the GXBB dtsi.

Neil
