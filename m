From: Stanimir Varbanov <svarbanov@mm-sol.com>
Subject: Re: [PATCH] pcie: qcom: Add support to enable pcie refclk
Date: Tue, 20 Mar 2018 10:30:30 +0200
Message-ID: <09b50715-5835-bf85-b53b-12b4b839ca10@mm-sol.com>
References: <20180315144133.14031-1-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180315144133.14031-1-srinivas.kandagatla@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: srinivas.kandagatla@linaro.org, bhelgaas@google.com, linux-pci@vger.kernel.org, robh+dt@kernel.org
Cc: mark.rutland@arm.com, lorenzo.pieralisi@arm.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Srini,

On 03/15/2018 04:41 PM, srinivas.kandagatla@linaro.org wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> This patch adds support to enable 100MHz pcie refclk,
> On some boards like DB600c this clock is not enabled by default.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  Documentation/devicetree/bindings/pci/qcom,pcie.txt |  1 +
>  drivers/pci/dwc/pcie-qcom.c                         | 21 ++++++++++++++++++++-
>  2 files changed, 21 insertions(+), 1 deletion(-)

Acked-by: Stanimir Varbanov <svarbanov@mm-sol.com>

-- 
regards,
Stan
