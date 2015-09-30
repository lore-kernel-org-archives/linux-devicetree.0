From: Alexander Popov <alex.popov@linux.com>
Subject: Re: [PATCH v3 1/3] powerpc/512x: add LocalPlus Bus FIFO device driver
Date: Thu, 1 Oct 2015 00:24:53 +0300
Message-ID: <560C5325.6070406@linux.com>
References: <1443115737-3948-1-git-send-email-alex.popov@linux.com>
 <1443115737-3948-2-git-send-email-alex.popov@linux.com>
 <56049CD0.7080104@tabi.org>
Reply-To: alex.popov@linux.com
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56049CD0.7080104@tabi.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Timur Tabi <timur@tabi.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Anatolij Gustschin <agust@denx.de>, Rob Herring <robh@kernel.org>, Grant Likely <grant.likely@linaro.org>, Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vinod.koul@intel.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linuxppc-dev@lists.ozlabs.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Popov <alex.popov@linux.com>
List-Id: devicetree@vger.kernel.org

Hello Timur, thanks again for your review.

On 25.09.2015 04:01, Timur Tabi wrote:
> Alexander Popov wrote:
>> +
>> +    for (i = 0; i < lpbfifo.cs_n; i++) {
>> +        phys_addr_t cs_start;
>> +        phys_addr_t cs_end;
>> +
>> +        cs_start = lpbfifo.cs_ranges[i].addr;
>> +        cs_end = cs_start + lpbfifo.cs_ranges[i].size - 1;
>> +
>> +        if (lpbfifo.req->bus_phys >= cs_start &&
>> +            lpbfifo.req->bus_phys + lpbfifo.req->size - 1 <= cs_end) {
>> +            cs = lpbfifo.cs_ranges[i].csnum;
>> +            break;
>> +        }
>> +    }
>> +    if (i == lpbfifo.cs_n) {
> 
> Can you test for "!cs" here instead?
> 
>> +        e = -EFAULT;
>> +        goto err_param;
>> +    }

Unfortunately no: 0 is a valid value for Chip Select.
Is it OK to leave it like that?

>> +
>> +    /* 2. Prepare DMA */
>> +    dma_dev = lpbfifo.chan->device;
>> +
>> +    sg_init_table(&sg, 1);
>> +    if (lpbfifo.req->dir == MPC512X_LPBFIFO_REQ_DIR_WRITE)
>> +        dir = DMA_TO_DEVICE;
>> +    else
>> +        dir = DMA_FROM_DEVICE;
>> +    sg_dma_address(&sg) = dma_map_single(dma_dev->dev,
>> +            lpbfifo.req->ram_virt, lpbfifo.req->size, dir);
>> +    if (dma_mapping_error(dma_dev->dev, sg_dma_address(&sg))) {
>> +        e = -EFAULT;
>> +        goto err_param;
>> +    }
>> +    lpbfifo.ram_bus_addr = sg_dma_address(&sg); /* For freeing later */
>> +    sg_dma_len(&sg) = lpbfifo.req->size;
> 
> I don't think sg_dma_len() is meant to be used as an lvalue.

I've double-checked and found many cases of such usage of this macro.
It seems that I can't avoid it too.

>> +    /*
>> +     * The node defined as compatible with 'fsl,mpc5121-localbus'
>> +     * should have 2 address cells and 1 size cell.
>> +     * One item of its ranges property should consist of:
>> +     * - the first address cell which is the chipselect number;
>> +     * - the second address cell which is the offset in the chipselect,
>> +     *    must be zero.
>> +     * - CPU address of the beginning of an access window;
>> +     * - the only size cell which is the size of an access window.
>> +     */
>> +    addr_cells_p = of_get_property(lb_node, "#address-cells", NULL);
>> +    size_cells_p = of_get_property(lb_node, "#size-cells", NULL);
>> +    if (addr_cells_p == NULL || *addr_cells_p != 2 ||
>> +                size_cells_p == NULL ||    *size_cells_p != 1) {
>> +        goto end1;
>> +    }
> 
> Is this really necessary?

I'm not sure.

I've found a device tree node compatible with "fsl,mpc5121-localbus"
and I just check the format of "ranges" property before parsing it
because devicetree/bindings/powerpc/fsl/lbc.txt doesn't have details
about it.

Should I blindly assume that this property has 2 address cells and 1 size
cell?

> Can't you use the built-in OF functions for
> parsing ranges? 

I don't see anything to use instead of of_property_count_u32_elems() and
of_property_read_u32_array().

> Driver code that has to parse #address-cells or #size-cells
> is usually wrong.

I would not call it "parsing", I just check whether the dts-file is good.
Anyway, could you give me a clue how to do better?

>> +
>> +    proplen = of_property_count_u32_elems(lb_node, "ranges");
>> +    if (proplen < 0 || proplen % 4 != 0)
>> +        goto end1;
>> +
>> +    lpbfifo.cs_n = proplen / 4;
>> +    lpbfifo.cs_ranges = kcalloc(lpbfifo.cs_n, sizeof(struct cs_range),
>> +                                GFP_KERNEL);
>> +    if (!lpbfifo.cs_ranges)
>> +        goto end1;
>> +
>> +    if (of_property_read_u32_array(lb_node, "ranges",
>> +                (u32 *)lpbfifo.cs_ranges, proplen) != 0) {
>> +        goto end2;
>> +    }
>> +
>> +    for (i = 0; i < lpbfifo.cs_n; i++) {
>> +        if (lpbfifo.cs_ranges[i].base != 0)
>> +            goto end2;
>> +    }
>> +
>> +    res = 0;
>> + end2:
>> +    if (res != 0)
>> +        kfree(lpbfifo.cs_ranges);
>> + end1:
>> +    of_node_put(lb_node);
>> + end0:
>> +    return res;
>> +}

Best regards,
Alexander
