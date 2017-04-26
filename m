From: Pierre Yves MORDRET <pierre-yves.mordret@st.com>
Subject: Re: [PATCH 3/5] dt-bindings: stm32-dma: Add property to handle STM32
 DMAMUX
Date: Wed, 26 Apr 2017 09:23:34 +0000
Message-ID: <b79dbe72-385f-3e6c-f984-8a724f7610bd@st.com>
References: <1489414561-28912-1-git-send-email-cedric.madianga@gmail.com>
 <1489414561-28912-4-git-send-email-cedric.madianga@gmail.com>
 <20170320213722.oj3ipmslbw2mp27d@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170320213722.oj3ipmslbw2mp27d@rob-hp-laptop>
Content-Language: en-US
Content-ID: <0204DCE1C9427740AD14FCB522279871@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>, M'boumba Cedric Madianga <cedric.madianga@gmail.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Alexandre TORGUE <alexandre.torgue@st.com>, "vinod.koul@intel.com" <vinod.koul@intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pierre Yves MORDRET <pierre-yves.mordret@st.com>, "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 03/20/2017 10:37 PM, Rob Herring wrote:
> On Mon, Mar 13, 2017 at 03:15:59PM +0100, M'boumba Cedric Madianga wrote:
>> This patch adds an optional property needed for STM32 DMA controller
>> addressed via STM32 DMAMUX.
>>
>> Signed-off-by: M'boumba Cedric Madianga <cedric.madianga@gmail.com>
>> ---
>>  Documentation/devicetree/bindings/dma/stm32-dma.txt | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/dma/stm32-dma.txt b/Documentation/devicetree/bindings/dma/stm32-dma.txt
>> index 4408af6..7b5e91a 100644
>> --- a/Documentation/devicetree/bindings/dma/stm32-dma.txt
>> +++ b/Documentation/devicetree/bindings/dma/stm32-dma.txt
>> @@ -16,6 +16,9 @@ Optional properties:
>>  - resets: Reference to a reset controller asserting the DMA controller
>>  - st,mem2mem: boolean; if defined, it indicates that the controller supports
>>    memory-to-memory transfer
>> +- st,dmamux: boolean; if defined, it indicates that the controller is behind a
>> +  DMA multiplexer. In that case, using dma instances doesn't work for DMA
>> +  clients. They have to use dma-router instances.
>
> This should not be needed for the same reason we don't need anything
> like this for chained interrupt controllers.
>
> Also, the compatible string should be specific enough to provide this
> information.
>
> Rob

I don't understand what you're meant here. Our DMAs can work with or 
without DMAMUX driver. Driver uses this binding to use it or not.

Py

>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
>
>
