From: Crt Mori <cmo-fc6wVz46lShBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v4 3/3] dt-bindings: iio: temperature: add MLX90632 device bindings
Date: Tue, 12 Dec 2017 20:19:07 +0100
Message-ID: <CAKv63utbAiN3AdR1xRKbHjPeEN2fCGQ8ZocA=T2mKwciqYVfgw@mail.gmail.com>
References: <20171211092002.8687-1-cmo@melexis.com> <13b298c0-d618-e217-406d-63bac56106fc@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <13b298c0-d618-e217-406d-63bac56106fc-l3A5Bk7waGM@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linux Iio <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 12 December 2017 at 18:45, Andreas F=C3=A4rber <afaerber-l3A5Bk7waGM@public.gmane.org> wrote:
> Am 11.12.2017 um 10:20 schrieb Crt Mori:
>> Add device tree bindings for MLX90632 IR temperature sensor.
>>
>> Signed-off-by: Crt Mori <cmo-fc6wVz46lShBDgjK7y7TUQ@public.gmane.org>
>> Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> ---
>>  .../bindings/iio/temperature/mlx90632.txt          | 28 +++++++++++++++=
+++++++
>>  1 file changed, 28 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/iio/temperature/ml=
x90632.txt
>>
>> diff --git a/Documentation/devicetree/bindings/iio/temperature/mlx90632.=
txt b/Documentation/devicetree/bindings/iio/temperature/mlx90632.txt
>> new file mode 100644
>> index 000000000000..0b05812001f8
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/iio/temperature/mlx90632.txt
> [...]
>> +Example:
>> +
>> +mlx90632@3a {
>
> Shouldn't the node name be more general like temperature@3a?
>

None of the current temperature drivers have that, but it would be
nice for portability. I can prepare a patch to fix them all (a quick
check confirmed it is not consistent in pressure and light as well)

>> +     compatible =3D "melexis,mlx90632";
>> +     reg =3D <0x3a>;
>> +};
>
> Also generally the dt-bindings patch should go before the first use of
> the compatible string.
>

OK, will keep in mind in case of v5 to reorder the commits once again.

Best regards,
Crt
> Regards,
> Andreas
>
> --
> SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> GF: Felix Imend=C3=B6rffer, Jane Smithard, Graham Norton
> HRB 21284 (AG N=C3=BCrnberg)
