From: John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH 28/28] mips: use common of_flat_dt_get_machine_name
Date: Tue, 17 Sep 2013 06:32:34 +0200
Message-ID: <5237DB62.2060303@phrozen.org>
References: <1379372965-22359-1-git-send-email-robherring2@gmail.com> <1379372965-22359-29-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1379372965-22359-29-git-send-email-robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 17/09/13 01:09, Rob Herring wrote:
> From: Rob Herring<rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
>
> Convert mips to use the common of_flat_dt_get_machine_name function.
>
> Signed-off-by: Rob Herring<rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> Cc: Ralf Baechle<ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
> Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
> ---


Acked-by: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>


Thanks for this series ...



>   arch/mips/kernel/prom.c | 15 +--------------
>   1 file changed, 1 insertion(+), 14 deletions(-)
>
> diff --git a/arch/mips/kernel/prom.c b/arch/mips/kernel/prom.c
> index 0b2485f..3c3b0df 100644
> --- a/arch/mips/kernel/prom.c
> +++ b/arch/mips/kernel/prom.c
> @@ -47,24 +47,11 @@ void * __init early_init_dt_alloc_memory_arch(u64 size, u64 align)
>   	return __alloc_bootmem(size, align, __pa(MAX_DMA_ADDRESS));
>   }
>
> -int __init early_init_dt_scan_model(unsigned long node,	const char *uname,
> -				    int depth, void *data)
> -{
> -	if (!depth) {
> -		char *model = of_get_flat_dt_prop(node, "model", NULL);
> -
> -		if (model)
> -			mips_set_machine_name(model);
> -	}
> -	return 0;
> -}
> -
>   void __init __dt_setup_arch(struct boot_param_header *bph)
>   {
>   	if (!early_init_dt_scan(bph))
>   		return;
>
> -	/* try to load the mips machine name */
> -	of_scan_flat_dt(early_init_dt_scan_model, NULL);
> +	mips_set_machine_name(of_flat_dt_get_machine_name());
>   }
>   #endif

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
