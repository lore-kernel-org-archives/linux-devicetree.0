From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] uio: dt-bindings: document binding for uio-pdrv-genirq
Date: Sun, 8 Oct 2017 20:32:43 -0500
Message-ID: <CAL_JsqKsYeFmx8Q2pRRyR0u+_W8UZdTNTyrVpu1pgMTvr_aafQ@mail.gmail.com>
References: <20170921154814.7510-1-chris.packham@alliedtelesis.co.nz>
 <20170921154814.7510-2-chris.packham@alliedtelesis.co.nz> <20171003213755.df4s35xdni6ywxwg@rob-hp-laptop>
 <22b9c6eb06ea4e8182c4e214b2a96fce@svr-chch-ex1.atlnz.lc>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <22b9c6eb06ea4e8182c4e214b2a96fce@svr-chch-ex1.atlnz.lc>
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sun, Oct 8, 2017 at 4:03 PM, Chris Packham
<Chris.Packham@alliedtelesis.co.nz> wrote:
> Hi Rob, Greg,
>
> On 04/10/17 10:38, Rob Herring wrote:
>> On Fri, Sep 22, 2017 at 03:48:13AM +1200, Chris Packham wrote:
>>> Document the device tree bindings for the uio-prv-genirq driver. Provide
>>> some examples on how it can be used.
>>>
>>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
>>> ---
>>>   .../bindings/uio/linux,uio-pdrv-genirq.txt         | 28 ++++++++++++++++++++++
>>>   1 file changed, 28 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/uio/linux,uio-pdrv-genirq.txt
>>
>> NAK.
>>
>> I'm sure this has come up before but if you want to map a device to a
>> uio driver, then add its compatible string to the driver. Bindings
>> describe h/w devices.
>
> Fair enough.
>
> The problem for me is that the uio-pdrv-genirq is so generic it could
> apply to pretty much any hardware device. The driver has dt-awareness
> but it currently doesn't have any built-in compatible string (it is set
> via a module param).
>
> My use-case is a microcontoller with a userspace driver all I need out
> of the kernel is i2c access and interrupts. Any suggestions as to how to
> move forward with this.

Define the binding for the uC regardless of how the driver is
implemented. Then add its compatible to the uio-pdev driver. That's
how we've dealt with spi-dev for example.

Rob
