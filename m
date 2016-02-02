From: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH 1/2] iio: ad5755: add support for dt bindings
Date: Tue, 2 Feb 2016 17:37:50 +0100
Message-ID: <56B0DB5E.7060608@metafoo.de>
References: <1454416574-6645-1-git-send-email-sean.nyekjaer@prevas.dk>
 <56B0CC2C.6020809@metafoo.de> <56B0D203.3050905@prevas.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56B0D203.3050905-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Sean_Nyekj=c3=a6r?= <sean.nyekjaer-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 02/02/2016 04:57 PM, Sean Nyekj=E6r wrote:
>=20
>=20
> On 2016-02-02 16:33, Lars-Peter Clausen wrote:
>> On 02/02/2016 01:36 PM, Sean Nyekjaer wrote:
>>> Still missing a way to provide default modes and settings
>>> for the driver from dt, but I see this as a start.
>>>
>>> Signed-off-by: Sean Nyekjaer <sean.nyekjaer-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>
>> Hi,
>>
>> Thanks for the patch.
> :-)
>>
>>> ---
>>>   drivers/iio/dac/ad5755.c | 10 ++++++++++
>>>   1 file changed, 10 insertions(+)
>>>
>>> diff --git a/drivers/iio/dac/ad5755.c b/drivers/iio/dac/ad5755.c
>>> index bfb350a..e1b6e78 100644
>>> --- a/drivers/iio/dac/ad5755.c
>>> +++ b/drivers/iio/dac/ad5755.c
>>> @@ -607,6 +607,16 @@ static const struct spi_device_id ad5755_id[] =
=3D {
>>>   };
>>>   MODULE_DEVICE_TABLE(spi, ad5755_id);
>>>   +static const struct of_device_id ad5755_of_match[] =3D {
>>> +    { .compatible =3D "adi,ad5755" },
>>> +    { .compatible =3D "adi,ad5755-1" },
>>> +    { .compatible =3D "adi,ad5757" },
>>> +    { .compatible =3D "adi,ad5735" },
>>> +    { .compatible =3D "adi,ad5737" },
>> This needs to set the ID for the device type, so that the driver get=
s
>> instantiated for the correct devicetype. And in the probe function c=
heck if
>> the driver was probed via DT (by checking spi->dev.of_node) and if i=
t does
>> get the ID from the of_device_id rather the spi_device_id.
> I was planning on doing that.
> And I was experimenting with providing modes and settings for every c=
hannel
> from the dt.
> Is the DAC the only output devices in IIO?

There is also support for programmable potentiometers (sometimes called
RDAC), but that's it.

>=20
> I will send an proposal tomorrow :-) And thereby (maybe) pave the way=
 for
> the runtime mode switching
>=20
> Should we drop the platform data support and only rely on dt?

No, there might still be some people depending on it. I don't think the
burden of continuing to maintain the platform data support is that high=
=2E

- Lars
