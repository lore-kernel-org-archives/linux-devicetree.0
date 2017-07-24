From: Pierre Yves MORDRET <pierre-yves.mordret@st.com>
Subject: Re: [PATCH v2 2/4] dmaengine: Add STM32 MDMA driver
Date: Mon, 24 Jul 2017 09:34:18 +0000
Message-ID: <320f8def-19a4-0491-e879-b41815889e15@st.com>
References: <1499343941-6375-1-git-send-email-pierre-yves.mordret@st.com>
 <1499343941-6375-3-git-send-email-pierre-yves.mordret@st.com>
 <20170721075547.GO3053@localhost>
 <ee278ecf-02a3-7799-888a-9590d1105bb3@st.com>
 <20170721095411.GR3053@localhost>
 <3c04c9bf-572d-98a6-ff62-83498bbc7fdf@st.com>
 <20170721171735.GS3053@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170721171735.GS3053@localhost>
Content-Language: en-US
Content-ID: <46D0C79323298143BF2709AC3D34FD25@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Amelie DELAUNAY <amelie.delaunay@st.com>, Alexandre TORGUE <alexandre.torgue@st.com>, Russell King <linux@armlinux.org.uk>, Fabien DESSENNE <fabien.dessenne@st.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, M'boumba Cedric Madianga <cedric.madianga@gmail.com>, Dan Williams <dan.j.williams@intel.com>, Fabrice GASNIER <fabrice.gasnier@st.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Herbert Xu <herbert@gondor.apana.org.au>
List-Id: devicetree@vger.kernel.org


On 07/21/2017 12:32 PM, Pierre Yves MORDRET wrote:
 >
 >
 > On 07/21/2017 11:54 AM, Vinod Koul wrote:
 >> On Fri, Jul 21, 2017 at 09:30:00AM +0000, Pierre Yves MORDRET wrote:
 >>>>> +static enum dma_slave_buswidth stm32_mdma_get_max_width(u32 buf_len, u32 
tlen)
 >>>>> +{
 >>>>> +	enum dma_slave_buswidth max_width = DMA_SLAVE_BUSWIDTH_8_BYTES;
 >>>>> +
 >>>>> +	while (((buf_len % max_width) || (tlen < max_width)) &&
 >>>>> +	       (max_width > DMA_SLAVE_BUSWIDTH_1_BYTE))
 >>>>> +		max_width = max_width >> 1;
 >>>>
 >>>> ok, this is a bit hard to read...
 >>>
 >>> This code snippet has already been reworked and optimized. Would you mind to
 >>> provide me a example with your expectation ? Thanks
 >>
 >> Code is optimized yes, but readable no
 >>
 >> I would like readability to be improved upon...
 >>
 >
 > gotcha
 >

Doest he code snippet below has a better looking for you ?

	for (max_width = DMA_SLAVE_BUSWIDTH_8_BYTES;
	     max_width > DMA_SLAVE_BUSWIDTH_1_BYTE; max_width >>= 1)
		if (((buf_len % max_width) == 0) && (tlen >= max_width))
			break;

On 07/21/2017 07:17 PM, Vinod Koul wrote:
> On Fri, Jul 21, 2017 at 10:32:49AM +0000, Pierre Yves MORDRET wrote:
>>>>>> +static int stm32_mdma_set_xfer_param(struct stm32_mdma_chan *chan,
>>>>>> +				     enum dma_transfer_direction direction,
>>>>>> +				     u32 *mdma_ccr, u32 *mdma_ctcr,
>>>>>> +				     u32 *mdma_ctbr, u32 buf_len)
>>>>>> +{
>>>>>> +	struct stm32_mdma_device *dmadev = stm32_mdma_get_dev(chan);
>>>>>> +	struct stm32_mdma_chan_config *chan_config = &chan->chan_config;
>>>>>> +	enum dma_slave_buswidth src_addr_width, dst_addr_width;
>>>>>> +	phys_addr_t src_addr, dst_addr;
>>>>>> +	int src_bus_width, dst_bus_width;
>>>>>> +	u32 src_maxburst, dst_maxburst, src_best_burst, dst_best_burst;
>>>>>> +	u32 ccr, ctcr, ctbr, tlen;
>>>>>> +
>>>>>> +	src_addr_width = chan->dma_config.src_addr_width;
>>>>>> +	dst_addr_width = chan->dma_config.dst_addr_width;
>>>>>> +	src_maxburst = chan->dma_config.src_maxburst;
>>>>>> +	dst_maxburst = chan->dma_config.dst_maxburst;
>>>>>> +	src_addr = chan->dma_config.src_addr;
>>>>>> +	dst_addr = chan->dma_config.dst_addr;
>>>>>
>>>>> this doesn't seem right to me, only the periphral address would come from
>>>>> slave_config, the memory address is passed as an arg to transfer..
>>>>>
>>>>> ...
>>>>>
>>>>
>>>> Correct. But these locals are managed in the case statement below. if direction
>>>> is Mem2Dev only dst_addr(Peripheral) is considered. In the other way around with
>>>> Dev2Mem direction only src_addr(Peripheral) is considered.
>>>> However to disambiguate I can move src_addr & dst_addr affectation in the
>>>> corresponding case statement if you'd like.
>>>
>>> But below you are over writing both, so in effect this is wasted cycles..
>>> anyway latter one is more clear, so lets remove from here.
>>>
>>
>> Sorry I don't follow ... or miss something
>> For instance if direction is Mem2Dev ..._xfer_param is going to configure
>> Destination Bus width and Addr given by slave_config. ..._setup_xfer in its turn
>> will configure source given as parameter.
>> Don't the see the over-writing
> 
> ah re-looking at it, yes you are right.
> 
> The above two assignments threw me off, I should have read it properly.
> 
> But I think calculating for src and dstn always might not be optimal as you
> would use one only, so should these be moved to respective case where they
> are used...
> 

Agree. This is my planned btw

Thanks
Py.
