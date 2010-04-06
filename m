From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: devicetree platform bus bindings
Date: Tue, 6 Apr 2010 07:46:51 -0600
Message-ID: <s2ufa686aa41004060646nd12cb443z45b1e80a4e9ccad8@mail.gmail.com>
References: <DE2504B3A515524BBE6934369EFDC0DA09252CF7@az33exm20.fsl.freescale.net>
	<k2nfa686aa41004011531tbecd5a5bp9c43abc7d206ff70@mail.gmail.com>
	<DE2504B3A515524BBE6934369EFDC0DA0925331F@az33exm20.fsl.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <DE2504B3A515524BBE6934369EFDC0DA0925331F-ofAVchDyotZVGH30ZtLfJpjmvxFtTJ+o0e7PPNI6Mm0@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Herring Robert-RA7055 <ra7055-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Tue, Apr 6, 2010 at 6:45 AM, Herring Robert-RA7055
<ra7055-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> Grant,
>
>> > Do you plan to have generic DT parsing to platform device
>> creation code or
>> > will this remain platform specific?
>>
>> I'm actively developing this. =A0A while ago I decided I was not going
>> to port of_platform_bus_type bus to any new architectures because it
>> is effectively just platform_bus_type with a slightly different
>> matching scheme. =A0So I wrote a patch that generates platform devices
>> from the device tree instead.
>>
>> However, since then I took on the task of removing
>> of_platform_bus_type entirely and just using platform_bus_type on ppc,
>> mb & sparc, so arm will be able to use the same code. =A0The patches I
>> just pushed out to my experimental branch show my WIP code and how
>> both the versatile and omap platforms are modified to use the common
>> code.
>>
>> Word of warning though, this is highly experimental code and I cannot
>> promise it won't break spectacularly.
>>
>
> I've updated to your latest tree and have MX51 working with DT. I've got
> a few issues with bus_id/name+id. Is your goal that existing platform
> drivers work unmodified? If so, the current <address>.<name> bus_id
> scheme doesn't really work. The platform matching code needs
> platform_device.name to be just a name without any instance id. I was
> thinking this would be the compatible field. There are also dependencies
> on the bus_id being name.id in the clock code for example. I was
> planning to use cell-index property for the id.

As much as possible, I'd prefer drivers to use OF style matching for
the OF use case so that driver bindings are explicit.  For this to
work an OF match table needs to be added to the driver (which is
trivial).  The code to do this is already in my tree, but I don't yet
know if it works.

I'm also playing with the platform bus code to test the compatible
list against the platform_driver's .id_table list, but I haven't
pushed any of that code out yet.  Either way, the of-style binding
string would need to be added to the driver.  I don't want to
reproduce the nasty hack that spi and i2c are using right now to
derive a single device name from the compatible list.

> How do you see adding platform_data to the devices working?

I'm hoping to avoid it as much as possible and get drivers to decode
their own platform_data from the device tree properties.  This does
require driver changes too, but again it is contained and can co-exist
with the existing platform_data method.  In the few cases where
platform data is unavoidable (such as function pointers), I'm thinking
about using platform-specific hooks or notifiers so that platform code
can modify device registrations before the device gets bound to a
driver (where modify =3D3D=3D3D add pdata at device registration time).
However, that approach is both opaque and still has the non-type-safe
problems of current pdata, and I'd rather avoid it unless absolutely
necessary.

Cheers,
g.
