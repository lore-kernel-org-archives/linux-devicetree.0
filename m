From: Florian Vaussard <florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>
Subject: Re: [PATCH 2/3] iio: potentiometer: mcp4531: Add device tree binding
 documentation
Date: Wed, 22 Jun 2016 08:19:04 +0200
Message-ID: <b8fd47d0-f851-9700-e24c-4f33f5cf2342@heig-vd.ch>
References: <1466492137-32683-1-git-send-email-florian.vaussard@heig-vd.ch>
 <1466492137-32683-3-git-send-email-florian.vaussard@heig-vd.ch>
 <20160621214336.GB4370@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160621214336.GB4370@rob-hp-laptop>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Florian Vaussard <florian.vaussard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, Slawomir Stepien <sst-IjDXvh/HVVUAvxtiuMwx3w@public.gmane.org>, Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Cristina Moraru <cristina.moraru09-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

Le 21. 06. 16 =E0 23:43, Rob Herring a =E9crit :
> On Tue, Jun 21, 2016 at 08:55:36AM +0200, Florian Vaussard wrote:
>> Add the device tree documentation for all the supported parts. Apart=
 the
>> compatible string and standard I2C binding, no other binding is curr=
ently
>> needed.
>>
>> Signed-off-by: Florian Vaussard <florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>
>> ---
>>  .../bindings/iio/potentiometer/mcp4531.txt         | 84 +++++++++++=
+++++++++++
>>  1 file changed, 84 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/iio/potentiome=
ter/mcp4531.txt
>>
>> diff --git a/Documentation/devicetree/bindings/iio/potentiometer/mcp=
4531.txt b/Documentation/devicetree/bindings/iio/potentiometer/mcp4531.=
txt
>> new file mode 100644
>> index 0000000..b052299
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/iio/potentiometer/mcp4531.tx=
t
>> @@ -0,0 +1,84 @@
>> +* Microchip MCP453X/454X/455X/456X/463X/464X/465X/466X Digital Pote=
ntiometer
>> +  driver
>> +
>> +The node for this driver must be a child node of a I2C controller, =
hence
>> +all mandatory properties for your controller must be specified. See=
 directory:
>> +
>> +        Documentation/devicetree/bindings/i2c
>> +
>> +for more details.
>> +
>> +Required properties:
>> +	- compatible:  	Must be one of the following, depending on the
>> +			model:
>> +			"microchip,mcp4531-502"
>=20
> These can go in trivial-devices.txt
>=20

Yes indeed. I will fix.

Thanks for the review.

=46lorian

>> +			"microchip,mcp4531-103"
>> +			"microchip,mcp4531-503"
>> +			"microchip,mcp4531-104"
>> +			"microchip,mcp4532-502"
>> +			"microchip,mcp4532-103"
>> +			"microchip,mcp4532-503"
>> +			"microchip,mcp4532-104"
>> +			"microchip,mcp4541-502"
>> +			"microchip,mcp4541-103"
>> +			"microchip,mcp4541-503"
>> +			"microchip,mcp4541-104"
>> +			"microchip,mcp4542-502"
>> +			"microchip,mcp4542-103"
>> +			"microchip,mcp4542-503"
>> +			"microchip,mcp4542-104"
>> +			"microchip,mcp4551-502"
>> +			"microchip,mcp4551-103"
>> +			"microchip,mcp4551-503"
>> +			"microchip,mcp4551-104"
>> +			"microchip,mcp4552-502"
>> +			"microchip,mcp4552-103"
>> +			"microchip,mcp4552-503"
>> +			"microchip,mcp4552-104"
>> +			"microchip,mcp4561-502"
>> +			"microchip,mcp4561-103"
>> +			"microchip,mcp4561-503"
>> +			"microchip,mcp4561-104"
>> +			"microchip,mcp4562-502"
>> +			"microchip,mcp4562-103"
>> +			"microchip,mcp4562-503"
>> +			"microchip,mcp4562-104"
>> +			"microchip,mcp4631-502"
>> +			"microchip,mcp4631-103"
>> +			"microchip,mcp4631-503"
>> +			"microchip,mcp4631-104"
>> +			"microchip,mcp4632-502"
>> +			"microchip,mcp4632-103"
>> +			"microchip,mcp4632-503"
>> +			"microchip,mcp4632-104"
>> +			"microchip,mcp4641-502"
>> +			"microchip,mcp4641-103"
>> +			"microchip,mcp4641-503"
>> +			"microchip,mcp4641-104"
>> +			"microchip,mcp4642-502"
>> +			"microchip,mcp4642-103"
>> +			"microchip,mcp4642-503"
>> +			"microchip,mcp4642-104"
>> +			"microchip,mcp4651-502"
>> +			"microchip,mcp4651-103"
>> +			"microchip,mcp4651-503"
>> +			"microchip,mcp4651-104"
>> +			"microchip,mcp4652-502"
>> +			"microchip,mcp4652-103"
>> +			"microchip,mcp4652-503"
>> +			"microchip,mcp4652-104"
>> +			"microchip,mcp4661-502"
>> +			"microchip,mcp4661-103"
>> +			"microchip,mcp4661-503"
>> +			"microchip,mcp4661-104"
>> +			"microchip,mcp4662-502"
>> +			"microchip,mcp4662-103"
>> +			"microchip,mcp4662-503"
>> +			"microchip,mcp4662-104"
>> +	-reg: Slave I2C address of the potentiometer
>> +
>> +Example:
>> +mcp4561: mcp4561@2e {
>> +	compatible =3D "microchip,mcp4561-103";
>> +	reg =3D <0x2e>;
>> +};
>> --=20
>> 2.5.0
>>
