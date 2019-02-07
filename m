From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3] dt-bindings: aspeed-lpc: Make parameter optional
Date: Thu, 7 Feb 2019 07:47:57 +0000
Message-ID: <20190207074757.GA4672@dell>
References: <20190129230538.1044378-1-vijaykhemka@fb.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190129230538.1044378-1-vijaykhemka@fb.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vijay Khemka <vijaykhemka@fb.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

On Tue, 29 Jan 2019, Vijay Khemka wrote:

> Memory-region and flash phandle is not a required parameter, it is
> optional to describe in device tree and needed only use basis.
> 
> Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
> ---
>  Documentation/devicetree/bindings/mfd/aspeed-lpc.txt | 2 ++
>  1 file changed, 2 insertions(+)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
