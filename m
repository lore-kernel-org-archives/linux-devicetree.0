From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2] mmc: dw_mmc: add support for the other bit of sdio interrupt
Date: Thu, 30 Oct 2014 22:14:15 -0700
Message-ID: <CAD=FV=VegP+6QDEmiU6J9GuT9Sv7yJ_1bQiNhTfFqcXs6hsUkQ@mail.gmail.com>
References: <1414666240-16782-1-git-send-email-addy.ke@rock-chips.com>
	<1414727409-6765-1-git-send-email-addy.ke@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-mmc-owner@vger.kernel.org>
In-Reply-To: <1414727409-6765-1-git-send-email-addy.ke@rock-chips.com>
Sender: linux-mmc-owner@vger.kernel.org
To: Addy Ke <addy.ke@rock-chips.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Randy Dunlap <rdunlap@infradead.org>, Seungwon Jeon <tgih.jun@samsung.com>, Jaehoon Chung <jh80.chung@samsung.com>, Chris Ball <chris@printf.net>, Ulf Hansson <ulf.hansson@linaro.org>, Dinh Nguyen <dinguyen@altera.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Olof Johansson <olof@lixom.net>, Sonny Rao <sonnyrao@chromium.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>"open list:ARM/Rockchip SoC..." <linux>
List-Id: devicetree@vger.kernel.org

Addy,

On Thu, Oct 30, 2014 at 8:50 PM, Addy Ke <addy.ke@rock-chips.com> wrote:
> +static int dw_mci_rk3288_parse_dt(struct dw_mci *host)
> +{
> +       struct device_node *np = host->dev->of_node;
> +       int sdio_id0;
> +
> +       if (!of_property_read_u32(np, "rockchip,sdio-interrupt-slot0",
> +                                 &sdio_id0))
> +               host->sdio_id0 = sdio_id0;

This function is only run on rk3288 and on all rk3288 SoCs this value
is exactly 8.  Just replace this with:

  /* SDIO IRQ shows up as if it were slot 8 on rk3288 SoCs */
  host->sdio_id0 = 8;
