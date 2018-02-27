Return-Path: <SRS0=GbRa=FV=mleia.com=vz@kernel.org>
Subject: Re: [PATCH 2/2] hwrng: mxc-rnga - add driver support on boards with
 device tree
References: <20180226183849.11562-1-vz@mleia.com>
 <20180226183849.11562-3-vz@mleia.com>
 <20180227094901.644cff57caadc97f65053d29@arm.com>
 <e5daefb3-7376-061a-96c7-ed708e17f6a2@mleia.com>
 <20180227133919.696ddfa9493885729ebdccd9@arm.com>
From: Vladimir Zapolskiy <vz@mleia.com>
Message-ID: <6b836cde-d5f7-4bcd-1218-59b11048e0f9@mleia.com>
Date: Tue, 27 Feb 2018 22:07:03 +0200
MIME-Version: 1.0
In-Reply-To: <20180227133919.696ddfa9493885729ebdccd9@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: Kim Phillips <kim.phillips@arm.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-crypto@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 02/27/2018 09:39 PM, Kim Phillips wrote:
> On Tue, 27 Feb 2018 18:53:08 +0200
> Vladimir Zapolskiy <vz@mleia.com> wrote:
> 
>> On 02/27/2018 05:49 PM, Kim Phillips wrote:
>>> On Mon, 26 Feb 2018 20:38:49 +0200
>>> Vladimir Zapolskiy <vz@mleia.com> wrote:
>>>
>>>> +#ifdef CONFIG_OF
>>>> +static const struct of_device_id mxc_rnga_of_match[] = {
>>>> +	{ .compatible = "fsl,imx31-rnga", },
>>>> +	{ /* sentinel */ },
>>>> +};
>>>> +MODULE_DEVICE_TABLE(of, mxc_rnga_of_match);
>>>> +#endif
>>>> +
>>>>  static struct platform_driver mxc_rnga_driver = {
>>>>  	.driver = {
>>>> -		   .name = "mxc_rnga",
>>>> -		   },
>>>> +		.name = "mxc_rnga",
>>>> +		.of_match_table = of_match_ptr(mxc_rnga_of_match),
>>>
>>> Does this build if CONFIG_OF is not set?
>>
>> Definitely it is expected to be built, you can verify it directly or
>> check of_match_ptr() macro definition from include/linux/of.h
> 
> Thanks, I verified it by removing the SOC_IMX31 dependency, and with
> netwinder_defconfig as a base.  I also verified that the #ifdef
> CONFIG_OF protecting the mxc_rnga_of_match definition is also not
> needed.

That's a commonplace observation, but I have serious doubts, if it
has become a common practice to remove CONFIG_OF and CONFIG_ACPI
macro guards around device id lists. Still I would prefer to save
compiled code size.

Arnd or Greg, your valued opinion is much appreciated.

--
With best wishes,
Vladimir
