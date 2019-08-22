From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: phy: intel-emmc-phy: Add YAML schema
 for LGM eMMC PHY
Date: Thu, 22 Aug 2019 07:49:02 -0500
Message-ID: <CAL_JsqJEW0UDqYDTvOeRsZh9WJTeT99JZP8PtkvbnBU2dhYJEQ@mail.gmail.com>
References: <20190822102843.47964-1-vadivel.muruganx.ramuthevar@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190822102843.47964-1-vadivel.muruganx.ramuthevar@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Ramuthevar,Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>, cheol.yong.kim@intel.com, qi-ming.wu@intel.com, peter.harliman.liem@intel.com
List-Id: devicetree@vger.kernel.org

On Thu, Aug 22, 2019 at 5:28 AM Ramuthevar,Vadivel MuruganX
<vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
>
> From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
>
> Add a YAML schema to use the host controller driver with the
> eMMC PHY on Intel's Lightning Mountain SoC.
>
> Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> ---
> changes in v4:
>   - As per Rob's review: validate 5.2 and 5.3
>   - drop unrelated items.
>
> changes in v3:
>   - resolve 'make dt_binding_check' warnings
>
> changes in v2:
>   As per Rob Herring review comments, the following updates
>  - change GPL-2.0 -> (GPL-2.0-only OR BSD-2-Clause)
>  - filename is the compatible string plus .yaml
>  - LGM: Lightning Mountain
>  - update maintainer
>  - add intel,syscon under property list
>  - keep one example instead of two
> ---
>  .../bindings/phy/intel,lgm-emmc-phy.yaml           | 50 ++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/intel,lgm-emmc-phy.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
