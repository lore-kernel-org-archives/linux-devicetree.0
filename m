From: Pierre Yves MORDRET <pierre-yves.mordret@st.com>
Subject: Re: [PATCH v3 2/5] dmaengine: Add STM32 DMAMUX driver
Date: Tue, 1 Aug 2017 09:32:50 +0000
Message-ID: <e3a76a50-4160-d111-cce9-132b46b66c33@st.com>
References: <1499343623-5964-1-git-send-email-pierre-yves.mordret@st.com>
 <1499343623-5964-3-git-send-email-pierre-yves.mordret@st.com>
 <20170722065133.GT3053@localhost>
 <2b916330-9b65-f4d5-817f-79b66cc236b3@st.com>
 <20170726052930.GF3053@localhost>
 <f2908e38-dc4d-3886-4058-52a7ad845415@st.com>
 <20170731123157.GJ3053@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170731123157.GJ3053@localhost>
Content-Language: en-US
Content-ID: <FDEDB2498DD9884697BB212E0455D396@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Vinod Koul <vinod.koul@intel.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Amelie DELAUNAY <amelie.delaunay@st.com>, Alexandre TORGUE <alexandre.torgue@st.com>, Russell King <linux@armlinux.org.uk>, Fabien DESSENNE <fabien.dessenne@st.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, M'boumba Cedric Madianga <cedric.madianga@gmail.com>, Dan Williams <dan.j.williams@intel.com>, Fabrice GASNIER <fabrice.gasnier@st.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Herbert Xu <herbert@gondor.apana.org.au>
List-Id: devicetree@vger.kernel.org



On 07/31/2017 02:31 PM, Vinod Koul wrote:
> On Wed, Jul 26, 2017 at 07:38:02AM +0000, Pierre Yves MORDRET wrote:
>>>>>> +
>>>>>> +#ifndef __DMA_STM32_DMAMUX_H
>>>>>> +#define __DMA_STM32_DMAMUX_H
>>>>>> +
>>>>>> +#if defined(CONFIG_STM32_DMAMUX)
>>>>>> +int stm32_dmamux_set_config(struct device *dev, void *route_data, u32 chan_id);
>>>>>
>>>>> Why do we need a custom API in this case?
>>>>>
>>>>
>>>> This API is called by DMA when a slave is requested by client. DMA can work
>>>> without DMAMUX this API has been put in place to configure DMAMUX whether client
>>>> is requesting a DMAMUX Channel instead of a DMA one.
>>>
>>> You mean the dmaengine driver right?
>>>
>>
>> Yes. The API is mainly called by "device_config" through out STM32 DMA Driver
>> when a router is in place for client.
>> Please refer to Patch 4/5 on this set.
> 
> Okay am thinking on why this can't be generic..? An optional router config
> callback?
> 

I would have liked to answer there is a callback within engine but unfortunately
I didn't figure out one when I did my router's development. I've looked once
more but again I can't find how to map chanID and request line without custom API.
