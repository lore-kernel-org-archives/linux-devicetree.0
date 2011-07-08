From: Rob Herring <robherring2@gmail.com>
Subject: Re: [RFC PATCH 09/11] arm/dt: Add dt machine definition
Date: Fri, 08 Jul 2011 09:30:15 -0500
Message-ID: <4E171477.8060303@gmail.com>
References: <20110616042653.29371.2052.stgit@ponder> <20110616044248.29371.69457.stgit@ponder>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110616044248.29371.69457.stgit@ponder>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Grant,

On 06/15/2011 11:42 PM, Grant Likely wrote:
> This patch adds a DT_MACHINE_START macro to use instead of
> MACHINE_START when creating a machine_desc that supports using the
> device tree.
> 
> Signed-off-by: Grant Likely <grant.likely@secretlab.ca>
> ---
>  arch/arm/include/asm/mach/arch.h |    9 +++++++++
>  1 files changed, 9 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/include/asm/mach/arch.h b/arch/arm/include/asm/mach/arch.h
> index 946f4d7..858d269 100644
> --- a/arch/arm/include/asm/mach/arch.h
> +++ b/arch/arm/include/asm/mach/arch.h
> @@ -70,4 +70,13 @@ static const struct machine_desc __mach_desc_##_type	\
>  #define MACHINE_END				\
>  };
>  
> +#define MACH_TYPE_DT	0xffffffff
> +
> +#define DT_MACHINE_START(_name, _namestr)		\
> +static const struct machine_desc __mach_desc_##_name	\
> + __used							\
> + __attribute__((__section__(".arch.info.init"))) = {	\
> +	.nr		= MACH_TYPE_DT,			\
> +	.name		= _namestr,
> +
>  #endif
> 

Do you plan to submit this for 3.1 as new platforms need this or a mach id?

Rob
