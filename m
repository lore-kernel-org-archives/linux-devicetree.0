From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: Document the STM32 QSPI bindings
Date: Tue, 4 Apr 2017 07:20:36 -0500
Message-ID: <CAL_JsqK5mZojW1fVRrg=TfO3sXd7Eqa6gS9NS9aDjXwn4_26_w@mail.gmail.com>
References: <1490979724-10905-1-git-send-email-ludovic.Barre@st.com>
 <1490979724-10905-2-git-send-email-ludovic.Barre@st.com> <20170403165735.sopfhlxzefkzrbfh@rob-hp-laptop>
 <bd7cf1f8-e3b6-5752-47ef-2f54d56f81cc@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bd7cf1f8-e3b6-5752-47ef-2f54d56f81cc-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ludovic BARRE <ludovic.barre-qxv4g6HH51o@public.gmane.org>
Cc: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 4, 2017 at 2:28 AM, Ludovic BARRE <ludovic.barre-qxv4g6HH51o@public.gmane.org> wrote:
> Hi Rob
>
> thanks for review
> my comments below
>
> br
> Ludo
>
> On 04/03/2017 06:57 PM, Rob Herring wrote:
>>
>> On Fri, Mar 31, 2017 at 07:02:03PM +0200, Ludovic Barre wrote:
>>>
>>> From: Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>
>>>
>>> This patch adds documentation of device tree bindings for the STM32
>>> QSPI controller.
>>>
>>> Signed-off-by: Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>
>>> ---
>>>   .../devicetree/bindings/mtd/stm32-quadspi.txt      | 45
>>> ++++++++++++++++++++++
>>>   1 file changed, 45 insertions(+)
>>>   create mode 100644
>>> Documentation/devicetree/bindings/mtd/stm32-quadspi.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/mtd/stm32-quadspi.txt
>>> b/Documentation/devicetree/bindings/mtd/stm32-quadspi.txt
>>> new file mode 100644
>>> index 0000000..95a8ebd
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/mtd/stm32-quadspi.txt
>>> @@ -0,0 +1,45 @@
>>> +* STMicroelectronics Quad Serial Peripheral Interface(QuadSPI)
>>> +
>>> +Required properties:
>>> +- compatible: should be "st,stm32f469-qspi"
>>> +- reg: contains the register location and length.
>>> +  (optional) the memory mapping address and length
>>
>> Why optional? Either the h/w has it or doesn't. If some chips don't,
>> they should have a different compatible string.
>
> in fact, the stm32 qspi controller can operate in any of the following
> modes:
> -indirect mode: all the operations are performed using the qspi registers
> with read/write.
> -read memory-mapped mode: the external Flash memory is mapped to the
>  microcontroller address space and is seen by the system as if it was
>  an internal memory (use memcpy_fromio). this mode improve read throughput
>
> if qspi_mm is defined the qspi controller use read memory-mapped mode
> else the controller transfers in indirect mode.

You should always have the memory region defined because that's what
the h/w has. If you want another property to select the mode, then
perhaps that's fine. But why? Can't the OS figure out which to use?
Why would you ever not use memory mapped mode unless the driver
doesn't yet support it?

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
