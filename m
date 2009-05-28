From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC] [PATCH] Device Tree on ARM platform
Date: Thu, 28 May 2009 08:13:34 -0600
Message-ID: <fa686aa40905280713u2b3ef5fvbe3d58ccdb629b60@mail.gmail.com>
References: <20090527175609.GB31861@flint.arm.linux.org.uk>
	<1243496236.3171.140.camel@pasglop>
	<20090528091513.GA14789@n2100.arm.linux.org.uk>
	<20090528.025739.16559619.davem@davemloft.net>
	<gvlvcs$ub5$1@ger.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <gvlvcs$ub5$1@ger.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-xIg/pKzrS19vn6HldHNs0ANdhmdF6hFW@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, May 28, 2009 at 6:17 AM, Dmitry Eremin-Solenikov
<dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> David Miller wrote:
>
>> From: Russell King - ARM Linux
>> <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> Date: Thu, 28 May 2009
>> 10:15:13 +0100
>>
>>> For example, how would an IrDA transceiver be expressed in OF?
>>
>> As a child device node of the IRDA device, with associated properties.
>>
>> You can express _ANYTHING_ using the OF device tree. =A0It is not even
>> something to discuss, it's flexible enough.
>
> Hmmm. How to express the following situation:
> On one of my platforms (sharp tosa) the backlight controller
> is separated into two parts: one sitting on SPI, one on the I2C.
> The tricky part is that the I2C part is only available when some
> of registers of SPI part are programmed in a specific way.

Perhaps something like this (in dts format):

spi@[someaddress] {
        #size-cells =3D <0>;
        #address-cells =3D <1>;
        compatible =3D "name-of-spi-bus-device";
        reg =3D <[someaddress] [size]>;
        backlight-spi: backlight@5 {
                compatible =3D "sharp,backlight-spi";
                reg =3D <5>;  /* CS line # 5 */
        }
}

i2c@[anotheraddress] {
        #size-cells =3D <0>;
        #address-cells =3D <1>;
        compatible =3D "name-of-i2c-bus-device";
        reg =3D <[anotheraddress] [size]>;
        backlight@30 {
                compatible =3D "sharp,backlight-i2c";
                reg =3D <30>;
                spi-interface-phandle =3D < &backlight-spi >;
        }
}

Two nodes are used to describe the device and a "phandle" is used to
link them.  A device driver probe could be triggered (bind) against
the i2c half of the device and follow the phandle to get the rest of
the description.

g.

-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
