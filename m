From: =?UTF-8?B?S2FuZW1hdHN1LCBTaGluamkv5YW85p2+IOS8uOasoQ==?=
        <kanematsu.shinji@socionext.com>
Subject: Re: [PATCH 1/2] dt-bindings: iio: counter: Add Milbeaut Updown
 Counter
Date: Tue, 2 Apr 2019 15:26:07 +0900
Message-ID: <976d5e2a-4bb8-3314-453b-921d06ba8ec6@socionext.com>
References: <1553581989-13525-1-git-send-email-kanematsu.shinji@socionext.com>
 <20190331015228.GA27625@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190331015228.GA27625@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: kanematsu.shinji@socionext.com, jic23@kernel.org, mark.rutland@arm.com, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, masami.hiramatsu@linaro.org, jaswinder.singh@linaro.org, orito.takao@socionext.com, sugaya.taichi@socionext.com, kasai.kazuhiro@socionext.com
List-Id: devicetree@vger.kernel.org

Hi Rob,

Thank you for your review.

On 2019/03/31 15:42, Rob Herring wrote:
> On Tue, Mar 26, 2019 at 03:33:09PM +0900, Shinji Kanematsu wrote:
>> Add documentation for Milbeaut Updown Counter device
>> quadrature encoder and counter binding.
>>
>> Signed-off-by: Shinji Kanematsu <kanematsu.shinji@socionext.com>
>> ---
>>   .../bindings/iio/counter/milbeaut-updown_cnt.txt   | 22 ++++++++++++++++++++++
>>   1 file changed, 22 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/iio/counter/milbeaut-updown_cnt.txt
>>
>> diff --git a/Documentation/devicetree/bindings/iio/counter/milbeaut-updown_cnt.txt b/Documentation/devicetree/bindings/iio/counter/milbeaut-updown_cnt.txt
>> new file mode 100644
>> index 0000000..6771567
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/iio/counter/milbeaut-updown_cnt.txt
>> @@ -0,0 +1,22 @@
>> +SOCIONEXT Milbeaut Updown counter
>> +
>> +Required properties:
>> +- compatible:       Must be "socionext,milbeaut-updown-counter".
>> +- reg:              Offset and length of the device's register set.
>> +- clocks:           Phandle to the clock used by the Updown counter module.
>> +- clock-names:      Must be "mux".
>> +- interrupts:       SPI number of the device's set.
>> +- cms_type:         connected_device
>> +                     1: updown button  (updown counter mode)
>> +                     2: rotary encoder (phase difference counter mode)
> 
> We should have a common property for describing what's attached.
> IIRC, just had a similar binding recently.
> 

OK, I search the similar binding.

Thank you,
Kanematsu

>> +
>> +Example:
>> +
>> +	updown0: updown@1e002000 {
>> +		compatible = "socionext,milbeaut-updown-counter";
>> +		reg = <0x1e002000 0x20>;
>> +		clocks = <&clk 4>;
>> +		clock-names = "mux";
>> +		interrupts = <0 104 0x4>;
>> +		cms_type = <1>;
>> +	};
>> -- 
>> 1.9.1
>>
> 
