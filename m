From: Abhishek Sahu <absahu@codeaurora.org>
Subject: Re: [PATCH v2 12/25] dt-bindings: qcom_nandc: QPIC NAND documentation
Date: Mon, 31 Jul 2017 21:35:57 +0530
Message-ID: <abf14014808fa0557696fee509c28046@codeaurora.org>
References: <1500464893-11352-1-git-send-email-absahu@codeaurora.org>
 <1500464893-11352-13-git-send-email-absahu@codeaurora.org>
 <20170724191723.aisibziviylk5ihc@rob-hp-laptop>
 <d8d8fef7d13acc4ffc29edac42eaa429@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <d8d8fef7d13acc4ffc29edac42eaa429@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, mark.rutland@arm.com, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, andy.gross@linaro.org, architt@codeaurora.org, sricharan@codeaurora.org
List-Id: devicetree@vger.kernel.org

On 2017-07-26 00:13, Abhishek Sahu wrote:
> On 2017-07-25 00:47, Rob Herring wrote:
>> On Wed, Jul 19, 2017 at 05:18:00PM +0530, Abhishek Sahu wrote:
>>> 1. QPIC NAND will use compatible string "qcom,qpic-nandc-v1.4.0"
>>> 2. QPIC NAND will 3 BAM channels: command, data tx and data rx
>>>    while EBI2 NAND uses only single ADM channel.
>>> 3. CRCI is only required for ADM DMA and its not required for
>>>    QPIC NAND.
>>> 
>>> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
>>> ---
>>>  .../devicetree/bindings/mtd/qcom_nandc.txt         | 54 
>>> ++++++++++++++++++++--
>>>  1 file changed, 51 insertions(+), 3 deletions(-)
>>> 
>>> diff --git a/Documentation/devicetree/bindings/mtd/qcom_nandc.txt 
>>> b/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
>>> index b24adfe..8efaeb0 100644
>>> --- a/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
>>> +++ b/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
>>> @@ -1,13 +1,15 @@
>>>  * Qualcomm NAND controller
>>> 
>>>  Required properties:
>>> -- compatible:		should be "qcom,ebi2-nandc" - EBI2 NAND which uses 
>>> ADM
>>> -			DMA like IPQ8064.
>>> -
>>> +- compatible:		must be one of the following:
>>> +	* "qcom,ebi2-nandc" - EBI2 NAND which uses ADM DMA like IPQ8064.
>>> +	* "qcom,qpic-nandc-v1.4.0" - QPIC NAND v1.4.0 which uses BAM DMA 
>>> like IPQ4019.
>> 
>> Looks like you have 2 SoCs and 2 versions of h/w. Use SoC specific
>> compatible strings.
> 
>  We have 3 versions of NAND HW currently.
>  EBI2,
>  QPIC version 1.4.0
>  QPIC version 1.5.0
> 
>  and multiple Qualcomm SoCs which use any one of these.
> 
>  The original plan was to have compatible string for NAND version since
>  same NAND hardware is being in different SoC and SoC dtsi will simply
>  use its NAND version compatible string like other Qualcomm hardwares
> 
> 
> http://elixir.free-electrons.com/linux/latest/source/Documentation/devicetree/bindings/dma/qcom_bam_dma.txt
> 
> http://elixir.free-electrons.com/linux/latest/source/Documentation/devicetree/bindings/spi/qcom,spi-qup.txt
> 

  Following are the partial list for NAND controller and supported
  SoC

   EBI2:          IPQ8064, APQ8064, MSM7xx, MDM9x15
   QPIC v1.4.0    MDM9x25, MDM9x35, MDM9x45, IPQ4019
   QPIC v1.5.0    MDM9x55, IPQ8074

  so could we use NAND controller specific compatible strings instead of 
SoC
  since it will easy to maintain?

>> 
>> Rob
