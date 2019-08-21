From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v3 0/6] Add support of New Amlogic temperature sensor for G12 SoCs
Date: Wed, 21 Aug 2019 14:30:17 -0700
Message-ID: <7himqq9pg6.fsf@baylibre.com>
References: <20190806130506.8753-1-glaroque@baylibre.com> <7hd0hd3mme.fsf@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7hd0hd3mme.fsf@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Guillaume La Roque <glaroque@baylibre.com>, daniel.lezcano@linaro.org
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Kevin Hilman <khilman@baylibre.com> writes:

> Guillaume La Roque <glaroque@baylibre.com> writes:
>
>> This patchs series add support of New Amlogic temperature sensor and minimal
>> thermal zone for SEI510 and ODROID-N2 boards.
>>
>> First implementation was doing on IIO[1] but after comments i move on thermal framework.
>> Formulas and calibration values come from amlogic.
>>
>> Changes since v2:
>>   - fix yaml documention 
>>   - remove unneeded status variable for temperature-sensor node
>>   - rework driver after Martin review
>>   - add some information in commit message
>>
>> Changes since v1:
>>   - fix enum vs const in documentation
>>   - fix error with thermal-sensor-cells value set to 1 instead of 0
>>   - add some dependencies needed to add cooling-maps
>>
>> Dependencies :
>> - patch 3,4 & 5: depends on Neil's patch and series :
>>               - missing dwc2 phy-names[2]
>>               - patchsets to add DVFS on G12a[3] which have deps on [4] and [5]
>>
>> [1] https://lore.kernel.org/linux-amlogic/20190604144714.2009-1-glaroque@baylibre.com/
>> [2] https://lore.kernel.org/linux-amlogic/20190625123647.26117-1-narmstrong@baylibre.com/
>> [3] https://lore.kernel.org/linux-amlogic/20190729132622.7566-1-narmstrong@baylibre.com/
>> [4] https://lore.kernel.org/linux-amlogic/20190731084019.8451-5-narmstrong@baylibre.com/
>> [5] https://lore.kernel.org/linux-amlogic/20190729132622.7566-3-narmstrong@baylibre.com/
>
> Thank you for the detailed list of dependencies!  Much appreciated.
>
> With all the deps, I tested this on sei510 and odroid-n2, and basic
> functionality seems to work.
>
> As discussed off-list: it would be nice to have an example of how
> cpufreq could be used as a cooling device for hot temperatures.  The
> vendor kernel has some trip points that could be included as examples,
> or even included as extra patches.
>
> Also the driver patch is missing the two main thermal maintainers, so
> please resend at least the driver and bindings including them.

Forgot to add...

Tested-by: Kevin Hilman <khilman@baylibre.com>
