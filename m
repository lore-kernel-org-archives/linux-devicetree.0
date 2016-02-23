From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6] mtd: support BB SRAM on ICP DAS LP-8x4x
Date: Tue, 23 Feb 2016 13:48:29 -0600
Message-ID: <20160223194829.GA20334@rob-hp-laptop>
References: <1450205941-15593-1-git-send-email-ynvich@gmail.com>
 <1456253890-30825-1-git-send-email-ynvich@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1456253890-30825-1-git-send-email-ynvich-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Ianovich <ynvich-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, Neelesh Gupta <neelegup-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, Cyril Bur <cyrilbur-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:MEMORY TECHNOLOGY DEVICES [MTD]" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 23, 2016 at 09:58:01PM +0300, Sergei Ianovich wrote:
> This provides an MTD device driver for 512kB of battery backed up SRAM
> on ICPDAS LP-8X4X programmable automation controllers.
> 
> SRAM chip is connected via FPGA and is not accessible without a driver,
> unlike flash memory which is wired to CPU MMU.
> 
> This SRAM becomes an excellent persisent storage of volatile process
> data like counter values and sensor statuses. Storing those data in
> flash or mmc card is not a viable solution.
> 
> Signed-off-by: Sergei Ianovich <ynvich-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Reviewed-by: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> CC: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> 
>    v5..v6
>    * replace wildcards in compatible and module name
>    * drop obsolete mtd_part_parser_data.of_node
> 
>    v4..v5
>    * remove .owner from struct platform_driver
>    * constify struct of_device_id
>     for further Brian Norris comments:
>    * drop unused property from doc file
>    * move defconfig update to a different file
>    * drop extra match w/ of_match_device()
> 
>    v3..v4 for Brian Norris 'Reviewed-by'
>    * add doc file for DT binding
>    * move DTS binding to a different patch (8/21)
>    * drop unused include directive
>    * drop safely unused callback
>    * drop non-default partion probe types
>    * drop duplicate error checks
>    * drop duplicate error reporting
>    * fixed error message on MTD registeration
>    * fixed module removal routine
> 
>    v2..v3
>    * no changes (except number 08/16 -> 10/21)
> 
>    v0..v2
>    * use device tree
>    * use devm helpers where possible
> ---
>  .../devicetree/bindings/mtd/icpdas-lp8841-sram.txt |  23 +++

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

>  drivers/mtd/devices/Kconfig                        |  14 ++
>  drivers/mtd/devices/Makefile                       |   1 +
>  drivers/mtd/devices/sram_lp8841.c                  | 198 +++++++++++++++++++++
>  4 files changed, 236 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/icpdas-lp8841-sram.txt
>  create mode 100644 drivers/mtd/devices/sram_lp8841.c
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
