From: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v3 1/7] dt-bindings: interconnect: Add a dma interconnect
 name
Date: Tue, 5 Mar 2019 16:14:26 +0000
Message-ID: <0e72fbf7-b100-ddc5-3c19-32f71c37f76f@arm.com>
References: <cover.f2e5fbb4d21384168973fa32377a33d627768146.1549897336.git-series.maxime.ripard@bootlin.com>
 <43eeca13733faefe62f9facc25b8e88f7e593f61.1549897336.git-series.maxime.ripard@bootlin.com>
 <553c987c-da9a-1f85-fb16-4b9fe17dd14b@linaro.org>
 <20190305155337.glfvgyddvnkv774m@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190305155337.glfvgyddvnkv774m@flea>
Content-Language: en-GB
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Georgi Djakov <georgi.djakov@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Yong Deng <yong.deng@magewell.com>, Frank Rowand <frowand.list@gmail.com>, Dave Martin <dave.martin@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 05/03/2019 15:53, Maxime Ripard wrote:
> Hi,
> 
> On Fri, Mar 01, 2019 at 07:48:15PM +0200, Georgi Djakov wrote:
>> On 2/11/19 17:02, Maxime Ripard wrote:
>>> The current DT bindings assume that the DMA will be performed by the
>>> devices through their parent DT node, and rely on that assumption for the
>>> address translation using dma-ranges.
>>>
>>> However, some SoCs have devices that will perform DMA through another bus,
>>> with separate address translation rules. We therefore need to express that
>>> relationship, through the special interconnect name "dma".
>>>
>>> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
>>> ---
>>>   Documentation/devicetree/bindings/interconnect/interconnect.txt | 3 +++
>>>   1 file changed, 3 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/interconnect/interconnect.txt b/Documentation/devicetree/bindings/interconnect/interconnect.txt
>>> index 5a3c575b387a..e69fc2d992c3 100644
>>> --- a/Documentation/devicetree/bindings/interconnect/interconnect.txt
>>> +++ b/Documentation/devicetree/bindings/interconnect/interconnect.txt
>>> @@ -51,6 +51,9 @@ interconnect-names : List of interconnect path name strings sorted in the same
>>>   		     interconnect-names to match interconnect paths with interconnect
>>>   		     specifier pairs.
>>>   
>>> +                     Reserved interconnect names:
>>> +                         * dma: Path from the device to the main memory of the system
>>
>> Bikeshed: As it's from the device to the main memory, maybe here we can
>> also denote this my calling the path dma-mem or dma-memory. For other
>> paths, we are trying to mention both the source and the destination and
>> maybe it would be good to be consistent although this is special one.
> 
> I'm not sure I understand what you mean. You'd like two interconnect
> names, one called dma-memory, and one memory-dma?

Hmm, yes, it's not like "dma" describes an actual source or destination 
either :/

Robin.
