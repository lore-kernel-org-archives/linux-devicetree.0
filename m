From: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH] OF: Add a warning in case chosen node is not present
Date: Sun, 11 Nov 2018 13:52:06 -0800 (PST)
Message-ID: <mhng-e3979636-81f8-42d6-b810-eeed6786d4bb@palmer-si-x1c4>
References: <20181110005317.5631-1-mick@ics.forth.gr>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181110005317.5631-1-mick@ics.forth.gr>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
Cc: mick@ics.forth.gr, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, robh+dt@kernel.org, frowand.list@gmail.com
List-Id: devicetree@vger.kernel.org

On Fri, 09 Nov 2018 16:53:17 PST (-0800), mick@ics.forth.gr wrote:
> On architectures that only get their bootargs through devicetree's
> chosen node (such as RISC-V), that node is mandatory. After a
> discussion with Rob [1] I'm adding a warning in case chosen node
> is not present, to let users know about it.
>
> [1]: https://patchwork.ozlabs.org/patch/984224/#2016136
>
> Signed-off-by: Nick Kossifidis <mick@ics.forth.gr>
> ---
>  drivers/of/fdt.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index bb532aae0d92..7ff67bf1f6d6 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -1200,8 +1200,12 @@ bool __init early_init_dt_verify(void *params)
>
>  void __init early_init_dt_scan_nodes(void)
>  {
> +	int rc = 0;
> +
>  	/* Retrieve various information from the /chosen node */
> -	of_scan_flat_dt(early_init_dt_scan_chosen, boot_command_line);
> +	rc = of_scan_flat_dt(early_init_dt_scan_chosen, boot_command_line);
> +	if (!rc)
> +		pr_warn("No chosen node found, continuing without\n");
>
>  	/* Initialize {size,address}-cells info */
>  	of_scan_flat_dt(early_init_dt_scan_root, NULL);

Thanks!  Note that in our case we actually ignore the built-in boot arguments 
without a /chosen node, which isn't clear to me from the message.  I'm not sure 
if it's sane to warn everyone of this, but it was decided that RISC-V should 
have this behavior because it's all standard code.

In other words, it might be worth adding some sort of 

    #ifdef CONFIG_CMDLINE
        pr_warn("Due to the lack of a /chosen node, we're also ignoring your builtin kernel command-line\n");
    #endif

though that wording is, of course, a bit poor :).

Either way, 

Reviewed-by: Palmer Dabbelt <palmer@sifive.com>

as this is better than nothing!  Now I can just point users to the error and 
tell them that, obviously, they should know what it means --  I just hope I can 
remember :)
