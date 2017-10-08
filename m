From: Chris Packham <Chris.Packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Subject: Re: [PATCH v2 1/2] uio: dt-bindings: document binding for
 uio-pdrv-genirq
Date: Sun, 8 Oct 2017 21:03:09 +0000
Message-ID: <22b9c6eb06ea4e8182c4e214b2a96fce@svr-chch-ex1.atlnz.lc>
References: <20170921154814.7510-1-chris.packham@alliedtelesis.co.nz>
 <20170921154814.7510-2-chris.packham@alliedtelesis.co.nz>
 <20171003213755.df4s35xdni6ywxwg@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob, Greg,=0A=
=0A=
On 04/10/17 10:38, Rob Herring wrote:=0A=
> On Fri, Sep 22, 2017 at 03:48:13AM +1200, Chris Packham wrote:=0A=
>> Document the device tree bindings for the uio-prv-genirq driver. Provide=
=0A=
>> some examples on how it can be used.=0A=
>>=0A=
>> Signed-off-by: Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>=0A=
>> ---=0A=
>>   .../bindings/uio/linux,uio-pdrv-genirq.txt         | 28 ++++++++++++++=
++++++++=0A=
>>   1 file changed, 28 insertions(+)=0A=
>>   create mode 100644 Documentation/devicetree/bindings/uio/linux,uio-pdr=
v-genirq.txt=0A=
> =0A=
> NAK.=0A=
> =0A=
> I'm sure this has come up before but if you want to map a device to a=0A=
> uio driver, then add its compatible string to the driver. Bindings=0A=
> describe h/w devices.=0A=
=0A=
Fair enough.=0A=
=0A=
The problem for me is that the uio-pdrv-genirq is so generic it could =0A=
apply to pretty much any hardware device. The driver has dt-awareness =0A=
but it currently doesn't have any built-in compatible string (it is set =0A=
via a module param).=0A=
=0A=
My use-case is a microcontoller with a userspace driver all I need out =0A=
of the kernel is i2c access and interrupts. Any suggestions as to how to =
=0A=
move forward with this.=0A=
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
