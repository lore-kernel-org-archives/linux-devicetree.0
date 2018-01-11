From: Shunqian Zheng <zhengsq@rock-chips.com>
Subject: Re: [PATCH v5 1/4] dt-bindings: media: Add bindings for OV5695
Date: Thu, 11 Jan 2018 14:44:33 +0800
Message-ID: <807c4307-0617-788e-7129-039b33ce99d5@rock-chips.com>
References: <1515549967-5302-1-git-send-email-zhengsq@rock-chips.com>
 <1515549967-5302-2-git-send-email-zhengsq@rock-chips.com>
 <20180110092010.GC6834@w540>
Reply-To: zhengsq@rock-chips.com
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <20180110092010.GC6834@w540>
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
To: jacopo mondi <jacopo@jmondi.org>
Cc: mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, ddl@rock-chips.com, tfiga@chromium.org
List-Id: devicetree@vger.kernel.org

Hi Jacopo,


On 2018年01月10日 17:20, jacopo mondi wrote:
> Hi Shunqian,
>
> On Wed, Jan 10, 2018 at 10:06:04AM +0800, Shunqian Zheng wrote:
>> Add device tree binding documentation for the OV5695 sensor.
>>
>> Signed-off-by: Shunqian Zheng <zhengsq@rock-chips.com>
>> ---
>>   .../devicetree/bindings/media/i2c/ov5695.txt       | 41 ++++++++++++++++++++++
>>   1 file changed, 41 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/media/i2c/ov5695.txt
>>
>> diff --git a/Documentation/devicetree/bindings/media/i2c/ov5695.txt b/Documentation/devicetree/bindings/media/i2c/ov5695.txt
>> new file mode 100644
>> index 0000000..2f2f698
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/i2c/ov5695.txt
>> @@ -0,0 +1,41 @@
>> +* Omnivision OV5695 MIPI CSI-2 sensor
>> +
>> +Required Properties:
>> +- compatible: shall be "ovti,ov5695"
>> +- clocks: reference to the xvclk input clock
>> +- clock-names: shall be "xvclk"
>> +- avdd-supply: Analog voltage supply, 2.8 volts
>> +- dovdd-supply: Digital I/O voltage supply, 1.8 volts
>> +- dvdd-supply: Digital core voltage supply, 1.2 volts
>> +- reset-gpios: Low active reset gpio
>> +
>> +The device node shall contain one 'port' child node with an
>> +'endpoint' subnode for its digital output video port,
>> +in accordance with the video interface bindings defined in
>> +Documentation/devicetree/bindings/media/video-interfaces.txt.
>> +The endpoint optional property 'data-lanes' shall be "<1 2>".
> What happens if the property is not present? What's the default?
I think it depends on how the video receiver deal with, 'data-lanes' is 
optional as described in video-interfaces.txt,
but if somehow it used in DT, the value "<1 2>" is the right one.
>
> I would:
>
> Required Properties:
> - compatible: ..
> ....
>
> Option Endpoint Properties:
> - data-lanes: ...
>
>> +
>> +Example:
>> +&i2c7 {
>> +	camera-sensor: ov5695@36 {
> You have inverted the label with the node name which should be generic
>
>          ov5695: camera@36 {
>
>
>          }
> Thanks
>     j
Thank you very much~
Shunqian
>
>
