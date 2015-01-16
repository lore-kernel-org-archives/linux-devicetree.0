From: Stephen Hemminger <stephen@networkplumber.org>
Subject: Re: [PATCH] ethernet: atheros: Add nss-gmac driver
Date: Thu, 15 Jan 2015 17:56:02 -0800
Message-ID: <20150115175602.0709cb45@urahara>
References: <y>
	<1420754626-30121-1-git-send-email-wstephen@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1420754626-30121-1-git-send-email-wstephen@codeaurora.org>
Sender: netdev-owner@vger.kernel.org
To: Stephen Wang <wstephen@codeaurora.org>
Cc: jcliburn@gmail.com, grant.likely@linaro.org, robh+dt@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu,  8 Jan 2015 14:03:46 -0800
Stephen Wang <wstephen@codeaurora.org> wrote:

> +	uint32_t rx_bytes;		/**< Number of RX bytes */
> +	uint32_t rx_packets;		/**< Number of RX packets */

32 bit packet stats are a problem with lots of traffic.
