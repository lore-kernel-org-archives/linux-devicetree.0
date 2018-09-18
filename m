From: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH 14/21] riscv: use for_each_of_cpu_node iterator
Date: Tue, 18 Sep 2018 15:53:21 -0700 (PDT)
Message-ID: <mhng-bec6b34b-dd05-410f-bbd2-3a60a196615d@palmer-si-x1c4>
References: <20180905193738.19325-15-robh@kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180905193738.19325-15-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, 05 Sep 2018 12:37:31 PDT (-0700), robh@kernel.org wrote:
> Use the for_each_of_cpu_node iterator to iterate over cpu nodes. This
> has the side effect of defaulting to iterating using "cpu" node names in
> preference to the deprecated (for FDT) device_type == "cpu".
>
> Cc: Palmer Dabbelt <palmer@sifive.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: linux-riscv@lists.infradead.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Please ack and I will take via the DT tree. This is dependent on the
> first 2 patches.
>
>  arch/riscv/kernel/smpboot.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
> index 56abab6a9812..3c59afe67951 100644
> --- a/arch/riscv/kernel/smpboot.c
> +++ b/arch/riscv/kernel/smpboot.c
> @@ -52,7 +52,7 @@ void __init setup_smp(void)
>  	struct device_node *dn = NULL;
>  	int hart, im_okay_therefore_i_am = 0;
>
> -	while ((dn = of_find_node_by_type(dn, "cpu"))) {
> +	for_each_of_cpu_node(dn) {
>  		hart = riscv_of_processor_hart(dn);
>  		if (hart >= 0) {
>  			set_cpu_possible(hart, true);

Acked-by: Palmer Dabbelt <palmer@sifive.com>

Thanks!
