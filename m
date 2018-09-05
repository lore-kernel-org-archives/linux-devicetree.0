From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH 2/3] of/fdt: avoid re-parsing '#{address,size}-cells' in
 of_fdt_limit_memory
Date: Tue, 4 Sep 2018 18:54:22 -0700
Message-ID: <8b866d4d-1362-311d-5a6e-3e414d8f90ab@gmail.com>
References: <20180830190523.31474-1-robh@kernel.org>
 <20180830190523.31474-3-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180830190523.31474-3-robh@kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 08/30/18 12:05, Rob Herring wrote:
> Now that we initialize dt_root_addr_cells and dt_root_size_cells earlier,
> use them and simplify of_fdt_limit_memory.
> 
> Cc: Frank Rowand <frowand.list@gmail.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/of/fdt.c | 23 +----------------------
>  1 file changed, 1 insertion(+), 22 deletions(-)
> 
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index 49abe18f1bde..fef4b2c8a171 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c

As kbuild test robot noted, of_fdt_limit_memory() will access
__initdata dt_root_addr_cells and __initdata dt_root_size_cells.
A possible (untested) fix would be:

- void of_fdt_limit_memory(int limit)
- {

+ void __init of_fdt_limit_memory(int limit)
+ {


> @@ -44,28 +44,7 @@ void of_fdt_limit_memory(int limit)
>  	int memory;
>  	int len;
>  	const void *val;
> -	int nr_address_cells = OF_ROOT_NODE_ADDR_CELLS_DEFAULT;
> -	int nr_size_cells = OF_ROOT_NODE_SIZE_CELLS_DEFAULT;
> -	const __be32 *addr_prop;
> -	const __be32 *size_prop;
> -	int root_offset;
> -	int cell_size;
> -
> -	root_offset = fdt_path_offset(initial_boot_params, "/");
> -	if (root_offset < 0)
> -		return;
> -
> -	addr_prop = fdt_getprop(initial_boot_params, root_offset,
> -				"#address-cells", NULL);
> -	if (addr_prop)
> -		nr_address_cells = fdt32_to_cpu(*addr_prop);
> -
> -	size_prop = fdt_getprop(initial_boot_params, root_offset,
> -				"#size-cells", NULL);
> -	if (size_prop)
> -		nr_size_cells = fdt32_to_cpu(*size_prop);
> -
> -	cell_size = sizeof(uint32_t)*(nr_address_cells + nr_size_cells);
> +	int cell_size = sizeof(uint32_t)*(dt_root_addr_cells + dt_root_size_cells);
>  
>  	memory = fdt_path_offset(initial_boot_params, "/memory");
>  	if (memory > 0) {
> 
