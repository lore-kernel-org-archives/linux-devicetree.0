From: Kumar Gala <galak@codeaurora.org>
Subject: Re: [PATCH 0/3] Qualcomm Resource Power Manager driver
Date: Wed, 28 May 2014 11:23:02 -0500
Message-ID: <F773CDFB-2957-49C0-99D3-E9CDCE33C378@codeaurora.org>
References: <1401211721-19712-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1401211721-19712-1-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Josh Cartwright <joshc@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On May 27, 2014, at 12:28 PM, Bjorn Andersson <bjorn.andersson@sonymobile.com> wrote:

> This series adds a regulator driver for the Resource Power Manager found in
> Qualcomm 8660, 8960 and 8064 based devices.
> 
> The RPM driver exposes resources to its child devices, that can be accessed to
> implement drivers for the regulators, clocks and bus frequency control that's
> owned by the RPM in these devices.

Rather than adding yet another mfd driver, how about we put this in drivers/soc/qcom as a much better location for the low level rpm code.  Some code already merged in arm-soc for creation of drivers/soc/qcom/

> 
> Bjorn Andersson (3):
>  mfd: devicetree: bindings: Add Qualcomm RPM DT binding
>  mfd: qcom-rpm: Driver for the Qualcomm RPM
>  regulator: qcom-rpm: Regulator driver for the Qualcomm RPM
> 
> Documentation/devicetree/bindings/mfd/qcom,rpm.txt | 283 +++++++
> drivers/mfd/Kconfig                                |  15 +
> drivers/mfd/Makefile                               |   1 +
> drivers/mfd/qcom_rpm.c                             | 554 ++++++++++++++
> drivers/regulator/Kconfig                          |  12 +
> drivers/regulator/Makefile                         |   1 +
> drivers/regulator/qcom_rpm-regulator.c             | 852 +++++++++++++++++++++
> include/dt-bindings/mfd/qcom_rpm.h                 | 148 ++++
> include/linux/mfd/qcom_rpm.h                       |  13 +
> 9 files changed, 1879 insertions(+)
> create mode 100644 Documentation/devicetree/bindings/mfd/qcom,rpm.txt
> create mode 100644 drivers/mfd/qcom_rpm.c
> create mode 100644 drivers/regulator/qcom_rpm-regulator.c
> create mode 100644 include/dt-bindings/mfd/qcom_rpm.h
> create mode 100644 include/linux/mfd/qcom_rpm.h

- k

-- 
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
