From: Georgi Djakov <georgi.djakov@linaro.org>
Subject: Re: [PATCH v3 1/7] dt-bindings: interconnect: Add a dma interconnect
 name
Date: Wed, 13 Mar 2019 13:48:48 +0200
Message-ID: <f73cdaff-6bf9-370e-7c0e-0f1dee193838@linaro.org>
References: <cover.f2e5fbb4d21384168973fa32377a33d627768146.1549897336.git-series.maxime.ripard@bootlin.com>
 <43eeca13733faefe62f9facc25b8e88f7e593f61.1549897336.git-series.maxime.ripard@bootlin.com>
 <553c987c-da9a-1f85-fb16-4b9fe17dd14b@linaro.org>
 <20190305155337.glfvgyddvnkv774m@flea>
 <0e72fbf7-b100-ddc5-3c19-32f71c37f76f@arm.com>
 <477995b0-9ac3-b6ca-f5f2-856e4af926f1@linaro.org>
 <20190307154755.5kgc7oh4b5bhg2fj@flea>
 <CAGb2v666u1c1OE3FnN=Y_kZe7TgNKvtA6=GYiHuWycJ2ooQhxw@mail.gmail.com>
 <20190311101130.7t7rctxlqly3uqmt@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190311101130.7t7rctxlqly3uqmt@flea>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, Robin Murphy <robin.murphy@arm.com>, dri-devel <dri-devel@lists.freedesktop.org>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Yong Deng <yong.deng@magewell.com>, Frank Rowand <frowand.list@gmail.com>, Dave Martin <dave.martin@arm.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 3/11/19 12:11, Maxime Ripard wrote:
> On Fri, Mar 08, 2019 at 12:09:47AM +0800, Chen-Yu Tsai wrote:
>> On Thu, Mar 7, 2019 at 11:48 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>>>
>>> On Thu, Mar 07, 2019 at 05:15:20PM +0200, Georgi Djakov wrote:
>>>> Hi,
>>>>
>>>> On 3/5/19 18:14, Robin Murphy wrote:
>>>>> On 05/03/2019 15:53, Maxime Ripard wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On Fri, Mar 01, 2019 at 07:48:15PM +0200, Georgi Djakov wrote:
>>>>>>> On 2/11/19 17:02, Maxime Ripard wrote:
>>>>>>>> The current DT bindings assume that the DMA will be performed by the
>>>>>>>> devices through their parent DT node, and rely on that assumption
>>>>>>>> for the
>>>>>>>> address translation using dma-ranges.
>>>>>>>>
>>>>>>>> However, some SoCs have devices that will perform DMA through
>>>>>>>> another bus,
>>>>>>>> with separate address translation rules. We therefore need to
>>>>>>>> express that
>>>>>>>> relationship, through the special interconnect name "dma".
>>>>>>>>
>>>>>>>> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
>>>>>>>> ---
>>>>>>>>   Documentation/devicetree/bindings/interconnect/interconnect.txt |
>>>>>>>> 3 +++
>>>>>>>>   1 file changed, 3 insertions(+)
>>>>>>>>
>>>>>>>> diff --git
>>>>>>>> a/Documentation/devicetree/bindings/interconnect/interconnect.txt
>>>>>>>> b/Documentation/devicetree/bindings/interconnect/interconnect.txt
>>>>>>>> index 5a3c575b387a..e69fc2d992c3 100644
>>>>>>>> --- a/Documentation/devicetree/bindings/interconnect/interconnect.txt
>>>>>>>> +++ b/Documentation/devicetree/bindings/interconnect/interconnect.txt
>>>>>>>> @@ -51,6 +51,9 @@ interconnect-names : List of interconnect path
>>>>>>>> name strings sorted in the same
>>>>>>>>                interconnect-names to match interconnect paths with
>>>>>>>> interconnect
>>>>>>>>                specifier pairs.
>>>>>>>>   +                     Reserved interconnect names:
>>>>>>>> +                         * dma: Path from the device to the main
>>>>>>>> memory of the system
>>>>>>>
>>>>>>> Bikeshed: As it's from the device to the main memory, maybe here we can
>>>>>>> also denote this my calling the path dma-mem or dma-memory. For other
>>>>>>> paths, we are trying to mention both the source and the destination and
>>>>>>> maybe it would be good to be consistent although this is special one.
>>>>>>
>>>>>> I'm not sure I understand what you mean. You'd like two interconnect
>>>>>> names, one called dma-memory, and one memory-dma?
>>>>>
>>>>> Hmm, yes, it's not like "dma" describes an actual source or destination
>>>>> either :/
>>>>
>>>> IIUC, it's a path (bus) that a dma device use to access some memory
>>>> (read or/and write). So i have used source-destination above more in the
>>>> sense of initiator-target or master-slave. My suggestion was just to
>>>> change the reserved interconnect name from "dma" to "dma-mem" or
>>>> "dma-memory".
>>>
>>> If dma is an issue in itself, maybe we can call it "device-memory" ?
>>
>> Might I ask what happens if the device can both DMA to and from memory?
> 
> We can create another one called memory-device if that's needed?

I don't think this is needed if in both cases the DMA device is the
initiator of the transfer. In both cases the DMA device is the initiator
(master), so memory-device or memory-dma does not make much sense. Sorry
for the confusion.

> 
>> IIRC the display frontends, backends, and mixers all have writeback
>> capability, using the same interconnect port.
> 
> I think in both cases it's the same path. The camera driver also need
> to have that offset, even though it's a producer and not a consumer,
> and the VPU does too.

Again, the camera driver and probably the VPU too would be the
initiators, so regarding naming it should be the same (despite that the
data flow is bi-directional).

Thanks,
Georgi
