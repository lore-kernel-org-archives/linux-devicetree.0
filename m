From: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH-v2 5/5] mfd: 88pm800: Add support for clk subdevice
Date: Tue, 25 Aug 2015 14:08:26 +0530
Message-ID: <55DC2982.5010906@linaro.org>
References: <1440442594-3102-1-git-send-email-vaibhav.hiremath@linaro.org> <1440442594-3102-7-git-send-email-vaibhav.hiremath@linaro.org> <55DBFC40.3010603@samsung.com> <20150825074924.GD19409@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150825074924.GD19409@x1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On Tuesday 25 August 2015 01:19 PM, Lee Jones wrote:
> On Tue, 25 Aug 2015, Krzysztof Kozlowski wrote:
>
>> On 25.08.2015 03:56, Vaibhav Hiremath wrote:
>>> This patch adds mfd_cell/clk-subdevice for 88PM800 MFD
>>> (and family of devices).
>>>
>>> Signed-off-by: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>> ---
>>>   drivers/mfd/88pm800.c | 25 +++++++++++++++++++++++++
>>>   1 file changed, 25 insertions(+)
>>>
>>> diff --git a/drivers/mfd/88pm800.c b/drivers/mfd/88pm800.c
>>> index c4e097d..a928eed 100644
>>> --- a/drivers/mfd/88pm800.c
>>> +++ b/drivers/mfd/88pm800.c
>>> @@ -173,6 +173,14 @@ static const struct mfd_cell regulator_devs[] = {
>>>   	},
>>>   };
>>>
>>> +static struct mfd_cell clk_devs[] = {
>>> +	{
>>> +		.name = "88pm80x-clk",
>>> +		.of_compatible = "marvell,88pm800-clk",
>>> +		.id = -1,
>>
>> The "-1" here stands for PLATFORM_DEVID_NONE?
>
> Right.  Please use the define, but use it in the mfd_add_devices()
> call, rather than individual cells.
>

Ok,

Thanks,
Vaibhav
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
