From: David Miller <davem@davemloft.net>
Subject: Re: [PATCHv5 2/3] net: socionext: Add Synquacer NetSec driver
Date: Wed, 03 Jan 2018 10:35:46 -0500 (EST)
Message-ID: <20180103.103546.528269429969753470.davem@davemloft.net>
References: <1514783559-4226-1-git-send-email-jassisinghbrar@gmail.com>
        <1514783689-4352-1-git-send-email-jassisinghbrar@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1514783689-4352-1-git-send-email-jassisinghbrar@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: jassisinghbrar@gmail.com
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, arnd.bergmann@linaro.org, andrew@lunn.ch, ard.biesheuvel@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, masami.hiramatsu@linaro.org, jaswinder.singh@linaro.org
List-Id: devicetree@vger.kernel.org

From: jassisinghbrar@gmail.com
Date: Mon,  1 Jan 2018 10:44:49 +0530

> +#define DRING_TAIL(r)		((r)->tail)
> +
> +#define DRING_HEAD(r)		((r)->head)

These macros do not help readability at all.

> +#define MOVE_TAIL(r)		do { \
> +					if (++(r)->tail == DESC_NUM) \
> +						(r)->tail = 0; \
> +				} while (0)
> +
> +#define MOVE_HEAD(r)		do { \
> +					if (++(r)->head == DESC_NUM) \
> +						(r)->head = 0; \
> +				} while (0)
> +
> +#define JUMP_HEAD(r, n)	do { \
> +					int i; \
> +					for (i = 0; i < (n); i++) \
> +						MOVE_HEAD(r); \
> +				} while (0)

Neither do these.

And JUMP_HEAD is so inefficient, it's a constant time calculation:

	r->head += n;
	if (r->head >= DESC_NUM)
		r->head -= DESC_NUM;

All of this stuff can be done inline without all of these CPP macros
which are discouraged, have multiple evaluation issues, and decrease
the amount of type checking going on.

If you absolutely must have helpers, use static functions (without
the inline keyword, let the compiler device).

> +static inline int available_descs(struct netsec_desc_ring *r)

No inline functions in foo.c files, let the compiler device.

> +/*************************************************************/
> +/*********************** NETDEV_OPS **************************/
> +/*************************************************************/

Please, comments are not billboards or Star Wars openning sequences.
Simplify this, thank you.

> +
> +static void netsec_set_tx_de(struct netsec_priv *priv,
> +			     struct netsec_desc_ring *dring,
> +			     const struct netsec_tx_pkt_ctrl *tx_ctrl,
> +			     const struct netsec_desc *desc,
> +			     struct sk_buff *skb)
> +{
> +	struct netsec_de *de;
> +	int idx = DRING_HEAD(dring);
> +	u32 attr;

Please order local variables from longest to shortest line.

Please audit your entire submission for this issue.

Thank you.
