From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 0/4] Qualcomm SPMI PMIC pin controller drivers
Date: Tue, 21 Oct 2014 12:59:38 +0200
Message-ID: <CACRpkdaZ8o=Kmbez3iA_-0euuWQKwKyNNYPjnx1fBZOns0yN6A@mail.gmail.com>
References: <1412181058-29179-1-git-send-email-iivanov@mm-sol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1412181058-29179-1-git-send-email-iivanov@mm-sol.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: "Ivan T. Ivanov" <iivanov@mm-sol.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 1, 2014 at 6:30 PM, Ivan T. Ivanov <iivanov@mm-sol.com> wro=
te:

> Changes since v4:
>
> - Use PMIC name in compatible string.
> - PINCTRL_QCOM_SPMI_PMIC from Kconfig symbol.
> - Remove pmic string from drivers file names.
> - Fixed coding style issues.
> - Use qcom-spmi-gpio and qcom-spmi-mpp from dirver names,
>   to be similar to qcom-spmi-iadc, qcom-spmi-vadc and
>   qcom-spmi-temp-alarm drivers.
>
> Short description:
>
> Patches adds pin control drivers for Multi-Purpose Pin (MPP) and
> General-purpose pin (GPIO) controllers found in Qualcomm SPMI based
> PMIC chips.
>
> MPP's are enhanced GPIO's with analog circuits, which support
> analog and digital input/output.

I think I'm happy to apply this for v3.19 now that I have Bj=C3=B6rn's
ACK on it too (or is it even Reviewed-by..?)

But I can't find these patches in my mailbox, do you have
a branch based off v3.18-rc1 I can pull from?

Yours,
Linus Walleij
