From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] PCI: qcom: add missing supplies required for msm8996
Date: Tue, 12 Dec 2017 14:17:54 -0600
Message-ID: <20171212201754.lv7hsb3e5fx4eap5@rob-hp-laptop>
References: <20171208092053.4417-1-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171208092053.4417-1-srinivas.kandagatla@linaro.org>
Sender: linux-pci-owner@vger.kernel.org
To: srinivas.kandagatla@linaro.org
Cc: stanimir.varbanov@linaro.org, Stanimir Varbanov <svarbanov@mm-sol.com>, linux-pci@vger.kernel.org, bhelgaas@google.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Dec 08, 2017 at 09:20:53AM +0000, srinivas.kandagatla@linaro.org wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> This patch adds supplies that are required for msm8996. Two of them vdda
> and vdda-1p8 are analog supplies that go in to controller, and the rest
> of the two vddpe's are supplies to PCIe endpoints.
> 
> Without these supplies PCIe endpoints which require power supplies are
> not enumerated at all, as there is no one to power it up.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../devicetree/bindings/pci/qcom,pcie.txt          | 16 +++++++++++++
>  drivers/pci/dwc/pcie-qcom.c                        | 28 ++++++++++++++++++++--
>  2 files changed, 42 insertions(+), 2 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>                  
