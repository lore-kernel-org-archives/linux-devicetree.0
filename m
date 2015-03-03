From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v4 3/3] dtc: Document the dynamic plugin internals
Date: Tue, 3 Mar 2015 17:07:34 +0200
Message-ID: <9DAC79F7-593F-4CB4-9A4C-D8E4D7EDEEB3@konsulko.com>
References: <1425063346-14554-1-git-send-email-pantelis.antoniou@konsulko.com> <1425063346-14554-4-git-send-email-pantelis.antoniou@konsulko.com> <1425390172.3668.196.camel@pengutronix.de>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425390172.3668.196.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?utf-8?Q?Jan_L=C3=BCbbe?= <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Jan,

> On Mar 3, 2015, at 15:42 , Jan L=C3=BCbbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
>=20
> Hi Pantelis,
>=20
> On Fr, 2015-02-27 at 20:55 +0200, Pantelis Antoniou wrote:
>> +3.b) The Device Tree fragments must be compiled with the same optio=
n but they
>> +must also have a tag (/plugin/) that allows undefined references to=
 labels
>> +that are not present at compilation time to be recorded so that the=
 runtime
>> +loader can fix them.
>> +
>> +So the bar peripheral's DTS format would be of the form:
>> +
>> +/plugin/;	/* allow undefined label references and record them */
>> +/ {
>> +	....	/* various properties for loader use; i.e. part id etc. */
>> +	fragment@0 {
>> +		target =3D <&ocp>;
>> +		__overlay__ {
>> +			/* bar peripheral */
>> +			bar {
>> +				compatible =3D "corp,bar";
>> +				... /* various properties and child nodes */
>> +			}
>> +		};
>> +	};
>> +};
>> +
>> +Note that there's a target property that specifies the location whe=
re the
>> +contents of the overlay node will be placed, and it references the =
label
>> +in the foo.dts file.
>=20
> The kernel overlay code also supports using 'target-path=3D"/path";'
> instead of 'target=3D<phandle>;' to work with base DTBs which have no
> __symbols__ node. Shouldn't this be mentioned here as well?
>=20

The kernel documentation entries contain all relevant information. This=
 is just the DTC
support patch, and as such they only need a rough outline of what the a=
ctual in-kernel
resolver and overlay handler code does.

tl;dr DTC has no notion of either target or target-path properties.

> Thanks,
> Jan
> --=20
> Pengutronix e.K.                           |                         =
    |
> Industrial Linux Solutions                 | http://www.pengutronix.d=
e/  |
> Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0=
    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5=
555 |
>=20

Regards

=E2=80=94 Pantelis

--
To unsubscribe from this list: send the line "unsubscribe devicetree-co=
mpiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
