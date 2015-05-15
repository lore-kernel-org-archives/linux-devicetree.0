From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/4] edac, altera: Generalize driver to use DT Memory size
Date: Fri, 15 May 2015 13:00:42 +0200
Message-ID: <2878194.MyPRW1b9ti@wuerfel>
References: <1431553787-27741-1-git-send-email-tthayer@opensource.altera.com> <1431553787-27741-2-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1431553787-27741-2-git-send-email-tthayer@opensource.altera.com>
Sender: linux-doc-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: tthayer@opensource.altera.com, bp@alien8.de, dougthompson@xmission.com, m.chehab@samsung.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, dinguyen@opensource.altera.com, grant.likely@linaro.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, tthayer.linux@gmail.com, linux-edac@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wednesday 13 May 2015 16:49:44 tthayer@opensource.altera.com wrote:
> -static u32 altr_sdram_get_total_mem_size(struct regmap *mc_vbase)
> +/* Get total memory size from Open Firmware DTB */
> +static unsigned long get_total_mem(void)
>  {
> -       u32 size, read_reg, row, bank, col, cs, width;
> +       struct device_node *np = NULL;
> +       const unsigned int *reg, *reg_end;
> +       int len, sw, aw;
> +       unsigned long start, size, total_mem;
>  
> -       if (regmap_read(mc_vbase, DRAMADDRW_OFST, &read_reg) < 0)
> +       np = of_find_node_by_type(NULL, "memory");
> +       if (!np)
>                 return 0;

There can be multiple memory nodes, I think you need to have a loop
using for_each_node_by_type.


	Arnd
