From: Alexandre Pereira da Silva <aletes.xgr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC 2/2] usb: gadget: composite: parse dt overrides
Date: Mon, 25 Jun 2012 22:12:58 -0300
Message-ID: <CAAAP30Gad9-NjBq+b9R9qEw1tT-gEvsYCUPXAE5V74ANk_LnTA@mail.gmail.com>
References: <1340655832-30447-1-git-send-email-aletes.xgr@gmail.com>
	<4FE8F90B.2010303@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4FE8F90B.2010303-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jun 25, 2012 at 8:49 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wr=
ote:
> On 06/25/2012 03:23 PM, Alexandre Pereira da Silva wrote:
>> Grab the devicetree node properties to override VendorId, ProductId,
>> bcdDevice, Manucacturer, Product and SerialNumber
>>
>> Signed-off-by: Alexandre Pereira da Silva <aletes.xgr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>> =A0drivers/usb/gadget/composite.c | =A0 31 +++++++++++++++++++++++++=
++++++
>> =A01 file changed, 31 insertions(+)
>
> Are these bindings documented? I think they should be less generic.
> Perhaps prefixed with 'usb-'.

Not yet, I will in the final series. This was just to see it had big
issues because the final one needs to change lots of files.
I will add some prefix to them.

About the documentation, should I include it in all of the controllers
bindings or should I add a common file to describe the gadget drivers
binding?

>>
>> diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/com=
posite.c
>> index 390749b..f3b480e 100644
>> --- a/drivers/usb/gadget/composite.c
>> +++ b/drivers/usb/gadget/composite.c
>> @@ -17,6 +17,7 @@
>> =A0#include <linux/module.h>
>> =A0#include <linux/device.h>
>> =A0#include <linux/utsname.h>
>> +#include <linux/of.h>
>>
>> =A0#include <linux/usb/composite.h>
>> =A0#include <asm/unaligned.h>
>> @@ -1423,6 +1424,7 @@ static int composite_bind(struct usb_gadget *g=
adget)
>> =A0{
>> =A0 =A0 =A0 struct usb_composite_dev =A0 =A0 =A0 =A0*cdev;
>> =A0 =A0 =A0 int =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 status =3D -ENOMEM;
>> + =A0 =A0 struct device_node =A0 =A0 =A0 =A0 =A0 =A0 =A0*np =3D gadg=
et->dev.of_node;
>>
>> =A0 =A0 =A0 cdev =3D kzalloc(sizeof *cdev, GFP_KERNEL);
>> =A0 =A0 =A0 if (!cdev)
>> @@ -1470,6 +1472,35 @@ static int composite_bind(struct usb_gadget *=
gadget)
>>
>> =A0 =A0 =A0 cdev->desc =3D *composite->dev;
>>
>> + =A0 =A0 /* grab overrides from devicetree */
>
> Reading the code, it looks more like the DT entries are defaults rath=
er
> than overrides.

Actually, it's mixed. The DT overrides the hard coded defaults. And
module parameters can override both. I think the safest path is to
keep them like this, so a DT would not break existing code.

>> + =A0 =A0 if (np) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 u32 reg;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (!idVendor &&
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 of_property_read_u32(np, "=
vendor_id", &reg) =3D=3D 0)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 idVendor =3D reg;
>
> if (!idVendor)
> =A0 =A0 =A0 =A0of_property_read_u32(np, "vendor_id", &idVendor);
>
> Rob
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
