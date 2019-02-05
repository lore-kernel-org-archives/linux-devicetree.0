From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH v3 0/3] Add nvmem driver support for ZynqMP
Date: Tue, 5 Feb 2019 13:27:07 +0100
Message-ID: <a6c443e3-a9ba-ffa3-5f0f-69db6884646d@xilinx.com>
References: <20190206110721.27765-1-nava.manne@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190206110721.27765-1-nava.manne@xilinx.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Nava kishore Manne <nava.manne@xilinx.com>, srinivas.kandagatla@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, michal.simek@xilinx.com, jollys@xilinx.com, rajanv@xilinx.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, chinnikishore369@gmail.com
List-Id: devicetree@vger.kernel.org

On 06. 02. 19 12:07, Nava kishore Manne wrote:
> Nava kishore Manne (3):
>   firmware: xilinx: Add zynqmp_pm_get_chipid() API
>   dt-bindings: nvmem: Add bindings for ZynqMP nvmem driver
>   nvmem: zynqmp: Added zynqmp nvmem firmware driver
> 
>  .../bindings/nvmem/xlnx,zynqmp-nvmem.txt      | 47 ++++++++++
>  drivers/firmware/xilinx/zynqmp.c              | 24 ++++++
>  drivers/nvmem/Kconfig                         | 10 +++
>  drivers/nvmem/Makefile                        |  2 +
>  drivers/nvmem/zynqmp_nvmem.c                  | 86 +++++++++++++++++++
>  include/linux/firmware/xlnx-zynqmp.h          |  2 +
>  6 files changed, 171 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/xlnx,zynqmp-nvmem.txt
>  create mode 100644 drivers/nvmem/zynqmp_nvmem.c
> 

Applied all with one small change in 1/3 by using number 24 instead of
22 to be aligned with firmware.

Patches are available here.
https://github.com/Xilinx/linux-xlnx/tree/zynqmp/soc

Thanks,
Michal
