From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH v2 3/3] PCI: imx: Add support for i.MX8MQ
Date: Fri, 14 Dec 2018 14:55:49 -0600
Message-ID: <aacb613f-ad8b-8db9-1c63-a346ac62c772@embeddedor.com>
References: <20181206073545.10967-1-andrew.smirnov@gmail.com>
 <20181206073545.10967-4-andrew.smirnov@gmail.com>
 <20181214203042.GC20725@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181214203042.GC20725@google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Helgaas <helgaas@kernel.org>, Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: linux-pci@vger.kernel.org, Fabio Estevam <fabio.estevam@nxp.com>, cphealy@gmail.com, l.stach@pengutronix.de, Leonard Crestez <leonard.crestez@nxp.com>, "A.s. Dong" <aisheng.dong@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>, linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

On 12/14/18 2:30 PM, Bjorn Helgaas wrote:
> [+cc Gustavo for fallthrough annotation]

> 
>> @@ -301,6 +312,7 @@ static void imx6_pcie_assert_core_reset(struct imx6_pcie *imx6_pcie)
>>   
>>   	switch (imx6_pcie->variant) {
>>   	case IMX7D:
>> +	case IMX8MQ: /* FALLTHROUGH */
>>   		reset_control_assert(imx6_pcie->pciephy_reset);
>>   		reset_control_assert(imx6_pcie->apps_reset);
>>   		break;
> 
> I'm not an expert on fallthrough annotation (Gustavo, cc'd, is), but
> this looks wrong.  It's the IMX7D case that falls through, not the
> IMX8MQ case.
> 

Correct.

> The recent annotations added by Gustavo are at the point where the
> "break" would normally be, e.g.,
> 
>    case IMX7D:
>      /* fall through */                    <--- annotation
>    case IMX8MQ:
>      <code>
>      break;
> 
> But in this case there's actually no IMX7D-specific *code* there, so I
> suspect the annotation is unnecessary.  It's obvious that IMX7D and
> IMX8MQ are handled the same, so there's really no opportunity for the
> "forgotten break" mistake -Wimplicit-fallthrough is trying to find.
> 

Yep. That's correct. There is no need for those annotations in this patch.

> If we *do* want this annotation, we should spell it the same as
> Gustavo has been, i.e., "fall through".
> 

This is a matter of style. For -Wimplicit-fallthrough, "FALLTHROUGH" is 
as valid a "fall through".

Although, currently, there are 1997 instances of "fall through" vs 235 
of "FALLTHROUGH" in linux-next.

Thanks
--
Gustavo
