From: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH v1 2/2] mtd: docg3: add device-tree documentation
Date: Fri, 26 Sep 2014 19:19:49 +0200
Message-ID: <87h9zupadm.fsf@free.fr>
References: <1411684396-12094-1-git-send-email-robert.jarzmik@free.fr>
	<1411684396-12094-2-git-send-email-robert.jarzmik@free.fr>
	<20140926110546.GA7422@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140926110546.GA7422@leverpostej> (Mark Rutland's message of
	"Fri, 26 Sep 2014 12:05:47 +0100")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree@vger.kernel.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> writes:

>> +The Sandisk (former MSystems) docg3 is a nand device of 64M to 256MB.
>
> I think that should be: "(formerly M-Systems)".
Right.

> I'd rather we used the full name (DiskOnChip G3), as "docg3" is a
> Linux-specific abbreviation. So I think the compatible string should be
> something like "sandisk,diskonchip-g3". Arguably we should have
> M-Systems as the vendor.
"sandisk,diskonchip-g3" : full ack, for v2

For M-Systems, it's as you wish. Just so that you have the broad view, this is
my understanding of M-Systems / Sandisk :
 - M-Systems creates several diskonchip chips, especially docg3
 - M-Systems is bought and absorbed by Sandisk
 - Sandisk creates and ships other diskonchip, under sandisk brand

Now I'll put in the compat whatever you advice for, I have no opinion on
that. I'm telling you this because I have another patch to submit for a camera
sensor made by Aptina. Aptina was absorbed by Micron, and the sensor was
released under Aptina/Micron brand (ie. Aptina team in Micron corp. if I
understood correctly).

Therefore, I'll take your advice for both sandisk/msystems and aptina/micron :)

> Are we able to detect the particular variant by reading registers on the
> device? Are there any differences that we can probe dynamically (even if
> we don't care about those at the moment)?

Yes, what defines a docg3 is :
 - a device mapped at address 0
 - a read of the chip id gives DOC_CHIPID_G3

But there is a catch : the read is not a simple memory read, it's a write to a
register to set the "register to read", then a read in the iospace. Doing this
implies you know you are in the iospace of a docg3 ...
>
>> +
>> +Required properties:
>> + - compatible: Should be "sandisk,docg3"
>> + - reg: register base and size
>> +
>> +Example:
>> +	docg3 {
>> +		compatible = "sandisk,docg3";
>> +		reg = <0x0 0x2000>;
>
> There should be a unit-address on the node to match the address in the
> first reg entry.
You mean "#address-cells = <1>;", right ?

Cheers.

-- 
Robert
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
