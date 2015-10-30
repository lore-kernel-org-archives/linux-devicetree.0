From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH 1/2] dma: add Qualcomm Technologies HIDMA management
 driver
Date: Fri, 30 Oct 2015 12:34:08 +0800
Message-ID: <201510301229.VB4UX8GG%fengguang.wu@intel.com>
References: <1446174501-8870-1-git-send-email-okaya@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1446174501-8870-1-git-send-email-okaya@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: kbuild-all@01.org, dmaengine@vger.kernel.org, timur@codeaurora.org, cov@codeaurora.org, jcm@redhat.com, Sinan Kaya <okaya@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Sinan,

[auto build test WARNING on lwn/docs-next -- if it's inappropriate base, please suggest rules for selecting the more suitable base]

url:    https://github.com/0day-ci/linux/commits/Sinan-Kaya/dma-add-Qualcomm-Technologies-HIDMA-management-driver/20151030-111408


coccinelle warnings: (new ones prefixed by >>)

>> drivers/dma/qcom_hidma_mgmt.c:852:3-8: No need to set .owner here. The core will do it.

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
