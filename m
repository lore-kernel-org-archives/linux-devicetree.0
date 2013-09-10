From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] drivers: of: fix build break if asm/dma-contiguous.h
 is missing
Date: Tue, 10 Sep 2013 06:39:57 -0700
Message-ID: <522F212D.3010208@roeck-us.net>
References: <1378804400-31716-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1378804400-31716-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org, devicetree@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Michal Nazarewicz <mina86@mina86.com>, Grant Likely <grant.likely@secretlab.ca>, Tomasz Figa <t.figa@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Sascha Hauer <s.hauer@pengutronix.de>, Laura Abbott <lauraa@codeaurora.org>, Rob Herring <robherring2@gmail.com>, Olof Johansson <olof@lixom.net>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, Tomasz Figa <tomasz.figa@gmail.com>, Kumar Gala <galak@codeaurora.org>, Nishanth Peethambaran <nishanth.p@gmail.com>, Marc <marc.ceeeee@gmail.com>
List-Id: devicetree@vger.kernel.org

On 09/10/2013 02:13 AM, Marek Szyprowski wrote:
> It is not needed to include asm/dma-contiguous.h header to compile
> reserved memory initialization code, so remove it to avoid build break
> on architectures without CMA support.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Tested-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/of/of_reserved_mem.c |    2 --
>   1 file changed, 2 deletions(-)
>
> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
> index a754b84..0fe40c7 100644
> --- a/drivers/of/of_reserved_mem.c
> +++ b/drivers/of/of_reserved_mem.c
> @@ -11,8 +11,6 @@
>    * License or (at your optional) any later version of the license.
>    */
>
> -#include <asm/dma-contiguous.h>
> -
>   #include <linux/memblock.h>
>   #include <linux/err.h>
>   #include <linux/of.h>
>
