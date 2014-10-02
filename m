From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [RFC 5/7] soc: qcom: Add Shared Memory Driver
Date: Thu, 02 Oct 2014 15:38:18 -0700
Message-ID: <542DD3DA.1010909@codeaurora.org>
References: <1412037291-16880-1-git-send-email-bjorn.andersson@sonymobile.com> <1412037291-16880-6-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1412037291-16880-6-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>, Kumar Gala <galak@codeaurora.org>, Andy Gross <agross@codeaurora.org>, Arnd Bergmann <arnd@arndb.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Grant Likely <grant.likely@linaro.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Samuel Ortiz <sameo@linux.intel.com>
List-Id: devicetree@vger.kernel.org

On 09/29/14 17:34, Bjorn Andersson wrote:
> +
> +#define GET_RX_CHANNEL_INFO(channel, param) \
> +	(channel->rx_info_word ? \
> +		channel->rx_info_word->param : \
> +		channel->rx_info->param)
> +
> +#define GET_TX_CHANNEL_INFO(channel, param) \
> +	(channel->rx_info_word ? \
> +		channel->tx_info_word->param : \
> +		channel->tx_info->param)
> +
> +#define SET_RX_CHANNEL_INFO(channel, param, value) \
> +	(channel->rx_info_word ? \
> +		(channel->rx_info_word->param = value) : \
> +		(channel->rx_info->param = value))
> +
> +#define SET_TX_CHANNEL_INFO(channel, param, value) \
> +	(channel->rx_info_word ? \

Drive-by review: Should this be tx_info_word? Given that it works I
wonder why not just have a flag indicating if we should use word aligned
read/write vs. byte aligned.

> +		(channel->tx_info_word->param = value) : \
> +		(channel->tx_info->param = value))
> +


-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
