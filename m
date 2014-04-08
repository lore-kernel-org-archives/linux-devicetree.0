From: Timur Tabi <timur@codeaurora.org>
Subject: Re: [PATCH 2/2] ARM: dts: MSM8974: Add pinctrl node
Date: Tue, 8 Apr 2014 07:12:47 -0500
Message-ID: <CAOZdJXUzhOZnGjQdAb10zKtbjjurDjgygdMmu1edmGt6UTj4CQ@mail.gmail.com>
References: <1391700529-11816-1-git-send-email-iivanov@mm-sol.com>
	<1391700529-11816-2-git-send-email-iivanov@mm-sol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1391700529-11816-2-git-send-email-iivanov@mm-sol.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: "Ivan T. Ivanov" <iivanov@mm-sol.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Feb 6, 2014 at 9:28 AM, Ivan T. Ivanov <iivanov@mm-sol.com> wrote:

> +               msmgpio: pinctrl@fd510000 {
> +                       compatible = "qcom,msm8974-pinctrl";
> +                       reg = <0xfd510000 0x4000>;
> +                       gpio-controller;
> +                       #gpio-cells = <2>;
> +                       interrupt-controller;
> +                       #interrupt-cells = <2>;
> +                       interrupts = <0 208 0>;
> +
> +                       spi8_default: spi8_default {
> +                               mosi {
> +                                       pins = "gpio45";
> +                                       function = "blsp_spi8";
> +                               };
> +                               miso {
> +                                       pins = "gpio46";
> +                                       function = "blsp_spi8";
> +                               };
> +                               cs {
> +                                       pins = "gpio47";
> +                                       function = "blsp_spi8";
> +                               };
> +                               clk {
> +                                       pins = "gpio48";
> +                                       function = "blsp_spi8";
> +                               };
> +                       };
> +               };
>         };
>  };

I'm confused by this.  Isn't this information already defined in the
pinctrl-msm8x74.c driver?

static const char * const blsp_spi8_groups[] = {
    "gpio45", "gpio46", "gpio47", "gpio48"
};

-- 
Sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the
Code Aurora Forum, hosted by The Linux Foundation
