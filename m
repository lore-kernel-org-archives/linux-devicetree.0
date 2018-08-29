From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH v3 3/4] drivers: edac: Add EDAC driver support for QCOM
 SoCs
Date: Wed, 29 Aug 2018 22:43:18 +0800
Message-ID: <201808292116.hmURvsFL%fengguang.wu@intel.com>
References: <1535503347-20507-4-git-send-email-vnkgutta@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1535503347-20507-4-git-send-email-vnkgutta@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: kbuild-all@01.org, evgreen@chromium.org, robh@kernel.org, mchehab@kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, tsoni@codeaurora.org, ckadabi@codeaurora.org, rishabhb@codeaurora.org, bp@alien8.de, swboyd@chromium.org, Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Hi Channagoud,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v4.19-rc1 next-20180829]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Venkata-Narendra-Kumar-Gutta/drivers-soc-Add-broadcast-base-for-Last-Level-Cache-Controller-LLCC/20180829-152433
reproduce:
        # apt-get install sparse
        make ARCH=x86_64 allmodconfig
        make C=1 CF=-D__CHECK_ENDIAN__


sparse warnings: (new ones prefixed by >>)

>> drivers/edac/qcom_edac.c:86:33: sparse: symbol 'edac_reg_data' was not declared. Should it be static?

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
