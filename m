From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] ARM: sa1100: refactor sa1100 serial driver
Date: Sun, 20 Nov 2011 12:47:48 -0800
Message-ID: <1321822068.17619.3.camel@Joe-Laptop>
References: <1321821127-32231-1-git-send-email-jochen@scram.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1321821127-32231-1-git-send-email-jochen@scram.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jochen Friedrich <jochen@scram.de>
Cc: devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sun, 2011-11-20 at 21:32 +0100, Jochen Friedrich wrote:
> - move pin initialization into board files
> - make use of resources in platform device
>   rather than hardcoding them in the driver
> - add DT support

trivia:

> diff --git a/arch/arm/mach-sa1100/generic.c b/arch/arm/mach-sa1100/generic.c
[]
> @@ -166,7 +166,7 @@ static struct platform_device sa11x0udc_device = {
>  static struct resource sa11x0uart1_resources[] = {
>  	[0] = {
>  		.start	= __PREG(Ser1UTCR0),
> -		.end	= __PREG(Ser1UTCR0) + 0xffff,
> +		.end	= __PREG(Ser1UTCR0) + 0x24,

#define for 0x24? or is it really 0x23?
(start + size - 1)

> @@ -178,15 +178,35 @@ static struct resource sa11x0uart1_resources[] = {
[]
> +static struct resource sa11x0uart2_resources[] = {
> +	[0] = {
> +		.start	= __PREG(Ser2UTCR0),
> +		.end	= __PREG(Ser2UTCR0) + 0x24,

here too

> +static struct platform_device sa11x0uart2_device = {
> +	.name		= "sa11x0-uart",
> +	.id		= -1,
> +	.num_resources	= ARRAY_SIZE(sa11x0uart2_resources),
> +	.resource	= sa11x0uart2_resources,
> +};
> +
>  static struct resource sa11x0uart3_resources[] = {
>  	[0] = {
>  		.start	= __PREG(Ser3UTCR0),
> -		.end	= __PREG(Ser3UTCR0) + 0xffff,
> +		.end	= __PREG(Ser3UTCR0) + 0x24,

etc
