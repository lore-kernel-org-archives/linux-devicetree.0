MIME-Version: 1.0
In-Reply-To: <af0d4155-c3bf-97cb-98b2-978093a30611@codeaurora.org>
References: <1519781889-16117-1-git-send-email-kramasub@codeaurora.org>
	<1519781889-16117-2-git-send-email-kramasub@codeaurora.org>
	<20180305235831.i7kxups7khus2g5c@rob-hp-laptop>
	<af0d4155-c3bf-97cb-98b2-978093a30611@codeaurora.org>
Date: Tue, 6 Mar 2018 07:22:44 -0600
Message-ID: <CAL_JsqJHSSsVs4Lut_f7Nk7NU1=NQnOvsyXz8g9-STrwO58GrA@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: soc: qcom: Add device tree binding
 for GENI SE
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Karthik Ramasubramanian <kramasub@codeaurora.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Wolfram Sang <wsa@the-dreams.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>, devicetree@vger.kernel.org, Linux I2C <linux-i2c@vger.kernel.org>, linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>, evgreen@chromium.org, acourbot@chromium.org, Sagar Dharia <sdharia@codeaurora.org>, Girish Mahadevan <girishm@codeaurora.org>
List-ID: <devicetree@vger.kernel.org>

On Mon, Mar 5, 2018 at 6:55 PM, Karthik Ramasubramanian
<kramasub@codeaurora.org> wrote:
>
>
> On 3/5/2018 4:58 PM, Rob Herring wrote:
>>
>> On Tue, Feb 27, 2018 at 06:38:06PM -0700, Karthikeyan Ramasubramanian
>> wrote:
>>>
>>> Add device tree binding support for the QCOM GENI SE driver.
>>>
>>> Signed-off-by: Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
>>> Signed-off-by: Sagar Dharia <sdharia@codeaurora.org>
>>> Signed-off-by: Girish Mahadevan <girishm@codeaurora.org>
>>> ---
>>>   .../devicetree/bindings/soc/qcom/qcom,geni-se.txt  | 89
>>> ++++++++++++++++++++++
>>>   1 file changed, 89 insertions(+)
>>>   create mode 100644
>>> Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt
>>> b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt
>>> new file mode 100644
>>> index 0000000..fe6a0c0
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt
>>> @@ -0,0 +1,89 @@
>>> +Qualcomm Technologies, Inc. GENI Serial Engine QUP Wrapper Controller
>>> +
>>> +Generic Interface (GENI) based Qualcomm Universal Peripheral (QUP)
>>> wrapper
>>> +is a programmable module for supporting a wide range of serial
>>> interfaces
>>> +like UART, SPI, I2C, I3C, etc. A single QUP module can provide upto 8
>>> Serial
>>> +Interfaces, using its internal Serial Engines. The GENI Serial Engine
>>> QUP
>>> +Wrapper controller is modeled as a node with zero or more child nodes
>>> each
>>> +representing a serial engine.
>>> +
>>> +Required properties:
>>> +- compatible:          Must be "qcom,geni-se-qup".
>>> +- reg:                 Must contain QUP register address and length.
>>> +- clock-names:         Must contain "m-ahb" and "s-ahb".
>>> +- clocks:              AHB clocks needed by the device.
>>> +
>>> +Required properties if child node exists:
>>> +- #address-cells:      Must be <1> for Serial Engine Address
>>> +- #size-cells:                 Must be <1> for Serial Engine Address
>>> Size
>>> +- ranges:              Must be present
>>> +
>>> +Properties for children:
>>> +
>>> +A GENI based QUP wrapper controller node can contain 0 or more child
>>> nodes
>>> +representing serial devices.  These serial devices can be a QCOM UART,
>>> I2C
>>> +controller, spi controller, or some combination of aforementioned
>>> devices.
>>
>>
>> s/spi/SPI/
>>
>> Where's the SPI binding?
>
> Since the patch series introduces UART and I2C drivers, I added the bindings
> only for them. I thought about adding the SPI binding when the SPI
> controller driver is introduced. Please let me know if you want me to add
> the bindings for SPI in this patch series itself.

There's no requirement to have the driver and I prefer bindings be as
complete as possible.

Rob
