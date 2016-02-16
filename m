From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 1/6] pinctrl: qcom: ipq4019: Add IPQ4019 pinctrl support
Date: Tue, 16 Feb 2016 15:54:12 +0100
Message-ID: <CACRpkdZQTN+X=kWS7-5tzts=AGem2W+Od_ap1oy04Fm5i0y4fg@mail.gmail.com>
References: <1447975173-29485-1-git-send-email-mmcclint@qca.qualcomm.com>
	<1447975173-29485-2-git-send-email-mmcclint@qca.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1447975173-29485-2-git-send-email-mmcclint@qca.qualcomm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew McClintock <mmcclint@qca.qualcomm.com>
Cc: Andy Gross <agross@codeaurora.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Varadarajan Narayanan <varada@codeaurora.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, qca-upstream.external@qca.qualcomm.com, Sricharan R <sricharan@codeaurora.org>, Mathieu Olivari <mathieu@codeaurora.org>, Matthew McClintock <mmcclint@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 20, 2015 at 12:19 AM, Matthew McClintock
<mmcclint@qca.qualcomm.com> wrote:

> From: Varadarajan Narayanan <varada@codeaurora.org>
>
> Add pinctrl driver support for IPQ4019 platform
>
> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
> Signed-off-by: Mathieu Olivari <mathieu@codeaurora.org>
> Signed-off-by: Varadarajan Narayanan <varada@codeaurora.org>
> Signed-off-by: Matthew McClintock <mmcclint@codeaurora.org>
> ---
>
> v3
> - update example with actual values from dts
> - add missing pins 71-99
> - drop many functions and stick to basic functionality

Patch applied with all the ACKs and stuff, and dropped the .owner
assignment as indicated by Bj=C3=B6rn in the process.

Yours,
Linus Walleij
