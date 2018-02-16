From: Stanimir Varbanov <svarbanov@mm-sol.com>
Subject: Re: [PATCH v3] PCI: qcom: add missing supplies required for msm8996
Date: Fri, 16 Feb 2018 14:42:07 +0200
Message-ID: <e7f1ae50-3bf2-de7c-270d-5d06dac25e78@mm-sol.com>
References: <20180215132248.5572-1-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180215132248.5572-1-srinivas.kandagatla@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: srinivas.kandagatla@linaro.org, stanimir.varbanov@linaro.org, linux-pci@vger.kernel.org, bhelgaas@google.com
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Srini,

On 02/15/2018 03:22 PM, srinivas.kandagatla@linaro.org wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> This patch adds supplies that are required for msm8996. vdda
> is analog supply that go in to controller, and vddpe_3v3 is
> supply to PCIe endpoint.
> 
> Without these supplies PCIe endpoints which require power supplies are
> not enumerated at all, as there is no one to power it up.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
> changes since v2:
> 	Add back empty line suggested by Stan
> 	use ARRAY_SIZE
> 
>  .../devicetree/bindings/pci/qcom,pcie.txt          |  4 ++++
>  drivers/pci/dwc/pcie-qcom.c                        | 23 +++++++++++++++++++++-
>  2 files changed, 26 insertions(+), 1 deletion(-)

Acked-by: Stanimir Varbanov <svarbanov@mm-sol.com>

-- 
regards,
Stan
