From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: mfd: Add Spreadtrum SC27xx PMIC
 documentation
Date: Mon, 23 Oct 2017 15:21:10 +0100
Message-ID: <20171023142110.ohx2kgik7t2jht5p@dell>
References: <1dd82fa9d640d076e88b618c0788d27315a51f66.1508154918.git.baolin.wang@spreadtrum.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1dd82fa9d640d076e88b618c0788d27315a51f66.1508154918.git.baolin.wang@spreadtrum.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@spreadtrum.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, broonie@kernel.org, baolin.wang@linaro.org
List-Id: devicetree@vger.kernel.org

On Mon, 16 Oct 2017, Baolin Wang wrote:

> This patch adds the binding documentation for Spreadtrum SC27xx series
> PMIC device.
> 
> Signed-off-by: Baolin Wang <baolin.wang@spreadtrum.com>
> ---
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

Looks fine, but I'll give the DT guys a chance to have a look:

Acked-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
