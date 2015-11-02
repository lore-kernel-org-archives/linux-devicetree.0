From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 27/32] scsi: hisi_sas: add smp protocol support
Date: Mon, 02 Nov 2015 21:29:50 +0100
Message-ID: <4452058.YIXj3BxT1F@wuerfel>
References: <1445868903-183817-1-git-send-email-john.garry@huawei.com> <5633995D.20607@huawei.com> <5637977E.7000704@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-scsi-owner@vger.kernel.org>
In-Reply-To: <5637977E.7000704@huawei.com>
Sender: linux-scsi-owner@vger.kernel.org
To: John Garry <john.garry@huawei.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-scsi@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, JBottomley@odin.com, john.garry2@mail.dcu.ie, linux-kernel@vger.kernel.org, linuxarm@huawei.com, robh+dt@kernel.org, hare@suse.de, galak@codeaurora.org, zhangfei.gao@linaro.org
List-Id: devicetree@vger.kernel.org

On Monday 02 November 2015 17:03:58 John Garry wrote:
> >
> > Can do. Actually sg_req seems only ever has one element:
> > expander.c, smp_execute_task()
> > sg_init_one(&task->smp_task.smp_req, req, req_size);
> >
> >
> I tried replacing with dma_map_single, but I feel the code is not as 
> clean as I need to manually set sg_dma_len() and sg_dma_address():
>      req_len = sg_dma_len(sg_req) = sg_req->length;
>      sg_dma_address(sg_req) = dma_map_single(dev, sg_virt(sg_req),
>                                          req_len, DMA_TO_DEVICE);
>      if (dma_mapping_error(dev, sg_dma_address(sg_req)))
>           return -ENOMEM;
> sg_dma_address(sg_req) is used in another function for unmap.
> 
> opinion?
> 

What I meant was not using a struct scatterlist at all:
replace the 'sg_req' variable with a normal pointer, and then
do

	hdr->cmd_table_addr = cpu_to_le64(dma_map_single(dev, req, len, DMA_TO_DEVICE));

Any reason this won't work?

	Arnd
