From: guillaume La Roque <glaroque@baylibre.com>
Subject: Re: [PATCH v3 0/6] Add support of New Amlogic temperature sensor for
 G12 SoCs
Date: Wed, 21 Aug 2019 23:19:37 +0200
Message-ID: <9a63d585-69b1-c9b2-8092-51361ff41991@baylibre.com>
References: <20190806130506.8753-1-glaroque@baylibre.com>
 <357FACA6-6EAC-4E9D-B6F7-4D8D0D59A20A@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <357FACA6-6EAC-4E9D-B6F7-4D8D0D59A20A@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: daniel.lezcano@linaro.org, khilman@baylibre.com, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Christian,


thanks for testing on this 3 boards.


guillaume

On 8/14/19 2:24 PM, Christian Hewitt wrote:
> On 6 Aug 2019, at 5:05 pm, Guillaume La Roque <glaroque@baylibre.com> wrote:
>> This patchs series add support of New Amlogic temperature sensor and minimal
>> thermal zone for SEI510 and ODROID-N2 boards.
>>
>> First implementation was doing on IIO[1] but after comments i move on thermal framework.
>> Formulas and calibration values come from amlogic.
>>
>> Changes since v2:
>>  - fix yaml documention 
>>  - remove unneeded status variable for temperature-sensor node
>>  - rework driver after Martin review
>>  - add some information in commit message
>>
>> Changes since v1:
>>  - fix enum vs const in documentation
>>  - fix error with thermal-sensor-cells value set to 1 instead of 0
>>  - add some dependencies needed to add cooling-maps
>>
>> Dependencies :
>> - patch 3,4 & 5: depends on Neil's patch and series :
>>              - missing dwc2 phy-names[2]
>>              - patchsets to add DVFS on G12a[3] which have deps on [4] and [5]
>>
>> [1] https://lore.kernel.org/linux-amlogic/20190604144714.2009-1-glaroque@baylibre.com/
>> [2] https://lore.kernel.org/linux-amlogic/20190625123647.26117-1-narmstrong@baylibre.com/
>> [3] https://lore.kernel.org/linux-amlogic/20190729132622.7566-1-narmstrong@baylibre.com/
>> [4] https://lore.kernel.org/linux-amlogic/20190731084019.8451-5-narmstrong@baylibre.com/
>> [5] https://lore.kernel.org/linux-amlogic/20190729132622.7566-3-narmstrong@baylibre.com/
>>
>> Guillaume La Roque (6):
>>  dt-bindings: thermal: Add DT bindings documentation for Amlogic
>>    Thermal
>>  thermal: amlogic: Add thermal driver to support G12 SoCs
>>  arm64: dts: amlogic: g12: add temperature sensor
>>  arm64: dts: meson: sei510: Add minimal thermal zone
>>  arm64: dts: amlogic: odroid-n2: add minimal thermal zone
>>  MAINTAINERS: add entry for Amlogic Thermal driver
> Tested-by: Christian Hewitt <christianshewitt@gmail.com>
>
> I’ve tested this series with Odroid N2 and Khadas VIM3, X96-Max. Patches to add
> support for VIM3/X96-max will be submitted once the driver is merged.
>
> VIM3:~ # dmesg | grep thermal
> [    0.046375] thermal_sys: Registered thermal governor 'step_wise'
>
> VIM3:~ # cat /sys/devices/virtual/thermal/thermal_zone0/temp
> 51300
>
> VIM3:~ # cat /sys/devices/virtual/thermal/thermal_zone1/temp
> 52800
>
> Christian
