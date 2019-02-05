From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v3 3/3] nvmem: zynqmp: Added zynqmp nvmem firmware driver
Date: Tue, 5 Feb 2019 11:24:57 +0000
Message-ID: <faa21f65-e5ab-52d4-a9be-bee1b2f931ad@linaro.org>
References: <20190206110721.27765-1-nava.manne@xilinx.com>
 <20190206110721.27765-4-nava.manne@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190206110721.27765-4-nava.manne@xilinx.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Nava kishore Manne <nava.manne@xilinx.com>, robh+dt@kernel.org, mark.rutland@arm.com, michal.simek@xilinx.com, jollys@xilinx.com, rajanv@xilinx.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, chinnikishore369@gmail.com
List-Id: devicetree@vger.kernel.org



On 06/02/2019 11:07, Nava kishore Manne wrote:
> This patch adds zynqmp nvmem firmware driver to access the
> SoC revision information from the hardware register.
> 
> Signed-off-by: Nava kishore Manne <nava.manne@xilinx.com>

Patch itself looks good to me!

Due to dependency on the "[PATCH v3 1/3] firmware: xilinx: Add 
zynqmp_pm_get_chipid() API" Its better to take this patch from the same 
tree!

Acked-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Thanks,
srini
