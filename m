From: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH] Document: dt: binding: imx: Fix PAD_CTL_DSE_X*
Date: Tue, 26 Feb 2019 14:21:59 +0100
Message-ID: <db6c2755e80e41f7c169406c213a40e8@agner.ch>
References: <20190222170038.9669-1-cquast@hanoverdisplays.com>
 <VI1PR04MB42227AA158BA1FCBF314AA27807B0@VI1PR04MB4222.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <VI1PR04MB42227AA158BA1FCBF314AA27807B0@VI1PR04MB4222.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Aisheng Dong <aisheng.dong@nxp.com>
Cc: Christina Quast <cquast@hanoverdisplays.com>, festevam@gmail.com, shawnguo@kernel.org, kernel@pengutronix.de, linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 26.02.2019 13:21, Aisheng Dong wrote:
>> From: Christina Quast [mailto:cquast@hanoverdisplays.com]
>> Sent: Saturday, February 23, 2019 1:01 AM
>>
>> In the iMX7d datasheet, the PAD_CTL_DSE_X* values are different from the
>> documentation.
>>
> 
> It's a doc problem.
> Latest RM seems got updated.
> 
> As here it's a reference definition in binding doc and device tree
> actually does not
> use it (IMX Pinctrl use raw data to set pad configuration). So it
> won't cause any
> compatibility issue to me.
> 
> Please update the patch title to:
> dt-bindings: pinctrl: imx7d: xxxxx
> 
> Otherwise:
> Ack-by: Dong Aisheng <aisheng.dong@nxp.com>

Btw, I saw that imx7d-sdb.dts (and probably other i.MX 7 boards too) use
three different settings for usdhc pinctrl: 0x59, 0x5a and 0x5b (for
default, 100MHz and 200MHz respectively). One would expect that higher
frequency use higher driver strength (and this is the case for i.MX 6).
But with this new/corrected pad values this means we use x4, x2 and x6
for default, 100MHz and 200MHz respectively. This hardly seems right..?
Probably needs fixing too?

--
Stefan


> 
> Regards
> Dong Aisheng
> 
>> Signed-off-by: Christina Quast <cquast@hanoverdisplays.com>
>> ---
>>  .../devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.txt       | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.txt
>> b/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.txt
>> index 6666277c3acb..8ac1d0851a0f 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.txt
>> +++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.txt
>> @@ -48,9 +48,9 @@ PAD_CTL_HYS                     (1 << 3)
>>  PAD_CTL_SRE_SLOW                (1 << 2)
>>  PAD_CTL_SRE_FAST                (0 << 2)
>>  PAD_CTL_DSE_X1                  (0 << 0)
>> -PAD_CTL_DSE_X2                  (1 << 0)
>> -PAD_CTL_DSE_X3                  (2 << 0)
>> -PAD_CTL_DSE_X4                  (3 << 0)
>> +PAD_CTL_DSE_X4                  (1 << 0)
>> +PAD_CTL_DSE_X2                  (2 << 0)
>> +PAD_CTL_DSE_X6                  (3 << 0)
>>
> 
> 
>>  Examples:
>>  While iomuxc-lpsr is intended to be used by dedicated peripherals to take
>> --
>> 2.20.1
>>
>>
>>
>>
>>
>> Please consider the environment before printing this email
>>
>>
>>
>>
>>
>> The information transmitted is intended only for the person or entity to which
>> it is addressed and may contain confidential and/or privileged material. Any
>> review, retransmission, dissemination or other use of, or taking of any action in
>> reliance upon, this information by persons or entities other than the intended
>> recipient is prohibited.
>> If you received this in error, please contact the sender or postmaster
>> (postmaster@hanoverdisplays.com) and delete the material from any
>> computer.
>> Although we routinely screen for viruses, addressees should check this e-mail
>> and any attachment for viruses. We make no warranty as to absence of viruses
>> in this e-mail or any attachments.
>> Our Company's email policy is to permit incidental personal use. If this email is
>> of a personal nature, it must not be relied upon as expressing the views or
>> opinions of the company.
