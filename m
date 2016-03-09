From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 4/5] iio:magnetometer:ak8975: mounting matrix support
Date: Wed, 9 Mar 2016 20:46:09 +0000
Message-ID: <56E08B91.6070603@kernel.org>
References: <cover.1457001111.git.gregor.boirie@parrot.com>
 <022da3dfc0853c6f9820b24c2d9eaaf0c5ccf294.1457001111.git.gregor.boirie@parrot.com>
 <56DAFCEB.6080905@kernel.org> <56E0014D.1040209@parrot.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56E0014D.1040209-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gregor Boirie <gregor.boirie-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Irina Tirdea <irina.tirdea-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Cristina Moraru <cristina.moraru09-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Baluta <daniel.baluta-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 09/03/16 10:56, Gregor Boirie wrote:
>=20
> On 03/05/2016 04:36 PM, Jonathan Cameron wrote:
>> On 03/03/16 10:44, Gregor Boirie wrote:
>>> Expose a rotation matrix to indicate userspace the chip placement w=
ith
>>> respect to the overall hardware system. This is needed to adjust
>>> coordinates sampled from a magnetometer chip when its position devi=
ates
>>> from the main hardware system.
>>>
>>> Final coordinates computation is delegated to userspace since:
>>> * computation may involve floating point arithmetics ;
>>> * it allows an application to combine adjustments with arbitrary
>>>    transformations.
>>>
>>> This 3 dimentional space rotation matrix is expressed as 3x3 array =
of
>>> strings to support floating point numbers. It may be retrieved from=
 a
>>> "in_magn_matrix" sysfs attribute file. It is declared into ak8975 D=
TS
>>> entry as a "matrix" property.
>>>
>>> Signed-off-by: Gregor Boirie <gregor.boirie-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>
>> This one definitely wants to go to the device tree list. I'd also li=
ke a few
>> IIO related comments as well. I was sure we'd been through this befo=
re and
>> ended up with some sort of solution, but now I can't find it... Oh w=
ell.
> I took inv_mpu_core as an example. However matrices are exposed as in=
tegers
> and we really need floating point support.
> A search on the device-tree mailing list archive does not show up wit=
h a
> solution to encode floating point numbers into DTS either.
Certainly non obvious how to do this.

=46or anyone device tree related who picks this up (I've added a CC)
we are basically talking about passing a rotation matrix from the devic=
e tree
straight through to userspace to describe the relative orientation of
some sensor.  An array of strings clearly works, but is this the best
way to do it?

(btw as this touches device tree bindings the list and maintainers
should have been cc'd from the start - another one of those kernel
conventions that are non obvious to people who haven't hit it before.
Doing this was a big news item a few years back when a policy to keep
bindings reviewed in a manageable way was decided, but if you weren't
active at the time then you wouldn't necessarily know).
>=20
>>
>> Definitely needs ABI docs in Documentation/ABI/testing/sysfs-bus-iio
>> as well. We need the reference directions to be well specified as
>> well - how do we define the main hardware orientation?  on yours pre=
sumably
>> the usual approach of using the screen is irrelevant so that definit=
ion
>> could be a little 'interesting' to write down?
> The standard orientation for us is defined with respect to the drone'=
s head
> and the propellers plane, which does not suit the nominal use cases i=
ndeed...
> Although it really deserves some more detailed documentation, I wonde=
r if the
> question is relevant.
> Given that the DTS is board specific (correct me if I'm wrong), why n=
ot
> consider the reference orientation as board specific as well (and mak=
e the
> whole thing implicit) ?
I think that is fine for your sort of usecase - though might be nice to=
 keep
a bit of documentation somewhere (perhaps as comments in the DTS), or p=
erhaps
more centrally - would be nice for userspace libraries if at least all =
aircraft
had a similar 'default orientation'.

=46or the more 'standard' device with a screen I think we would want to=
 standardise
if at all possible.  Most hand held devices have a 'natural' orientatio=
n=20
(front facing camera at the top for example).  In those cases we are ba=
sically looking
at whether the sensor is mounted on the back or the front of the main c=
ircuit board and
then of course it can be at any rotation in plane but typically is at 9=
0 degrees
(hence the inv mpu limitations)

I'm guessing there are existing userspace mappings for this.  Perhaps i=
n the Gnome
sensors stuff?

>=20
>>
>> I'm also unsure of whether the right thing to do in the 'not provide=
d'
>> cases is to not export the setting, or to assume that the chip is at=
 some
>> 'standard' orientation and provide that?
> As a self-explanatory interface, I suppose sysfs convention would exp=
ect to expose
> this even in the case of an identity matrix.
> However, userspace would need to either:
> * systematically apply rotation matrix ;
> * or detect identity matrix and skip rotation which may require an a-=
priori
>   knowledge of reference orientation (breaking the statement mentione=
d above).
>=20
> Personally, I'd prefer not exporting the property at all when aligned=
 with
> the main hardware orientation : this makes application simpler and al=
lows for
> better performances.
Make sense.  Much as we don't bother exporting scales of 1 or offsets o=
f 0.
>=20
> What do you think ?
> Gr=E9gor.
>=20
>>
>> Jonathan
>>
>>> ---
>>>   .../bindings/iio/magnetometer/ak8975.txt           | 10 +++++
>>>   drivers/iio/magnetometer/ak8975.c                  | 46 +++++++++=
++++++++++++-
>>>   2 files changed, 55 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/iio/magnetometer/ak8=
975.txt b/Documentation/devicetree/bindings/iio/magnetometer/ak8975.txt
>>> index 34a3206..f936f86 100644
>>> --- a/Documentation/devicetree/bindings/iio/magnetometer/ak8975.txt
>>> +++ b/Documentation/devicetree/bindings/iio/magnetometer/ak8975.txt
>>> @@ -9,6 +9,7 @@ Optional properties:
>>>       - gpios : should be device tree identifier of the magnetomete=
r DRDY pin
>>>     - vdd-supply: an optional regulator that needs to be on to prov=
ide VDD
>>> +  - matrix: an optional 3x3 mounting rotation matrix
>>>     Example:
>>>   @@ -17,4 +18,13 @@ ak8975@0c {
>>>           reg =3D <0x0c>;
>>>           gpios =3D <&gpj0 7 0>;
>>>           vdd-supply =3D <&ldo_3v3_gnss>;
>>> +        matrix =3D "-0.984807753012208",  /* x0 */
>>> +                 "0",                   /* y0 */
>>> +                 "-0.173648177666930",  /* z0 */
>>> +                 "0",                   /* x1 */
>>> +                 "-1",                  /* y1 */
>>> +                 "0",                   /* z1 */
>>> +                 "-0.173648177666930",  /* x2 */
>>> +                 "0",                   /* y2 */
>>> +                 "0.984807753012208";   /* z2 */
>>>   };
>>> diff --git a/drivers/iio/magnetometer/ak8975.c b/drivers/iio/magnet=
ometer/ak8975.c
>>> index 72c03d9..95c68952 100644
>>> --- a/drivers/iio/magnetometer/ak8975.c
>>> +++ b/drivers/iio/magnetometer/ak8975.c
>>> @@ -370,6 +370,7 @@ struct ak8975_data {
>>>       wait_queue_head_t    data_ready_queue;
>>>       unsigned long        flags;
>>>       u8            cntl_cache;
>>> +    const char        *matrix[9];
>>>   };
>>>     /*
>>> @@ -697,6 +698,28 @@ static int ak8975_read_raw(struct iio_dev *ind=
io_dev,
>>>       return -EINVAL;
>>>   }
>>>   +static ssize_t ak8975_show_matrix(struct device *dev,
>>> +                  struct device_attribute *attr,
>>> +                  char *buf)
>>> +{
>>> +    const struct ak8975_data *data =3D iio_priv(dev_to_iio_dev(dev=
));
>>> +    const char * const *m =3D data->matrix;
>>> +
>>> +    return sprintf(buf, "%s, %s, %s; %s, %s, %s; %s, %s, %s\n",
>>> +               m[0], m[1], m[2], m[3], m[4], m[5], m[6], m[7], m[8=
]);
>>> +}
>>> +
>>> +static IIO_DEVICE_ATTR(in_magn_matrix, S_IRUGO, ak8975_show_matrix=
, NULL, -1);
>>> +
>>> +static struct attribute *ak8975_attrs[] =3D {
>>> +    &iio_dev_attr_in_magn_matrix.dev_attr.attr,
>>> +    NULL
>>> +};
>>> +
>>> +static const struct attribute_group ak8975_attrs_group =3D {
>>> +    .attrs =3D ak8975_attrs
>>> +};
>>> +
>>>   #define AK8975_CHANNEL(axis, index)                    \
>>>       {                                \
>>>           .type =3D IIO_MAGN,                    \
>>> @@ -716,6 +739,12 @@ static const struct iio_info ak8975_info =3D {
>>>       .driver_module =3D THIS_MODULE,
>>>   };
>>>   +static const struct iio_info ak8975_matrix_info =3D {
>>> +    .read_raw =3D &ak8975_read_raw,
>>> +    .attrs =3D &ak8975_attrs_group,
>>> +    .driver_module =3D THIS_MODULE,
>>> +};
>>> +
>>>   static const struct acpi_device_id ak_acpi_match[] =3D {
>>>       {"AK8975", AK8975},
>>>       {"AK8963", AK8963},
>>> @@ -785,6 +814,22 @@ static int ak8975_probe(struct i2c_client *cli=
ent,
>>>       data->eoc_gpio =3D eoc_gpio;
>>>       data->eoc_irq =3D 0;
>>>   +    /*
>>> +     * Rotation matrix is expressed as an array of 3x3 strings to =
be able
>>> +     * to represent floating point numbers.
>>> +     */
>>> +    err =3D of_property_read_string_array(client->dev.of_node, "ma=
trix",
>>> +                        data->matrix,
>>> +                        ARRAY_SIZE(data->matrix));
>>> +    if (err =3D=3D ARRAY_SIZE(data->matrix))
>>> +        indio_dev->info =3D &ak8975_matrix_info;
>>> +    else if (err =3D=3D -EINVAL)
>>> +        indio_dev->info =3D &ak8975_info;
>>> +    else if (err >=3D 0)
>>> +        return -EINVAL;
>>> +    else
>>> +        return err;
>>> +
>>>       /* id will be NULL when enumerated via ACPI */
>>>       if (id) {
>>>           chipset =3D (enum asahi_compass_chipset)(id->driver_data)=
;
>>> @@ -822,7 +867,6 @@ static int ak8975_probe(struct i2c_client *clie=
nt,
>>>       indio_dev->dev.parent =3D &client->dev;
>>>       indio_dev->channels =3D ak8975_channels;
>>>       indio_dev->num_channels =3D ARRAY_SIZE(ak8975_channels);
>>> -    indio_dev->info =3D &ak8975_info;
>>>       indio_dev->modes =3D INDIO_DIRECT_MODE;
>>>       indio_dev->name =3D name;
>>>       return devm_iio_device_register(&client->dev, indio_dev);
>>>
>=20
> --=20
> To unsubscribe from this list: send the line "unsubscribe linux-iio" =
in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
