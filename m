From: Bjorn Andersson <bjorn@kryo.se>
Subject: Re: [PATCH v2 0/3] Qualcomm Resource Power Manager driver
Date: Thu, 12 Jun 2014 13:06:06 -0700
Message-ID: <CAJAp7OgSKBqu1Xi0WFWCj=yqp+1PJcBtb9d5WCB8Lgo_EuspJg@mail.gmail.com>
References: <1402594402-30374-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1402594402-30374-1-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Josh Cartwright <joshc@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 12, 2014 at 10:33 AM, Bjorn Andersson
<bjorn.andersson@sonymobile.com> wrote:
> Changes since v1:
>   - Moved rpm driver to drivers/soc
[...]
>  include/linux/mfd/qcom_rpm.h                       |  12 +

Missed the last one in the move...

s/mfd/soc/

Will wait a little before sending out v3, to allow time for other comments.

// Bjorn
