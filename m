From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: [PATCH 1/2] DT: add binding for mxs regulator
Date: Mon, 29 Sep 2014 15:10:07 +0200
Message-ID: <54295A2F.3070700@i2se.com>
References: <1411779588-22031-1-git-send-email-stefan.wahren@i2se.com> <1411779588-22031-2-git-send-email-stefan.wahren@i2se.com> <20140929110919.GB2432@leverpostej> <54294832.8000702@i2se.com> <20140929124137.GD2432@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140929124137.GD2432@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: "lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

Am 29.09.2014 um 14:41 schrieb Mark Rutland:
> Well, the simple-bus will cause the children to be probed. But it looks
> like you care about properties of the parent. I don't think that
> simple-bus is appropriate because it's not being handled as a
> transparent bridge from the PoV of the children.

actually i need the address of the power status register. In this
version i get the base address from the parent node add an offset.

Do you prefer to define the address of the power status register like a
second address cell:

reg_vddd: regulator@80044040 {
	reg = <0x80044040 0x10
	       0x800440c0 0x01>;
        ...
};

or do i need special properties like this:

reg_vddd: regulator@80044040 {
	reg = <0x80044040 0x10>;
	fsl,mxs-status-reg = <0x800440c0>;
        ...
};

>> Do we need a extra driver?
> Perhaps, but it's relatively simple to match on a compatible string and
> probe children if you just wantto start small for now.

Okay. Would be great if someone has a good example. At first, i thought
of power/anatop.

>
>>>> +- #address-cells: Number of cells required to define regulator register,
>>>> +  must be 1
>>>> +- #size-cells: Number of cells required to define register size, must be 1
>>> Why must this be the case, given that the child node expects an absolute
>>> physical address?
>> I need a property to define the control register for the regulators
>> without defining vendor specific properties like "fsl,mxs-control-reg"
>> or something.
> You misunderstand me. I was querying the "must be 1" rather than the
> proeprties themselves.
>
>>> What's wrong with #address-cells = <2>, for example?
>> Nothing
> Then we shouldn't specify "must be 1", no?

Right, must be at least 1.

>>>> +- reg: Absolute physical address and size of the register set for the device
>>> Why is this here _and_ in the child node(s)?
>> The parent of the power node is also a simple bus. I use this to
>> calculate the power status register per offset.
>>
>>> What is the difference between this node and its children?
>> The parent node represent the power sub system and the regulators are
>> part of this sub system.
>>
>>> Can there be more than one sub-node?
>> In the i.MX28 are at least 4 voltage regulators, 1 current regulator and
>> many more. At first, the driver should implement only 3 voltage
>> regulators (vddd, vdda, vddio).
> Ok.
>
> I think you need a binding for the power subsystem, and a trivial driver
> that can match on that and probe the child regulators. Are there
> components other than voltage or current regulators in the sub system?

Yes, according to the reference manual there is a dc-dc converter, a
battery charger, battery monitor, ...

In short a lot of developing time ;-)

> Mark.

Best regards

Stefan

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
