From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v2 3/3] media: dt-bindings: vpif: new optional property
Date: Wed, 1 Mar 2017 18:26:24 +0530
Message-ID: <fbac869d-2485-6269-6787-f3863906e961@ti.com>
References: <1487771027-7763-1-git-send-email-bgolaszewski@baylibre.com>
 <1487771027-7763-4-git-send-email-bgolaszewski@baylibre.com>
 <20170227225209.26oieqwbafqjga2a@rob-hp-laptop>
 <6b392a4a-2de8-9981-ad40-ca7201bf813d@ti.com>
 <CAL_JsqLBYqGgOA1GUi9mHT-51D5k96w-N0FiOyF+qPY6BGStzA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAL_JsqLBYqGgOA1GUi9mHT-51D5k96w-N0FiOyF+qPY6BGStzA@mail.gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, David Lechner <david@lechnology.com>, Kevin Hilman <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Patrick Titiano <ptitiano@baylibre.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 28 February 2017 07:56 PM, Rob Herring wrote:
> On Mon, Feb 27, 2017 at 11:36 PM, Sekhar Nori <nsekhar@ti.com> wrote:
>> On Tuesday 28 February 2017 04:22 AM, Rob Herring wrote:
>>> On Wed, Feb 22, 2017 at 02:43:47PM +0100, Bartosz Golaszewski wrote:
>>>> Add an optional property - enable-gpios - which can be used to specify
>>>> the GPIOs that must be requested to select the vpif functionality.
>>>>
>>>> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>>>> ---
>>>>  Documentation/devicetree/bindings/media/ti,da850-vpif.txt | 7 +++++++
>>>>  1 file changed, 7 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/media/ti,da850-vpif.txt b/Documentation/devicetree/bindings/media/ti,da850-vpif.txt
>>>> index df7182a..23c5405 100644
>>>> --- a/Documentation/devicetree/bindings/media/ti,da850-vpif.txt
>>>> +++ b/Documentation/devicetree/bindings/media/ti,da850-vpif.txt
>>>> @@ -13,6 +13,9 @@ Required properties:
>>>>  - reg: physical base address and length of the registers set for the device;
>>>>  - interrupts: should contain IRQ line for the VPIF
>>>>
>>>> +Optional properties:
>>>> +- enable-gpios: phandle of the GPIOs used to select the vpif functionality
>>>
>>> What does this control exactly? The GPIOs belong in the node they are
>>> connected to and having GPIOs routed to this block seems strange.
>>
>> The DA850 EVM board implements on-board muxing which lets the video
>> input (via VPIF) to be routed to a TVP5147 (video decoder) for composite
>> input or to a camera header. There are other mux options which use the
>> same VPIF SoC pins (RMII ethernet or character LCD).
>>
>> There is a three-to-eight demux on the board which drives enable signals
>> to buffers letting you choose from these options.
>>
>> From your response, it looks like you want the enable-gpios property to
>> be in the TVP5147 or camera node. That does make sense to me.
> 
> Well, seems like they should be part of a mux node. I'd suggest you
> look at the video-multiplexer binding under review[1].
> 
> Though for other non video functions, that would be some sort of board
> level pin mux control. There's a new mux binding too, maybe that would
> work. In any case, it shouldn't be the VPIF driver controlling the
> GPIOs directly.

Yeah, since there are non-video functions involved, we need a more
generic mux binding. I see the work Peter Rosin is doing[1]. Its not in
linux-next yet, but seems quite near merging.

[1] https://lkml.org/lkml/2017/2/8/394

Thanks,
Sekhar
