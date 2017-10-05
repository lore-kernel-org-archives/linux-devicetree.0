From: Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 00/12] of: overlay: clean up device tree overlay code
Date: Thu, 5 Oct 2017 11:33:32 +0300
Message-ID: <96045775-4142-1d2d-52f6-d76c0a982461@ti.com>
References: <1507002826-16393-1-git-send-email-frowand.list@gmail.com>
 <CAL_JsqJFPHOxrOYNcJCmNvdTA+1RqZxNSZOq6byzDVygUwV0Ow@mail.gmail.com>
 <3eac16b0-fdd9-fd6c-e1ca-e0de49ce27cb@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3eac16b0-fdd9-fd6c-e1ca-e0de49ce27cb-l0cyMroinI0@public.gmane.org>
Content-Language: en-GB
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: devicetree@vger.kernel.org

=EF=BB=BF
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Bu=
siness ID: 0615521-4. Kotipaikka/Domicile: Helsinki

On 10/05/17 09:53, Tomi Valkeinen wrote:
> On 04/10/17 17:56, Rob Herring wrote:
>> On Mon, Oct 2, 2017 at 10:53 PM,  <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> From: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
>>>
>>> I have found the device tree overlay code to be difficult to read and
>>> maintain.  This patch series attempts to improve that situation.
>>>
>>> The cleanup includes some changes visible to users of overlays.  The
>>> only in kernel user of overlays is fixed up for those changes.  The
>>> in kernel user is:
>>>
>>>    drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c
>>
>> At what point can we remove this? I'm assuming at some point users
>> will need to update their dtb's for other reasons and this becomes
>> obsolete.
>=20
> To be honest, I have no idea, or how to find that out.
>=20

I think the first approach could be setting the DRM_TILCDC_SLAVE_COMPAT
default to n and listen if there is any reports about breakage.

> Do we need to get rid of it? Afaik, we haven't do much (or any?)
> maintenance on tilcdc_slave_compat.c since it was written, so from our
> perspective it's been a minimal burden. Is it creating burden for others?
>=20
> Is the approach done with tilcdc_slave_compat.c something that's not
> recommended? I'm sure similar situations happen with other drivers too,
> and I think it's a good idea to have a recommended way of keeping
> compatibility.
>=20

For tilcdc I would say that we soon need a similar mechanism to get rid
off tilcdc internal panel driver and to start using generic panel
drivers instead. That is, if we want to keep the kernel compatible with
old devicetree blobs.

Best regards,
Jyri

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
