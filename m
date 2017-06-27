From: Pierre Yves MORDRET <pierre-yves.mordret@st.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: Document the STM32 DMAMUX bindings
Date: Tue, 27 Jun 2017 08:08:30 +0000
Message-ID: <0437426e-b2cd-6bfb-4682-5cb393d118b8@st.com>
References: <1498222853-11110-1-git-send-email-pierre-yves.mordret@st.com>
 <1498222853-11110-2-git-send-email-pierre-yves.mordret@st.com>
 <20170626192849.zd5e53cidgen3ypq@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170626192849.zd5e53cidgen3ypq@rob-hp-laptop>
Content-Language: en-US
Content-ID: <3CB2A562D5F652478207629B642E5882@st.com>
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



On 06/26/2017 09:28 PM, Rob Herring wrote:
> On Fri, Jun 23, 2017 at 03:00:49PM +0200, Pierre-Yves MORDRET wrote:
>> This patch adds the documentation of device tree bindings for the STM32
>> DMAMUX.
>>
>> Signed-off-by: M'boumba Cedric Madianga <cedric.madianga@gmail.com>
>> Signed-off-by: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
>> ---
>>   Version history:
>>      v2:
>>          * Move clock bindings from optional to mandatory one
>>          * Drop channelID bindings as managed dynamically from now on by
>>            DMAMUX driver.
>> ---
>> ---
>>   .../devicetree/bindings/dma/stm32-dmamux.txt       | 57 ++++++++++++++++++++++
>>   1 file changed, 57 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/dma/stm32-dmamux.txt
>>
>> diff --git a/Documentation/devicetree/bindings/dma/stm32-dmamux.txt b/Documentation/devicetree/bindings/dma/stm32-dmamux.txt
>> new file mode 100644
>> index 0000000..1d413c5
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/dma/stm32-dmamux.txt
>> @@ -0,0 +1,57 @@
>> +STM32 DMA MUX (DMA request router)
>> +
>> +Required properties:
>> +- compatible:	"st,stm32-dmamux"
> 
> This should be SoC specific (or at least have f4, h7, etc.).

Ok.
compatible:    "st,stm32h7-dmamux"

> 
>> +- reg:		Memory map for accessing module
>> +- #dma-cells:	Should be set to <3>.
>> +		For more details about the three cells, please see
>> +		stm32-dma.txt documentation binding file
> 
> The example below has 4 cells for the dma ctrlr?
> 

Yes.
DMA Controller has 4 cells and DMAMUX only 3.
But I agree this is not very clear. I should add a comment on each cells 
to highlight the mapping onto DMA Cells

>> +- dma-masters:	Phandle pointing to the DMA controller
>> +
>> +Optional properties:
>> +- dma-channels : Number of DMA channels supported.
>> +- dma-requests : Number of DMA requests supported.
>> +- resets: Reference to a reset controller asserting the DMA controller
>> +- clocks: Input clock of the DMAMUX instance.
>> +
>> +Example:
>> +
>> +/* DMA controller */
>> +dma2: dma-controller@40026400 {
>> +	compatible = "st,stm32-dma";
>> +	reg = <0x40026400 0x400>;
>> +	interrupts = <56>,
>> +		     <57>,
>> +		     <58>,
>> +		     <59>,
>> +		     <60>,
>> +		     <68>,
>> +		     <69>,
>> +		     <70>;
>> +	clocks = <&clk_hclk>;
>> +	#dma-cells = <4>;
>> +	st,mem2mem;
>> +	resets = <&rcc 150>;
>> +	st,dmamux;
>> +	dma-channels = <8>;
>> +};
>> +
>> +/* DMA mux */
>> +dmamux2: dma-router@40020820 {
>> +	compatible = "st,stm32-dmamux";
>> +	reg = <0x40020800 0x1c>;
>> +	#dma-cells = <3>;
>> +	dma-requests = <128>;
>> +	dma-masters = <&dma2>;
>> +};
>> +
>> +/* DMA client */
>> +usart1: serial@40011000 {
>> +	compatible = "st,stm32-usart", "st,stm32-uart";
>> +	reg = <0x40011000 0x400>;
>> +	interrupts = <37>;
>> +	clocks = <&clk_pclk2>;
>> +	dmas = <&dmamux2 41 0x414 0>,
>> +	       <&dmamux2 42 0x414 0>;
>> +	dma-names = "rx", "tx";
>> +};
>> -- 
>> 1.9.1
>>

Py
