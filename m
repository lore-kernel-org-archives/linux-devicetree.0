Return-Path: <SRS0=6+2I=J5=gmail.com=frowand.list@kernel.org>
Subject: Re: [PATCH] of: Export of_node_ktype
References: <20180713151450.2098-1-alexander.sverdlin@nokia.com>
From: Frank Rowand <frowand.list@gmail.com>
Message-ID: <8140ab69-3fa4-b448-0507-7b038f1d8b7b@gmail.com>
Date: Fri, 13 Jul 2018 09:05:42 -0700
MIME-Version: 1.0
In-Reply-To: <20180713151450.2098-1-alexander.sverdlin@nokia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Alexander Sverdlin <alexander.sverdlin@nokia.com>, devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Alexander,

On 07/13/18 08:14, Alexander Sverdlin wrote:
> This is necessary for of_node_init() to work in modules.
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> ---
>  drivers/of/kobj.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/of/kobj.c b/drivers/of/kobj.c
> index 7a0a18980b98..6348174ff615 100644
> --- a/drivers/of/kobj.c
> +++ b/drivers/of/kobj.c
> @@ -27,6 +27,7 @@ static void of_node_release(struct kobject *kobj)
>  struct kobj_type of_node_ktype = {
>  	.release = of_node_release,
>  };
> +EXPORT_SYMBOL_GPL(of_node_ktype);
>  
>  static ssize_t of_node_property_read(struct file *filp, struct kobject *kobj,
>  				struct bin_attribute *bin_attr, char *buf,
> 

I would not expect a generic module to need of_node_init().  So digging a
little bit deeper, what module needs of_node_init() and how is it using it?

Thanks,

Frank
