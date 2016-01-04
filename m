From: Sinan Kaya <okaya@codeaurora.org>
Subject: Re: [PATCH V11 0/7] dma: add Qualcomm Technologies HIDMA driver
Date: Sun, 3 Jan 2016 19:09:23 -0500
Message-ID: <5689B833.7010901@codeaurora.org>
References: <1451865996-12808-1-git-send-email-okaya@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1451865996-12808-1-git-send-email-okaya@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: devicetree@vger.kernel.org, vinod.koul@intel.com
Cc: dmaengine@vger.kernel.org, mark.rutland@arm.com, timur@codeaurora.org, cov@codeaurora.org, jcm@redhat.com, agross@codeaurora.org, arnd@arndb.de, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Vinod,

On 1/3/2016 7:06 PM, Sinan Kaya wrote:
> The Qualcomm Technologies HIDMA device has been designed
> to support virtualization technology. The driver has been
> divided into two to follow the hardware design.
> 
> 1. HIDMA Management driver
> 2. HIDMA Channel driver
> 
> Each HIDMA HW consists of multiple channels. These channels
> share some set of common parameters. These parameters are
> initialized by the management driver during power up.
> Same management driver is used for monitoring the execution
> of the channels. Management driver can change the performance
> behavior dynamically such as bandwidth allocation and
> prioritization in the future.
> 
> The management driver is executed in hypervisor context and
> is the main management entity for all channels provided by
> the device.
> 
> Changes from V10: (https://lkml.org/lkml/2015/12/17/454)
> * none
> 
> Changes from V10: (https://lkml.org/lkml/2015/12/17/448)
> * none
> 
> Changes from V10: (https://lkml.org/lkml/2015/12/17/449)
> * none
> 
> Changes from V10: (https://lkml.org/lkml/2015/12/17/451)
> * none
> 
> Changes from V10: (https://lkml.org/lkml/2015/12/17/452)
> * none
> 
> Changes from V10: (https://lkml.org/lkml/2015/12/17/453)
> * none
> 
> Changes from V10: (https://lkml.org/lkml/2015/12/17/450)
> * Clean up style issues
> * make depend on CONFIG_OF_IRQ too as SPARC arch doesn't seem to define
> CONFIG_OF_IRQ but it defines CONFIG_OF.
> 
> Sinan Kaya (7):
>   dma: qcom_bam_dma: move to qcom directory
>   dma: hidma: Add Device Tree support
>   dma: add Qualcomm Technologies HIDMA management driver
>   dma: add Qualcomm Technologies HIDMA channel driver
>   dma: qcom_hidma: implement lower level hardware interface
>   dma: qcom_hidma: add debugfs hooks
>   dma: qcom_hidma: add support for object hierarchy
> 
>  Documentation/ABI/testing/sysfs-platform-hidma     |   9 +
>  .../ABI/testing/sysfs-platform-hidma-mgmt          |  97 +++
>  .../devicetree/bindings/dma/qcom_hidma_mgmt.txt    |  79 ++
>  drivers/dma/Kconfig                                |  11 +-
>  drivers/dma/Makefile                               |   2 +-
>  drivers/dma/qcom/Kconfig                           |  29 +
>  drivers/dma/qcom/Makefile                          |   5 +
>  drivers/dma/{qcom_bam_dma.c => qcom/bam_dma.c}     |   4 +-
>  drivers/dma/qcom/hidma.c                           | 784 +++++++++++++++++
>  drivers/dma/qcom/hidma.h                           | 162 ++++
>  drivers/dma/qcom/hidma_dbg.c                       | 219 +++++
>  drivers/dma/qcom/hidma_ll.c                        | 927 +++++++++++++++++++++
>  drivers/dma/qcom/hidma_mgmt.c                      | 400 +++++++++
>  drivers/dma/qcom/hidma_mgmt.h                      |  39 +
>  drivers/dma/qcom/hidma_mgmt_sys.c                  | 295 +++++++
>  15 files changed, 3050 insertions(+), 12 deletions(-)
>  create mode 100644 Documentation/ABI/testing/sysfs-platform-hidma
>  create mode 100644 Documentation/ABI/testing/sysfs-platform-hidma-mgmt
>  create mode 100644 Documentation/devicetree/bindings/dma/qcom_hidma_mgmt.txt
>  create mode 100644 drivers/dma/qcom/Kconfig
>  create mode 100644 drivers/dma/qcom/Makefile
>  rename drivers/dma/{qcom_bam_dma.c => qcom/bam_dma.c} (99%)
>  create mode 100644 drivers/dma/qcom/hidma.c
>  create mode 100644 drivers/dma/qcom/hidma.h
>  create mode 100644 drivers/dma/qcom/hidma_dbg.c
>  create mode 100644 drivers/dma/qcom/hidma_ll.c
>  create mode 100644 drivers/dma/qcom/hidma_mgmt.c
>  create mode 100644 drivers/dma/qcom/hidma_mgmt.h
>  create mode 100644 drivers/dma/qcom/hidma_mgmt_sys.c
> 

Can I have your ACK on your series if you are OK?
Sinan

-- 
Sinan Kaya
Qualcomm Technologies, Inc. on behalf of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project
