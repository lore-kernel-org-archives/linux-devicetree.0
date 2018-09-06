From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH 18/21] edac: cpc925: use for_each_of_cpu_node iterator
Date: Thu, 6 Sep 2018 10:35:06 +0200
Message-ID: <20180906083506.GA10768@zn.tnic>
References: <20180905193738.19325-1-robh@kernel.org>
 <20180905193738.19325-19-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180905193738.19325-19-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-edac@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 05, 2018 at 02:37:35PM -0500, Rob Herring wrote:
> Use the for_each_of_cpu_node iterator to iterate over cpu nodes. This
> has the side effect of defaulting to iterating using "cpu" node names in
> preference to the deprecated (for FDT) device_type == "cpu".
> 
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: linux-edac@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Please ack and I will take via the DT tree. This is dependent on the
> first 2 patches.

Completely unknown territory for me so I'd trust your judgement. Staring
at 1/21, the conversion looks ok except the removal of those prints that
a cpu nodes are not present - I wonder if they even meant anything or
were just there during driver development...

>  drivers/edac/cpc925_edac.c | 20 ++------------------
>  1 file changed, 2 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/edac/cpc925_edac.c b/drivers/edac/cpc925_edac.c
> index 2c98e020df05..3c0881ac9880 100644
> --- a/drivers/edac/cpc925_edac.c
> +++ b/drivers/edac/cpc925_edac.c
> @@ -593,8 +593,7 @@ static void cpc925_mc_check(struct mem_ctl_info *mci)
>  /******************** CPU err device********************************/
>  static u32 cpc925_cpu_mask_disabled(void)
>  {
> -	struct device_node *cpus;
> -	struct device_node *cpunode = NULL;
> +	struct device_node *cpunode;
>  	static u32 mask = 0;
> 
>  	/* use cached value if available */
> @@ -603,20 +602,8 @@ static u32 cpc925_cpu_mask_disabled(void)
> 
>  	mask = APIMASK_ADI0 | APIMASK_ADI1;
> 
> -	cpus = of_find_node_by_path("/cpus");
> -	if (cpus == NULL) {
> -		cpc925_printk(KERN_DEBUG, "No /cpus node !\n");

This thing...

> -		return 0;
> -	}
> -
> -	while ((cpunode = of_get_next_child(cpus, cpunode)) != NULL) {
> +	for_each_of_cpu_node(cpunode) {
>  		const u32 *reg = of_get_property(cpunode, "reg", NULL);
> -
> -		if (strcmp(cpunode->type, "cpu")) {
> -			cpc925_printk(KERN_ERR, "Not a cpu node in /cpus: %s\n", cpunode->name);

... and this thing.

Thx.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
