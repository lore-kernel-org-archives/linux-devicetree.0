From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: [PATCH 1/2] DT: add binding for mxs regulator
Date: Mon, 29 Sep 2014 13:53:22 +0200
Message-ID: <54294832.8000702@i2se.com>
References: <1411779588-22031-1-git-send-email-stefan.wahren@i2se.com> <1411779588-22031-2-git-send-email-stefan.wahren@i2se.com> <20140929110919.GB2432@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140929110919.GB2432@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: "lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Mark,

Am 29.09.2014 um 13:09 schrieb Mark Rutland:
> On Sat, Sep 27, 2014 at 01:59:47AM +0100, Stefan Wahren wrote:
>> This patch adds the Device tree bindings for the Freescale MXS
>> on-chip regulators.
>>
>> Signed-off-by: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
>> ---
>>  .../bindings/regulator/mxs-regulator.txt           |   36 ++++++++++++++++++++
>>  1 file changed, 36 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/regulator/mxs-regulator.txt
>>
>> diff --git a/Documentation/devicetree/bindings/regulator/mxs-regulator.txt b/Documentation/devicetree/bindings/regulator/mxs-regulator.txt
>> new file mode 100644
>> index 0000000..e3133a4
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/regulator/mxs-regulator.txt
>> @@ -0,0 +1,36 @@
>> +MXS regulators
>> +
>> +Required node properties:
>> +- compatible: Should be "simple-bus"
> This does not look like an appropriate use of simple-bus.
>
> Why do you want the parent node to be a simple-bus?

the current parent node in imx28.dtsi looks like a placeholder for the
power sub system:

power: power@80044000 {
	reg = <0x80044000 0x2000>;
	status = "disabled";
};

I want to trigger the probing of the child nodes (regulators) without
writing a driver for the complete power sub system. The simple-bus
avoids that.

Do we need a extra driver?

>
>> +- #address-cells: Number of cells required to define regulator register,
>> +  must be 1
>> +- #size-cells: Number of cells required to define register size, must be 1
> Why must this be the case, given that the child node expects an absolute
> physical address?

I need a property to define the control register for the regulators
without defining vendor specific properties like "fsl,mxs-control-reg"
or something.

> What's wrong with #address-cells = <2>, for example?

Nothing

>
>> +- reg: Absolute physical address and size of the register set for the device
> Why is this here _and_ in the child node(s)?

The parent of the power node is also a simple bus. I use this to
calculate the power status register per offset.

> What is the difference between this node and its children?

The parent node represent the power sub system and the regulators are
part of this sub system.

> Can there be more than one sub-node?

In the i.MX28 are at least 4 voltage regulators, 1 current regulator and
many more. At first, the driver should implement only 3 voltage
regulators (vddd, vdda, vddio).

> Mark.
>

Best regards

Stefan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
