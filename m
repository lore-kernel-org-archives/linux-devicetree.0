From: Ludovic BARRE <ludovic.barre@st.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: Document the STM32 QSPI bindings
Date: Wed, 5 Apr 2017 18:00:39 +0200
Message-ID: <87299c6e-a107-c833-a102-a33a7b517291@st.com>
References: <1490979724-10905-1-git-send-email-ludovic.Barre@st.com>
 <1490979724-10905-2-git-send-email-ludovic.Barre@st.com>
 <20170403165735.sopfhlxzefkzrbfh@rob-hp-laptop>
 <bd7cf1f8-e3b6-5752-47ef-2f54d56f81cc@st.com>
 <CAL_JsqK5mZojW1fVRrg=TfO3sXd7Eqa6gS9NS9aDjXwn4_26_w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqK5mZojW1fVRrg=TfO3sXd7Eqa6gS9NS9aDjXwn4_26_w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>, Marek Vasut <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>, Alexandre Torgue <alexandre.torgue@st.com>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


On 04/04/2017 02:20 PM, Rob Herring wrote:
> On Tue, Apr 4, 2017 at 2:28 AM, Ludovic BARRE <ludovic.barre@st.com> wrote:
>> Hi Rob
>>
>> thanks for review
>> my comments below
>>
>> br
>> Ludo
>>
>> On 04/03/2017 06:57 PM, Rob Herring wrote:
>>> On Fri, Mar 31, 2017 at 07:02:03PM +0200, Ludovic Barre wrote:
>>>> From: Ludovic Barre <ludovic.barre@st.com>
>>>>
>>>> This patch adds documentation of device tree bindings for the STM32
>>>> QSPI controller.
>>>>
>>>> Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
>>>> ---
>>>>    .../devicetree/bindings/mtd/stm32-quadspi.txt      | 45
>>>> ++++++++++++++++++++++
>>>>    1 file changed, 45 insertions(+)
>>>>    create mode 100644
>>>> Documentation/devicetree/bindings/mtd/stm32-quadspi.txt
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/mtd/stm32-quadspi.txt
>>>> b/Documentation/devicetree/bindings/mtd/stm32-quadspi.txt
>>>> new file mode 100644
>>>> index 0000000..95a8ebd
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/mtd/stm32-quadspi.txt
>>>> @@ -0,0 +1,45 @@
>>>> +* STMicroelectronics Quad Serial Peripheral Interface(QuadSPI)
>>>> +
>>>> +Required properties:
>>>> +- compatible: should be "st,stm32f469-qspi"
>>>> +- reg: contains the register location and length.
>>>> +  (optional) the memory mapping address and length
>>> Why optional? Either the h/w has it or doesn't. If some chips don't,
>>> they should have a different compatible string.
>> in fact, the stm32 qspi controller can operate in any of the following
>> modes:
>> -indirect mode: all the operations are performed using the qspi registers
>> with read/write.
>> -read memory-mapped mode: the external Flash memory is mapped to the
>>   microcontroller address space and is seen by the system as if it was
>>   an internal memory (use memcpy_fromio). this mode improve read throughput
>>
>> if qspi_mm is defined the qspi controller use read memory-mapped mode
>> else the controller transfers in indirect mode.
> You should always have the memory region defined because that's what
> the h/w has. If you want another property to select the mode, then
> perhaps that's fine. But why? Can't the OS figure out which to use?
> Why would you ever not use memory mapped mode unless the driver
> doesn't yet support it?
ok, I always map the memory region (qspi_mm is now required).
if the nor-flash is more bigger than "qspi memory region", I force to use
the indirect mode.
> Rob
