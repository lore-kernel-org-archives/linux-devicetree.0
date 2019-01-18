From: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH] dt-bindings: aspeed-lpc: Make parameter optional
Date: Fri, 18 Jan 2019 14:51:12 +1030
Message-ID: <1547785272.2051152.1637704704.1926B2B5@webmail.messagingengine.com>
References: <20190117190830.824013-1-vijaykhemka@fb.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190117190830.824013-1-vijaykhemka@fb.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Vijay Khemka <vijaykhemka@fb.com>, Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Joel Stanley <joel@jms.id.au>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

Hi Vijay,

On Fri, 18 Jan 2019, at 05:38, Vijay Khemka wrote:
> Memory-region and flash phandle is not a required parameter, it is
> optional to describe in device tree and needed only use basis.
> 
> Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
> ---
>  Documentation/devicetree/bindings/mfd/aspeed-lpc.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt b/
> Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> index 34dd89087cff..ff0cb28903dd 100644
> --- a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> +++ b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> @@ -135,6 +135,10 @@ Required properties:
>  - clocks:	contains a phandle to the syscon node describing the clocks.
>  		There should then be one cell representing the clock to use
>  
> +Optional properties:
> +These below properties are optional and required only if one need to use it
> +through ioctl.

I'd just say "Optional properties". Leave the description off, as we probably
shouldn't be talking about ioctls and such in the bindings.

Andrew

> +
>  - memory-region: A phandle to a reserved_memory region to be used for the LPC
>  		to AHB mapping
>  
> -- 
> 2.17.1
> 
