From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net-next v5 2/2] net: ethernet: socionext: add AVE
 ethernet driver
Date: Mon, 11 Dec 2017 09:35:20 -0500 (EST)
Message-ID: <20171211.093520.1509647114338216500.davem@davemloft.net>
References: <1512979049-15930-1-git-send-email-hayashi.kunihiko@socionext.com>
        <1512979049-15930-3-git-send-email-hayashi.kunihiko@socionext.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1512979049-15930-3-git-send-email-hayashi.kunihiko@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: hayashi.kunihiko@socionext.com
Cc: netdev@vger.kernel.org, andrew@lunn.ch, f.fainelli@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, yamada.masahiro@socionext.com, masami.hiramatsu@linaro.org, jaswinder.singh@linaro.org
List-Id: devicetree@vger.kernel.org

From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Date: Mon, 11 Dec 2017 16:57:29 +0900

> +static inline u32 ave_desc_read(struct net_device *ndev, enum desc_id id,
> +				int entry, int offset)

Do not use inline functions in foo.c files, let the compiler decide what
to do.

Thank you.
