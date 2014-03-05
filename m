From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 4/6] rtc: pm8xxx: add support for devicetree
Date: Wed, 05 Mar 2014 12:59:01 -0800
Message-ID: <53179015.906@codeaurora.org>
References: <1394047776-13827-1-git-send-email-joshc@codeaurora.org> <1394047776-13827-5-git-send-email-joshc@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1394047776-13827-5-git-send-email-joshc@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Josh Cartwright <joshc@codeaurora.org>
Cc: Alessandro Zummo <a.zummo@towertech.it>, David Brown <davidb@codeaurora.org>, Daniel Walker <dwalker@fifo99.com>, Bryan Huntsman <bryanh@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, rtc-linux@googlegroups.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 03/05/14 11:29, Josh Cartwright wrote:
> Add support for describing the PM8921/PM8058 RTC in device tree.
>
> Additionally:
>    - drop support for describing the RTC using platform data,
>      as there are no current in tree users who do so.
>    - make allow_set_time a device-specific flag, instead of mucking
>      with the rtc_ops
>
> Signed-off-by: Josh Cartwright <joshc@codeaurora.org>
>

Reviewed-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
