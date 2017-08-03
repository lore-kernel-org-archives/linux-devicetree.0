From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 2/7] dt-bindings: phy: qmp: Add support for QMP phy in
 IPQ8074
Date: Thu, 3 Aug 2017 18:38:56 -0500
Message-ID: <20170803233856.zpjuhdbzfafhdtmr@rob-hp-laptop>
References: <1501482857-14100-1-git-send-email-varada@codeaurora.org>
 <1501482857-14100-3-git-send-email-varada@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1501482857-14100-3-git-send-email-varada@codeaurora.org>
Sender: linux-pci-owner@vger.kernel.org
To: Varadarajan Narayanan <varada@codeaurora.org>
Cc: bhelgaas@google.com, mark.rutland@arm.com, svarbanov@mm-sol.com, kishon@ti.com, sboyd@codeaurora.org, vivek.gautam@codeaurora.org, fengguang.wu@intel.com, weiyongjun1@huawei.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Jul 31, 2017 at 12:04:12PM +0530, Varadarajan Narayanan wrote:
> IPQ8074 uses QMP phy controller that provides support to PCIe and
> USB. Adding dt binding information for the same.
> 
> Reviewed-by: Vivek Gautam <vivek.gautam@codeaurora.org>
> Signed-off-by: Varadarajan Narayanan <varada@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt | 8 ++++++++
>  1 file changed, 8 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
