From: Timur Tabi <timur@codeaurora.org>
Subject: Re: [PATCH 2/2] ARM: dts: MSM8974: Add pinctrl node
Date: Mon, 7 Apr 2014 18:53:02 -0500
Message-ID: <CAOZdJXVE7MSMBaL+bt0kjw5LEidz-aVp+vrWqQWkye6HdE7EeA@mail.gmail.com>
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

I'm confused by this.  Isn't this information already defined in the
pinctrl-msm8x74.c driver?

static const char * const blsp_spi8_groups[] = {
    "gpio45", "gpio46", "gpio47", "gpio48"
};
