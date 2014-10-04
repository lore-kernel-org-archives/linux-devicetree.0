From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: Re: [RFC 5/7] soc: qcom: Add Shared Memory Driver
Date: Fri, 3 Oct 2014 17:02:50 -0700
Message-ID: <20141004000249.GD28481@sonymobile.com>
References: <1412037291-16880-1-git-send-email-bjorn.andersson@sonymobile.com>
 <1412037291-16880-6-git-send-email-bjorn.andersson@sonymobile.com>
 <542DD3DA.1010909@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <542DD3DA.1010909@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Kumar Gala <galak@codeaurora.org>, Andy Gross <agross@codeaurora.org>, Arnd Bergmann <arnd@arndb.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Samuel Ortiz <sameo@linux.intel.com>
List-Id: devicetree@vger.kernel.org

On Thu 02 Oct 15:38 PDT 2014, Stephen Boyd wrote:

> On 09/29/14 17:34, Bjorn Andersson wrote:
> > +
> > +#define GET_RX_CHANNEL_INFO(channel, param) \
> > +	(channel->rx_info_word ? \
> > +		channel->rx_info_word->param : \
> > +		channel->rx_info->param)
> > +
> > +#define GET_TX_CHANNEL_INFO(channel, param) \
> > +	(channel->rx_info_word ? \
> > +		channel->tx_info_word->param : \
> > +		channel->tx_info->param)
> > +
> > +#define SET_RX_CHANNEL_INFO(channel, param, value) \
> > +	(channel->rx_info_word ? \
> > +		(channel->rx_info_word->param = value) : \
> > +		(channel->rx_info->param = value))
> > +
> > +#define SET_TX_CHANNEL_INFO(channel, param, value) \
> > +	(channel->rx_info_word ? \
> 
> Drive-by review: Should this be tx_info_word? Given that it works I
> wonder why not just have a flag indicating if we should use word aligned
> read/write vs. byte aligned.
> 

You're right, that should be tx - but from the way things both channels will
always be of the same type, so it will simply work.

I had a separate flag, but instead of having 4 members in the struct to
indicate if I was dealing with word aligned access I had 5. So I dropped it.

> > +		(channel->tx_info_word->param = value) : \
> > +		(channel->tx_info->param = value))
> > +
> 

Regards,
Bjorn
