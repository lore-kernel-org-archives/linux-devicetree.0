From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH 1/4] dt: fsl-imx-esdhc.txt: Fix gpio number assignment
Date: Mon, 11 Jun 2012 09:25:42 -0500
Message-ID: <4FD5FFE6.5030508@gmail.com>
References: <1339349050-3105-1-git-send-email-festevam@gmail.com> <4FD529B0.6010401@gmail.com> <CAOMZO5A-QUA_i0HOWm-dZq6pbcFPMyuQbX+1N3hr7NVbRhjxVw@mail.gmail.com> <4FD56FE1.3000800@gmail.com> <20120611065011.GN30400@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20120611065011.GN30400@pengutronix.de>
Sender: linux-doc-owner@vger.kernel.org
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>, grant.likely@secretlab.ca, Fabio Estevam <fabio.estevam@freescale.com>, linux-doc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kernel@pengutronix.de
List-Id: devicetree@vger.kernel.org

On 06/11/2012 01:50 AM, Sascha Hauer wrote:
> On Sun, Jun 10, 2012 at 11:11:13PM -0500, Rob Herring wrote:
>> On 06/10/2012 09:03 PM, Fabio Estevam wrote:
>>> On Sun, Jun 10, 2012 at 8:11 PM, Rob Herring <robherring2@gmail.com> wrote:
>>>> On 06/10/2012 12:24 PM, Fabio Estevam wrote:
>>>>> From: Fabio Estevam <fabio.estevam@freescale.com>
>>>>>
>>>>> Fix gpio number assignment, so that it can match the number stated in the comment.
>>>>>
>>>>> Cc:
>>>>> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
>>>>> ---
>>>>>  .../devicetree/bindings/mmc/fsl-imx-esdhc.txt      |    4 ++--
>>>>>  1 files changed, 2 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.txt b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.txt
>>>>> index c7e404b..fea541e 100644
>>>>> --- a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.txt
>>>>> +++ b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.txt
>>>>> @@ -29,6 +29,6 @@ esdhc@70008000 {
>>>>>       compatible = "fsl,imx51-esdhc";
>>>>>       reg = <0x70008000 0x4000>;
>>>>>       interrupts = <2>;
>>>>> -     cd-gpios = <&gpio0 6 0>; /* GPIO1_6 */
>>>>> -     wp-gpios = <&gpio0 5 0>; /* GPIO1_5 */
>>>>> +     cd-gpios = <&gpio1 6 0>; /* GPIO1_6 */
>>>>> +     wp-gpios = <&gpio1 5 0>; /* GPIO1_5 */
>>>>
>>>> Are you sure all these aren't just DT is 0 based and the chip is 1 based
>>>> numbering?
>>>
>>> We start counting gpio number from 0 in i.mx, so the DT number and the
>>> GPIO number should match.
>>
>> I'm talking about bank numbers, not gpio numbers:
>>
>> /* There's a off-by-one betweem the gpio bank number and the gpiochip */
>> /* range e.g. GPIO_1_5 is gpio 5 under linux */
>> #define IMX_GPIO_NR(bank, nr)		(((bank) - 1) * 32 + (nr))
> 
> Traditionally I started counting at 0 no matter what the datasheet told.
> Now we go to match the numbering with the datasheets, which of course
> can be confusing while transitioning this.
> Fabios patch is correct, there is no gpio0 in the devicetree.
> 

Okay, applied.

Rob
