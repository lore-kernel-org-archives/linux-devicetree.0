From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: qcom: ipq4019: add remaining pin definitions
Date: Wed, 17 May 2017 13:07:29 -0700
Message-ID: <20170517200729.GH12920@tuxbook>
References: <d53b7a9b1bab818536680123136ac58481d959c8.1494415174.git.chunkeey@googlemail.com>
 <3dac044cd9a879cad145f9a04dcc3d225721aa3c.1494415174.git.chunkeey@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3dac044cd9a879cad145f9a04dcc3d225721aa3c.1494415174.git.chunkeey@googlemail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Christian Lamparter <chunkeey@googlemail.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Ram Chandra Jangir <rjangir@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, John Crispin <john@phrozen.org>
List-Id: devicetree@vger.kernel.org

On Wed 10 May 04:27 PDT 2017, Christian Lamparter wrote:
> diff --git a/drivers/pinctrl/qcom/pinctrl-ipq4019.c b/drivers/pinctrl/qcom/pinctrl-ipq4019.c
> index 743d1f458205..7219d1e33c71 100644
> --- a/drivers/pinctrl/qcom/pinctrl-ipq4019.c
> +++ b/drivers/pinctrl/qcom/pinctrl-ipq4019.c
> @@ -276,16 +276,531 @@ DECLARE_QCA_GPIO_PINS(99);
>  
>  
>  enum ipq4019_functions {

Please sort these alphabetically - and the following two lists
accordingly.

> +	qca_mux_rmii0_refclk,
> +	qca_mux_wifi0_rfsilient0,
> +	qca_mux_wifi1_rfsilient0,
> +	qca_mux_smart2,
> +	qca_mux_led4,

What drives ledX? Is it 11 different LED controllers or is it a single
LED controller with 11 outputs.

[..]
> +	qca_mux_wifi01,

Please make these "wifi0" and include all "wifi0XY", rather than having
a group per pin.

> +	qca_mux_wifi11,

"wifi1"

> +	qca_mux_atest_char3,
> +	qca_mux_pmu0,
> +	qca_mux_boot8,
> +	qca_mux_tm1,
> +	qca_mux_atest_char2,
> +	qca_mux_pmu1,
> +	qca_mux_boot9,
> +	qca_mux_tm2,
> +	qca_mux_atest_char1,
> +	qca_mux_tm_ack,
> +	qca_mux_wifi03,
> +	qca_mux_wifi13,
> +	qca_mux_qpic_pad4,

Please keep an eye on the ipq8074 patch from Varadarajan and make this
follow the same scheme.

> +	qca_mux_atest_char0,
> +	qca_mux_tm3,
> +	qca_mux_wifi02,
> +	qca_mux_wifi12,
> +	qca_mux_qpic_pad5,
> +	qca_mux_smart3,
> +	qca_mux_wcss0_dbg14,

Please squash these into "wcss0_dbg"

> +	qca_mux_tm4,
> +	qca_mux_wifi04,
> +	qca_mux_wifi14,
> +	qca_mux_qpic_pad6,
> +	qca_mux_wcss0_dbg15,
> +	qca_mux_qdss_tracectl_a,
> +	qca_mux_boot18,

Do you know what the "boot" function is and what 2, 4, 5, 7, 8, 9 11,
14, 18, 19 and 20 means?

[..]
> +	qca_mux_sdio0,

There are 8 of these, so that's more likely the 8 data pins in a single
function. Please squash them into "sdio_data".

Regards,
Bjorn
