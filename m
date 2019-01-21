From: sebastien bourdelin <sebastien.bourdelin@gmail.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: iio: chemical: Add bindings for
 bme680
Date: Mon, 21 Jan 2019 16:43:26 -0500
Message-ID: <31759389-7498-6478-2408-a6de2fde9fc1@gmail.com>
References: <20190111205359.14158-1-sebastien.bourdelin@gmail.com>
 <20190111205359.14158-2-sebastien.bourdelin@gmail.com>
 <20190112182837.4cc42743@archlinux>
 <4768d945-61aa-a8ab-3e41-68b4f861cc69@gmail.com>
 <20190119165709.5045a18b@archlinux>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190119165709.5045a18b@archlinux>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, himanshujha199640@gmail.com, mark.rutland@arm.com, robh+dt@kernel.org, pmeerw@pmeerw.net, lars@metafoo.de, knaack.h@gmx.de
List-Id: devicetree@vger.kernel.org


On 1/19/19 11:57 AM, Jonathan Cameron wrote:
> On Mon, 14 Jan 2019 15:17:10 -0500
> sebastien bourdelin <sebastien.bourdelin@gmail.com> wrote:
>
>> On 1/12/19 1:28 PM, Jonathan Cameron wrote:
>>> On Fri, 11 Jan 2019 15:53:59 -0500
>>> Sebastien Bourdelin <sebastien.bourdelin@gmail.com> wrote:
>>>   
>>>> BME680 is a pressure/temperature/humidity/voc sensor.
>>>>
>>>> Signed-off-by: Sebastien Bourdelin <sebastien.bourdelin@gmail.com>
>>> Hmm. We could add the VDD and VDIO regulators perhaps.
>>> Driver assumes they are on currently but we'll get a board where control
>>> is needed sooner or later.  I'm not that fussed about this though.
>> If that's fine with you, i prefer to leave it as it is right now as i
>> don't feel
>>
>> confident enough to correctly explain it in the Documentation.
>>
>> But if you have more input, you are more then welcome!
> Given we aren't planning to do more than turn them on and that'll work
> fine with stub regulators (so they can effectively be optional for ever),
> there is no particular need to put them in now if you prefer not to.
>
> Jonathan
Ok Thanks Jonathan!
>>> Jonathan
>>>   
>>>> ---
>>>>    .../devicetree/bindings/iio/chemical/bme680.txt       | 11 +++++++++++
>>>>    1 file changed, 11 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/iio/chemical/bme680.txt
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/iio/chemical/bme680.txt b/Documentation/devicetree/bindings/iio/chemical/bme680.txt
>>>> new file mode 100644
>>>> index 000000000000..885a1b918340
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/iio/chemical/bme680.txt
>>>> @@ -0,0 +1,11 @@
>>>> +Bosch Sensortec BME680 pressure/temperature/humidity/voc sensors
>>>> +
>>>> +Required properties:
>>>> +- compatible: must be "bosch,bme680"
>>>> +
>>>> +Example:
>>>> +
>>>> +bme680@77 {
>>>> +          compatible = "bosch,bme680";
>>>> +          reg = <0x77>;
>>>> +};
