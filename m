From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 3/4] charger-manager: Add device tree binding for
 charger-manager
Date: Sat, 26 Oct 2013 12:00:51 +0900
Message-ID: <526B3063.30600@samsung.com>
References: <1382446317-32613-1-git-send-email-cw00.choi@samsung.com>
 <1382446317-32613-4-git-send-email-cw00.choi@samsung.com>
 <20131025200344.85AA5C40566@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20131025200344.85AA5C40566-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: anton-9xeibp6oKSgdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Grant,

On 10/26/2013 05:03 AM, Grant Likely wrote:
> On Tue, 22 Oct 2013 21:51:56 +0900, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>> This patch add binding file for charger-manager that this framework enables to
>> control and multiple chargers and to monitor charging event.
>>
>> Signed-off-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Signed-off-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Signed-off-by: Myungjoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> ---
>>  .../devicetree/bindings/power/charger-manager.txt  | 106 +++++++++++++++++++++
>>  1 file changed, 106 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/power/charger-manager.txt
>>
>> diff --git a/Documentation/devicetree/bindings/power/charger-manager.txt b/Documentation/devicetree/bindings/power/charger-manager.txt
>> new file mode 100644
>> index 0000000..b22c5526
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/power/charger-manager.txt
>> @@ -0,0 +1,106 @@
>> +Charger-manager framework
>> +
>> +THe devicetree bindings are for the charger-manager to control charging feature.
>> +
>> +This framework enables to control and multiple chargers and to monitor charging
>> +event in the context of suspend-to-RAM with an interface combining the chargers.
>> +
>> +Required Properties:
>> +- compatible:		Must be "charger-manager".
>> +- psy-name:		The name of power-supply class for charger-manager.
>> +- polling-mode:		Determine which polling mode will be used.
>> +- polling-invertal-ms:	Interval in millisecond at which charger-manager will
>> +			monitor battery health.
>> +- fullbatt-vchkdrop-ms
>> +- fullbatt-vchkdrop-uV:	Check voltage drop afer the battery is fully charged.
>> +			If it has dropped more than fullbatt_vchkdrop_uV after
>> +			fullbatt_vchkdrop_ms, charger-manager will restart
>> +			charging.
>> +- fullbatt-uV:		The standard voltage in microvolt for checking
>> +			fully charged. If VBATT >= fullbatt_uV, it is assumed to
>> +			be full.
>> +- fullbatt-soc:		The standard SOC(State Of Charger) for checking
>> +			fully charged. If state of Charge >= fullbatt_soc, it is
>> +			assumed to be full.
>> +- fullbatt-full-capacity: The standard capacity for checking fully charged.
>> +			If full capacity of battery >= fullbatt_full_capacity,
>> +			it is assumed to be full.
>> +- battery-present:	Specify where information for existance of battery
>> +			can be obtained.
>> +- measure-battery-temp:	Whether to measure battery or not
>> +
>> +- charging-max-duration-minute:		Maximum possible duration for charging.
>> +			If whole charging duration exceed 'charging-max-duration
>> +			-ms', charger-manager stop charging.
>> +- discharging-max-duration-minute:	Maximum possible duration for
>> +			discharging with charger cable after full-batt. If
>> +			discharging duration exceed 'discharging-max-duration-
>> +			ms', charger-manager start charging.
>> +- psy-fuelgauge-name:	The name of power-supply for fuel gauge
>> +- io-channels:		The iio channel data for ADC
>> +- iio-adc-overheat:	The value of the highest ADC for temperature
>> +- iio-adc-cold:		The value of the lowest ADC for temperature
>> +- psy-chargers:		Arrary of power-supply name for chargers.
>> +- charger-regulators:	Array of charger regulators. It include charger cable
>> +			data which need cable-name/extcon-name/min-current-uA
>> +			max-current-uA. When cable is attached/detached,
>> +			charger-manager change current limit of regulator
>> +			according to min-current-uA/max-current-uA.
> 
> The documentation for the above properties needs to specify what the
> values actually mean. For example, "polling-mode" is documented as
> "Determine which polling mode will be used". Huh? What is the difference
> between a value of 0 or 1? What values are valid? What do they mean?
> 
> As it stands I suspect that the binding is a direct translation from the
> existing pdata structure. That probably isn't really what you want. Some
> of the properties above do make sense and are documented correctly (ie.
> fullbatt-*), but others don't make sense and probably shouldn't be part
> of the generic binding (ie. io-channels sounds like something device
> specific).
> 
> I'll defer to the regulators people on what does and does not make
> sense.
> 

OK, I add detailed and easy description for improving the understanding
in accordance with your comment and will resend this patchset.

Thanks.

Best Regards,
Chanwoo Choi
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
