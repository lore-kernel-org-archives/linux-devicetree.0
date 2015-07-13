From: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/6] mfd: devicetree: bindings: 88pm800: Add DT property
 for 32KHz output enable
Date: Mon, 13 Jul 2015 13:08:14 +0530
Message-ID: <55A36AE6.5070802@linaro.org>
References: <1436442431-3471-1-git-send-email-vaibhav.hiremath@linaro.org> <1436442431-3471-4-git-send-email-vaibhav.hiremath@linaro.org> <55A0C1B8.4030402@samsung.com> <55A367BE.6040103@linaro.org> <55A36939.7070607@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55A36939.7070607-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org



On Monday 13 July 2015 01:01 PM, Krzysztof Kozlowski wrote:
> On 13.07.2015 16:24, Vaibhav Hiremath wrote:
>>
>>
>> On Saturday 11 July 2015 12:41 PM, Krzysztof Kozlowski wrote:
>>> W dniu 09.07.2015 o 20:47, Vaibhav Hiremath pisze:
>>>> 88PM800 family of device supports output of 32KHz clock (low jitte=
r)
>>>> on CLK32K2/3 pin which can be supplied to other peripherals on the
>>>> board.
>>>>
>>>> This patch adds the devicetree binding to enable this feature.
>>>>
>>>> Signed-off-by: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>>> ---
>>>>    Documentation/devicetree/bindings/mfd/88pm800.txt | 6 ++++++
>>>>    1 file changed, 6 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/mfd/88pm800.txt
>>>> b/Documentation/devicetree/bindings/mfd/88pm800.txt
>>>> index dec842f..ae1311c 100644
>>>> --- a/Documentation/devicetree/bindings/mfd/88pm800.txt
>>>> +++ b/Documentation/devicetree/bindings/mfd/88pm800.txt
>>>> @@ -9,6 +9,12 @@ Required parent device properties:
>>>>    - #interrupt-cells     : should be 1.
>>>>                  The cell is the 88pm80x local IRQ number
>>>>
>>>> +Optional properties :
>>>> + - marvell,88pm800-32khz-xolj-out-en    : If set, driver will ena=
ble
>>>> low jitter
>>>> +   version of 32Khz clock output on
>>>
>>> I am not sure if I understand it correctly. The hardware always has=
 such
>>> clocks and you only want to enable/disable it in DT? Any reasons wh=
y
>>> these should not be enabled always?
>>>
>>
>> Small amount of Power savings...
>> Although currently I do not have power numbers to justify this.
>>
>> As per spec, (it only talks about power consumption in power down st=
ate)
>>
>> Power-down State =3D> VSYS > 2.8   =3D> 4.5 =CE=BCA
>>                      CLK32K2 =3D 0  =3D> 18 =CE=BCW
>
> This would be a power saving if it could be enabled/disabled runtime.
> But with DT you will either:
> 1. enable it always so there won't be any power saving,
> 2. disable it always so there won't be such clock.
>
> I can find a use case - when on some boards the clock output is not
> wired to anything so it cannot be used. In other cases (there is some
> potential user) this should be triggered per-use (runtime enabled/dis=
abled).
>

Exactly,

> Do you have such case? I mean boards where this is not connected at a=
ll
> and boards where this is used?
>

The PXA1928 based board which I have,

CLK32K1 (G3 pad)  =3D Used by Wireless chip
CLK32K2 (G11 pad) =3D Not connected to anything, so we need to disable
                     this output

>>> Enabling it in DT does not look like a job for DT. Maybe you there
>>> should be just a clock driver (clock provider)?
>>>
>>
>> It's init time (and one time) settings, wouldn't clock-provider
>> be overkill for this?
>
> The clock provider would be a proper way to do it and some PMICs I kn=
ow
> do this. Examples are max77686 and s5m8767/s2mps11. These are PMICs u=
sed
> for Samsung SoCs. They have two or three 32kHz clocks.
>

This is good to know.
Let me take a look at these drivers.

Thanks,
Vaibhav

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
