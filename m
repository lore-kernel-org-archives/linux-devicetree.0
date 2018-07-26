From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Subject: Re: [PATCH v7 4/6] dt-bindings: mailbox: imx-mu: add i.MX6SX and
 i.MX7S SoCs.
Date: Thu, 26 Jul 2018 15:10:00 +0300
Message-ID: <01d29860-1c3d-9163-b79c-de4c37311107@mentor.com>
References: <20180726065331.6186-1-o.rempel@pengutronix.de>
 <20180726065331.6186-5-o.rempel@pengutronix.de>
 <CABb+yY32vBy5qVYsQ6u45=rV6gEggqKy3Jqn1B4oWHaGfTyQ8Q@mail.gmail.com>
 <1532601691.32306.28.camel@pengutronix.de>
 <CABb+yY1GEmw_8q2HaF8y5VfFJX_c_0_MbWtPUE_j_o-zS8iZ_g@mail.gmail.com>
 <1532604937.32306.30.camel@pengutronix.de>
 <CABb+yY0LbLfK2SEdTeuDmaGc+PsVn0AREQ=E=c4UZgxa5K95qQ@mail.gmail.com>
 <b5e54dce-582d-15d9-5f33-0f27fd1a256c@mentor.com>
 <CABb+yY1tScH1B-rL1Y79+NdgSHuoDe61kDqeYD7M=ABE3YLY1A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CABb+yY1tScH1B-rL1Y79+NdgSHuoDe61kDqeYD7M=ABE3YLY1A@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Devicetree List <devicetree@vger.kernel.org>, Oleksij Rempel <o.rempel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, ",
 linux-arm-kernel"@lists.infradead.org, dl-linux-imx <linux-imx@nxp.com>, ",
 Sascha Hauer" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, srv_heupstream <linux-mediatek@lists.infradead.org>, Shawn Guo <shawnguo@kernel.org>, "A.s. Dong" <aisheng.dong@nxp.com>, srv_heupstream <linux-arm-kernel@lists.infradead.org>, Lucas Stach <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On 07/26/2018 03:00 PM, Jassi Brar wrote:
> On Thu, Jul 26, 2018 at 5:21 PM, Vladimir Zapolskiy
> <vladimir_zapolskiy@mentor.com> wrote:
>> On 07/26/2018 02:46 PM, Jassi Brar wrote:
>>> On Thu, Jul 26, 2018 at 5:05 PM, Lucas Stach <l.stach@pengutronix.de> wrote:
>>>> Am Donnerstag, den 26.07.2018, 16:45 +0530 schrieb Jassi Brar:
>>>>> On Thu, Jul 26, 2018 at 4:11 PM, Lucas Stach <l.stach@pengutronix.de>
>>>>> wrote:
>>>>>> Hi Jassi,
>>>>>>
>>>>>> Am Donnerstag, den 26.07.2018, 15:25 +0530 schrieb Jassi Brar:
>>>>>>> On Thu, Jul 26, 2018 at 12:23 PM, Oleksij Rempel
>>>>>>>> <o.rempel@pengutronix.de> wrote:
>>>>>>>> This are currently tested SoCs with imx-mailbox driver.
>>>>>>>>
>>>>>>>>>> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
>>>>>>>>
>>>>>>>> ---
>>>>>>>>  Documentation/devicetree/bindings/mailbox/fsl,mu.txt | 2 +-
>>>>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>>>
>>>>>>>> diff --git
>>>>>>>> a/Documentation/devicetree/bindings/mailbox/fsl,mu.txt
>>>>>>>> b/Documentation/devicetree/bindings/mailbox/fsl,mu.txt
>>>>>>>> index 113d6ab931ef..5616d2afca45 100644
>>>>>>>> --- a/Documentation/devicetree/bindings/mailbox/fsl,mu.txt
>>>>>>>> +++ b/Documentation/devicetree/bindings/mailbox/fsl,mu.txt
>>>>>>>> @@ -18,7 +18,7 @@ Messaging Unit Device Node:
>>>>>>>>  Required properties:
>>>>>>>>  -------------------
>>>>>>>>  - compatible : should be "fsl,<chip>-mu", the supported chips
>>>>>>>> include
>>>>>>>> -               imx8qxp, imx8qm.
>>>>>>>> +               imx6sx, imx7s, imx8qxp, imx8qm.
>>>>>>>>
>>>>>>>
>>>>>>> This is not scalable. Do we add every new SoC that contains the
>>>>>>> same controller?
>>>>>>
>>>>>> Yes, we do. This is a policy direction from the DT maintainers.
>>>>>>
>>>>>
>>>>> I would love to read the post/documentation.
>>>>>
>>>>> Consider the same h/w - controller and platforms, but only the the MU
>>>>> chapter said the controller name is, say, 'MU121'. I am sure now you
>>>>> will see it correct to call it "fsl,mu121" compatible.
>>>>> What changed? just the name, right?
>>>>>
>>>>>
>>>>>> If we
>>>>>> ever going to want to validate DTs against the binding, all
>>>>>> compatibles
>>>>>> used in the DTs must be specified in the binding.
>>>>>>
>>>>>> As we can't really tell if the controller is exactly the same or
>>>>>> even
>>>>>> has some SoC integration bugs, we generally add a new compatible
>>>>>> for
>>>>>> each SoC to key off any workarounds necessary in the driver without
>>>>>> the
>>>>>> need to change the DTs, breaking compatibility.
>>>>>>
>>>>>
>>>>> I think if the h/w resources and behaviour remain the same and the
>>>>> documentation does not call it by a different name -- it is safe to
>>>>> assume its the same IP. Especially when the driver is absolutely
>>>>> indifferent to the 5 SoC names.
>>>>
>>>> Even if it is the same IP core, the SoC integration might have bugs
>>>> that need different behavior from the driver. We've already had that
>>>> case with the i.MX6 SPI controller.
>>>>
>>> For h/w quirks/bugs, a new "has-that-bug" property makes better sense.
>>> Or, if you insist, a new compatible based on the first soc that has
>>> the buggy block.
>>>
>>
>> How do you propose to handle this property in the driver, if once flashed
>> DTB does not contain it?
>>
> I see, your point is - what if a bug appears only in a particular SoC ?
> Well, if the controller is same the bug should appear to all SoCs.
> Do you think these SoCs have different versions of MU ?
> 

I'm not a hardware developer, but I'm quite sure that strictly speaking
IPs are different on different SoCs, the diversity of differences can be
negligible, or it can be discovered in future and considered as
significant, i.e. two IPs may be found as incompatible ones. Note that
the DTBs flashed on boards are already prepared for the worst scenario.

But to some extend, and in today's knowledge, the IPs are compatible,
let's say they are compatible to "fsl,imx6sx-mu" version, the one which
is found in the published driver.

--
Best wishes,
Vladimir
