From: Marc C <marc.ceeeee@gmail.com>
Subject: Re: [RFC/PATCH v2 2/2] drivers: dma-contiguous: add initialization
 from device tree
Date: Mon, 29 Apr 2013 14:21:49 -0700
Message-ID: <CAO1A-8DiZoMVGcjOqK6VYP5Qito55i=gsKApQM=LGbQVx3iCwg@mail.gmail.com>
References: <1365679330-2514-1-git-send-email-m.szyprowski@samsung.com>
 <1365679330-2514-3-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1365679330-2514-3-git-send-email-m.szyprowski@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Sascha Hauer <s.hauer@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>, devicetree-discuss@lists.ozlabs.org, Nishanth Peethambaran <nishanth.p@gmail.com>, Michal Nazarewicz <mina86@mina86.com>, linaro-mm-sig@lists.linaro.org, Kyungmin Park <kyungmin.park@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Olof Johansson <olof@lixom.net>, Laura Abbott <lauraa@codeaurora.org>, Tomasz Figa <t.figa@samsung.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

>  /**
>   * dma_contiguous_reserve() - reserve area(s) for contiguous memory handling
>   * @limit: End address of the reserved memory (optional, 0 for any).
> @@ -149,6 +200,10 @@ void __init dma_contiguous_reserve(phys_addr_t limit)
>
>         pr_debug("%s(limit %08lx)\n", __func__, (unsigned long)limit);
>
> +#ifdef CONFIG_OF
> +       of_scan_flat_dt(cma_fdt_scan, NULL);
> +#endif
> +

What is your expectation with the contention between default region
setup via the kernel config (CONFIG_CMA_SIZE_SEL_*) and via the DT?
Could the call to 'of_scan_flat_dt()' be done before the setup of the
kernel config early regions, followed by a return code check
'fail-over' scheme, or were you intending for the default region
setups to be mutually-exclusive?

Thanks,
Marc
