From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH v4 4/6] pinctrl: st: Use ARRAY_SIZE instead of raw value
 for number of delays
Date: Wed, 12 Mar 2014 07:25:13 -0700
Message-ID: <1394634313.28839.57.camel@joe-AO722>
References: <1394614210-15698-1-git-send-email-maxime.coquelin@st.com>
	 <1394614210-15698-5-git-send-email-maxime.coquelin@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1394614210-15698-5-git-send-email-maxime.coquelin@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime COQUELIN <maxime.coquelin@st.com>
Cc: Rob Landley <rob@landley.net>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Srinivas Kandagatla <srinivas.kandagatla@st.com>, Stuart Menefy <stuart.menefy@st.com>, Linus Walleij <linus.walleij@linaro.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@stlinux.com, lee.jones@linaro.org
List-Id: devicetree@vger.kernel.org

On Wed, 2014-03-12 at 09:50 +0100, Maxime COQUELIN wrote:
> This patch replaces the raw values with ARRAY_SIZE for assigning the
> ninput_delays and noutput_delays fields of STiH416's st_pctl_data struct.

trivial note:

> diff --git a/drivers/pinctrl/pinctrl-st.c b/drivers/pinctrl/pinctrl-st.c
[]
> @@ -384,9 +384,9 @@ static unsigned int stih416_delays[] = {0, 300, 500, 750, 1000, 1250, 1500,
>  static const struct st_pctl_data  stih416_data = {
>  	.rt_style	= st_retime_style_dedicated,
>  	.input_delays	= stih416_delays,
> -	.ninput_delays	= 14,
> +	.ninput_delays	= ARRAY_SIZE(stih416_delays),
>  	.output_delays	= stih416_delays,
> -	.noutput_delays = 14,
> +	.noutput_delays = ARRAY_SIZE(stih416_delays),
>  	.alt = 0, .oe = 40, .pu = 50, .od = 60, .rt = 100,
>  };
>  

drivers/pinctrl/pinctrl-st.c-   unsigned int    *input_delays;
drivers/pinctrl/pinctrl-st.c-   unsigned int    *output_delays;

It may be better to change these to const unsigned int *
and change

static unsigned int stih416_delays[] = {

to static const
