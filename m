From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: mfd: Add Spreadtrum SC27xx PMIC
 documentation
Date: Wed, 1 Nov 2017 09:26:49 +0000
Message-ID: <20171101092649.sarbr64gybx6wmlm@dell>
References: <c92b97145628e5f8db410d1916da46a4c9fecf8c.1509503569.git.baolin.wang@spreadtrum.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <c92b97145628e5f8db410d1916da46a4c9fecf8c.1509503569.git.baolin.wang@spreadtrum.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@spreadtrum.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, broonie@kernel.org, baolin.wang@linaro.org
List-Id: devicetree@vger.kernel.org

On Wed, 01 Nov 2017, Baolin Wang wrote:

> This patch adds the binding documentation for Spreadtrum SC27xx series
> PMIC device.
> 
> Signed-off-by: Baolin Wang <baolin.wang@spreadtrum.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Acked-by: Lee Jones <lee.jones@linaro.org>
> ---
> Changes since v3:
>  - No Updates.
> 
> Changes since v2:
>  - Add acked tag from Rob and Lee.
> 
> Changes since v1:
>  - Add more documentation to introduce Spreadtrum SC27xx series PMICs.
>  - Modify compatile string property.
>  - Modify reg property.
>  - Remove redundant 'pmic' label.
>  - Change 'should be' to 'must be' for cells properties.
> ---
>  .../devicetree/bindings/mfd/sprd,sc27xx-pmic.txt   |   40 ++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/sprd,sc27xx-pmic.txt

Applied, thanks.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
