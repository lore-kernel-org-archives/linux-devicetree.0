From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: aspeed-lpc: Document LPC Host
 Interface Controller
Date: Wed, 7 Mar 2018 13:13:27 +0000
Message-ID: <20180307131327.u2tvgabim62zeb6a@dell>
References: <20180219072422.22733-1-joel@jms.id.au>
 <20180219072422.22733-2-joel@jms.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180219072422.22733-2-joel@jms.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Joel Stanley <joel@jms.id.au>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>, Cyril Bur <cyrilbur@gmail.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Ryan Chen <ryan_chen@aspeedtech.com>, Lei YU <mine260309@gmail.com>
List-Id: devicetree@vger.kernel.org

On Mon, 19 Feb 2018, Joel Stanley wrote:

> The LPC Host Interface Controller is part of a BMC SoC that is used for
> communication with the host.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> v2:
>  - Move the content to below the Host Node Children heading
>  - Add Rob's review tag
> ---
>  .../devicetree/bindings/mfd/aspeed-lpc.txt         | 41 ++++++++++++++++++++++
>  1 file changed, 41 insertions(+)

Applied, thanks.

-- 
Lee Jones
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
