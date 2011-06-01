From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC PATCH v3 2/2] dt: add custom device creation to platform bus
	scan
Date: Wed, 1 Jun 2011 10:58:03 -0600
Message-ID: <BANLkTimTdVKspjJ8GD4M90wiKCC0SzkgpA@mail.gmail.com>
References: <1306359073-16274-1-git-send-email-robherring2@gmail.com>
	<201105261511.23659.arnd@arndb.de> <4DDE9F4A.5050507@gmail.com>
	<201105271406.18841.arnd@arndb.de> <4DE66E39.2070300@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4DE66E39.2070300-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jun 1, 2011 at 10:52 AM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 05/27/2011 07:06 AM, Arnd Bergmann wrote:
>>
>> On Thursday 26 May 2011, Rob Herring wrote:
>>>
>>> On 05/26/2011 08:11 AM, Arnd Bergmann wrote:
>>>>
>>>> On Wednesday 25 May 2011, Rob Herring wrote:
>>>> This creates a confusing mix of match table entries: Normally,
>>>> all entries in the match table are meant to identify child buses,
>>>> but if I read your patch correctly, you now also need to match
>>>> on the amba devices themselves, including the creation of
>>>> platform devices for each child device node under an amba
>>>> device.
>>>>
>>> We should only create devices for each matching bus and the immediate
>>> children of each bus. A child device of an amba device would be
>>> something like an i2c bus which we don't want to create devices for. Or
>>> am I missing something?
>>
>> Exactly, that was my point.
>>
>>>> I don't think that was the intention. Maybe we need to pass
>>>> two match tables into of_platform_bus_probe() instead:
>>>> one to identify the buses, and another one that is used
>>>> to create the actual devices.
>>>>
>>> That was my original thinking too, but some reason I had concluded 1
>>> could get by with just 1 table. After more thought, I think you are
>>> right. In fact, I broke platform device creation with this patch. I need
>>> to be able to tell if no match means create a platform device (child of
>>> bus) or not (child of a device).
>>
>> Ok.
>>
>>> @@ -234,18 +237,32 @@ static int of_platform_bus_create(struct
>>> device_node *bus,
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return 0;
>>> =A0 =A0 =A0 =A0}
>>>
>>> - =A0 =A0 =A0 dev =3D of_platform_device_create(bus, NULL, parent);
>>> - =A0 =A0 =A0 if (!dev || !of_match_node(matches, bus))
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
>>> -
>>> - =A0 =A0 =A0 for_each_child_of_node(bus, child) {
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_debug(" =A0 create child: %s\n", child=
->full_name);
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 rc =3D of_platform_bus_create(child, matc=
hes,&dev->dev,
>>> strict);
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (rc) {
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 of_node_put(child);
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>>> + =A0 =A0 =A0 id =3D of_match_node(bus_matches, bus);
>>> + =A0 =A0 =A0 if (id) {
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev =3D of_platform_device_create(bus, NU=
LL, parent);
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!dev)
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 for_each_child_of_node(bus, child) {
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_debug(" =A0 create chi=
ld: %s\n",
>>> child->full_name);
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 rc =3D of_platform_bus_cr=
eate(child, bus_matches,
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_matches, dev,
>>> strict);
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (rc) {
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 of_node_p=
ut(child);
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return rc;
>>> =A0 =A0 =A0 =A0}
>>> +
>>> + =A0 =A0 =A0 id =3D of_match_node(dev_matches, bus);
>>> + =A0 =A0 =A0 mdata =3D id ? id->data : NULL;
>>> + =A0 =A0 =A0 if (id&& =A0mdata&& =A0mdata->dev_create)
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev =3D mdata->dev_create(bus, parent);
>>> + =A0 =A0 =A0 else
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev =3D of_platform_device_create(bus, NU=
LL, parent);
>>> + =A0 =A0 =A0 if (!dev)
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
>>> +
>>
>> Yes, that looks like it should work.
>>
>> It still feels a bit strange, because it's not exactly how we normally
>> probe devices: In all other cases, we bind a device to a driver when we
>> find it, and that driver in turn scans it, and potentially creates
>> child devices that it finds.
>>
>> What we do here is to let the platform decide how to interpret the
>> data that is coming in. To make the probing more well-behaved, another
>> approach would be:
>>
>> * Bind a platform_driver to compatible=3D"arm,amba" (or whatever we
>> =A0 had in the binding).
>>
>> * In that driver, do nothing except register an amba_device as a child.
>>
>> This would create a somewhat deeper device hierarchy, but be still
>> completely logical: you have a device that cannot be probed (identified
>> simply by its register space), which can be probed internally because
>> the registers actually have a meaning.
>
> Shouldn't the hierarchy in linux reflect the h/w? It seems a bit pointless
> to me to create a device just to create another device. amba_bus is alrea=
dy
> a bit strange in that it is not really a bus type, but a certain class of
> peripherals.
>
> I'd like to hear Grant's thoughts on this.

AMBA and platform_devices are "special" in that they don't have
requirements on their parent device.  I see absolutely zero issue with
having platform_device and amba_device as siblings.

g.
