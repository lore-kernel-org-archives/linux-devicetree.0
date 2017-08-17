From: Stanimir Varbanov <svarbanov@mm-sol.com>
Subject: Re: [PATCH v8 1/3] PCI: dwc: qcom: Use block IP version for
 operations
Date: Thu, 17 Aug 2017 14:46:41 +0300
Message-ID: <acd26a12-bcd8-5b51-fe51-748d7ba33489@mm-sol.com>
References: <1502968858-28090-1-git-send-email-varada@codeaurora.org>
 <1502968858-28090-2-git-send-email-varada@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1502968858-28090-2-git-send-email-varada@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Varadarajan Narayanan <varada@codeaurora.org>, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, kishon@ti.com, sboyd@codeaurora.org, vivek.gautam@codeaurora.org, fengguang.wu@intel.com, weiyongjun1@huawei.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Varada,

On 08/17/2017 02:20 PM, Varadarajan Narayanan wrote:
> Presently, when support for a new SoC is added, the driver ops
> structures and functions are versioned with plain 1, 2, 3 etc.
> Instead use the block IP version number.
> 
> Signed-off-by: Varadarajan Narayanan <varada@codeaurora.org>
> ---
>  drivers/pci/dwc/pcie-qcom.c | 132 +++++++++++++++++++++++---------------------
>  1 file changed, 68 insertions(+), 64 deletions(-)

The patch cannot be applied on todays linux-next so you have to rebase
the patches on top of Bjorn's pci.git tree.

Otherwise you have my:

Acked-by: Stanimir Varbanov <svarbanov@mm-sol.com>

regards,
Stan
