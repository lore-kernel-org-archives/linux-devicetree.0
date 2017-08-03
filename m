From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 6/7] dt-bindings: pci: qcom: Add support for IPQ8074
Date: Thu, 3 Aug 2017 18:39:45 -0500
Message-ID: <20170803233945.dsgtxv3omx2uyhsf@rob-hp-laptop>
References: <1501482857-14100-1-git-send-email-varada@codeaurora.org>
 <1501482857-14100-7-git-send-email-varada@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1501482857-14100-7-git-send-email-varada@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Varadarajan Narayanan <varada@codeaurora.org>
Cc: bhelgaas@google.com, mark.rutland@arm.com, svarbanov@mm-sol.com, kishon@ti.com, sboyd@codeaurora.org, vivek.gautam@codeaurora.org, fengguang.wu@intel.com, weiyongjun1@huawei.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Jul 31, 2017 at 12:04:16PM +0530, Varadarajan Narayanan wrote:
> Add support for the IPQ8074 PCIe controller.  IPQ8074 supports Gen 1/2, one
> lane, two PCIe root complex with support for MSI and legacy interrupts, and
> it conforms to PCI Express Base 2.1 specification.
> 
> Signed-off-by: Varadarajan Narayanan <varada@codeaurora.org>
> ---
>  .../devicetree/bindings/pci/qcom,pcie.txt          | 23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
