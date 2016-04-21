From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH] of: document refcount incrementation of of_get_cpu_node()
Date: Thu, 21 Apr 2016 16:02:41 -0700
Message-ID: <57195C11.8080609@gmail.com>
References: <1461115126-2648-1-git-send-email-yamada.masahiro@socionext.com>
Reply-To: frowand.list@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1461115126-2648-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: devicetree@vger.kernel.org, Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

On 4/19/2016 6:18 PM, Masahiro Yamada wrote:
> This function increments refcount.  This is worth noting.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>  drivers/of/base.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index b299de2..365e1c02 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -394,7 +394,8 @@ bool __weak arch_find_n_match_cpu_physical_id(struct device_node *cpun,
>   * before booting secondary cores. This function uses arch_match_cpu_phys_id
>   * which can be overridden by architecture specific implementation.
>   *
> - * Returns a node pointer for the logical cpu if found, else NULL.
> + * Returns a node pointer for the logical cpu with refcount incremented, use
> + * of_node_put() on it when done. Returns NULL if not found.
>   */
>  struct device_node *of_get_cpu_node(int cpu, unsigned int *thread)
>  {
> 

Nice catch.

Reviewed-by: Frank Rowand <frank.rowand@am.sony.com>
