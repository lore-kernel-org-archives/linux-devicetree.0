From: Pierre Yves MORDRET <pierre-yves.mordret@st.com>
Subject: Re: [PATCH v2 3/5] dt-bindings: stm32-dma: Add property to handle
 STM32 DMAMUX
Date: Tue, 27 Jun 2017 08:09:35 +0000
Message-ID: <b573370a-13d3-e5cc-781a-0f05a6767f7c@st.com>
References: <1498222853-11110-1-git-send-email-pierre-yves.mordret@st.com>
 <1498222853-11110-4-git-send-email-pierre-yves.mordret@st.com>
 <20170626193331.5jle4oxgvqmsvs5b@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170626193331.5jle4oxgvqmsvs5b@rob-hp-laptop>
Content-Language: en-US
Content-ID: <0E476E8123F4AB4F94799C37693CB77A@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Amelie DELAUNAY <amelie.delaunay@st.com>, Alexandre TORGUE <alexandre.torgue@st.com>, Vinod Koul <vinod.koul@intel.com>, Russell King <linux@armlinux.org.uk>, Fabien DESSENNE <fabien.dessenne@st.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, M'boumba Cedric Madianga <cedric.madianga@gmail.com>, Dan Williams <dan.j.williams@intel.com>, Fabrice GASNIER <fabrice.gasnier@st.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Herbert Xu <herbert@gondor.apana.org.au>
List-Id: devicetree@vger.kernel.org



On 06/26/2017 09:33 PM, Rob Herring wrote:
> On Fri, Jun 23, 2017 at 03:00:51PM +0200, Pierre-Yves MORDRET wrote:
>> This patch adds an optional property needed for STM32 DMA controller
>> addressed via STM32 DMAMUX.
>>
>> Signed-off-by: M'boumba Cedric Madianga <cedric.madianga@gmail.com>
>> Signed-off-by: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
>> ---
>>   Version history:
>>      v2:
>>          * Typo fix
>> ---
>> ---
>>   Documentation/devicetree/bindings/dma/stm32-dma.txt | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/dma/stm32-dma.txt b/Documentation/devicetree/bindings/dma/stm32-dma.txt
>> index 4408af6..340c918 100644
>> --- a/Documentation/devicetree/bindings/dma/stm32-dma.txt
>> +++ b/Documentation/devicetree/bindings/dma/stm32-dma.txt
>> @@ -16,6 +16,9 @@ Optional properties:
>>   - resets: Reference to a reset controller asserting the DMA controller
>>   - st,mem2mem: boolean; if defined, it indicates that the controller supports
>>     memory-to-memory transfer
>> +- st,dmamux: boolean; if defined, it indicates that the controller is behind a
>> +  DMA multiplexer. In that case, using dma instances doesn't work for DMA
>> +  clients. They have to use dma-router instances.
> 
> Won't this be obvious looking at the bindings for clients?
> 
> In any case, this should be implied by the compatible string.
> 
> Rob
> 

Not sure what you are asking here.

Py
