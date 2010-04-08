From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: devicetree platform bus bindings
Date: Wed, 7 Apr 2010 23:29:11 -0600
Message-ID: <j2ifa686aa41004072229h53894e12u1a970430266c5734@mail.gmail.com>
References: <DE2504B3A515524BBE6934369EFDC0DA09252CF7@az33exm20.fsl.freescale.net>
	<k2nfa686aa41004011531tbecd5a5bp9c43abc7d206ff70@mail.gmail.com>
	<DE2504B3A515524BBE6934369EFDC0DA0925331F@az33exm20.fsl.freescale.net>
	<s2ufa686aa41004060646nd12cb443z45b1e80a4e9ccad8@mail.gmail.com>
	<DE2504B3A515524BBE6934369EFDC0DA0925348B@az33exm20.fsl.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <DE2504B3A515524BBE6934369EFDC0DA0925348B-ofAVchDyotZVGH30ZtLfJpjmvxFtTJ+o0e7PPNI6Mm0@public.gmane.org>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 6, 2010 at 12:37 PM, Herring Robert-RA7055
<ra7055-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> Grant,
>
>> -----Original Message-----
>> From: glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org [mailto:glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org] On
>> Behalf Of Grant Likely
>> Sent: Tuesday, April 06, 2010 8:47 AM
>> To: Herring Robert-RA7055
>> Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
>> Subject: Re: devicetree platform bus bindings
>>
>> Hi Rob,
>>
>> On Tue, Apr 6, 2010 at 6:45 AM, Herring Robert-RA7055
>> <ra7055-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
>> > Grant,
>> >
>> >> > Do you plan to have generic DT parsing to platform device
>> >> creation code or
>> >> > will this remain platform specific?
>> >>
>> >> I'm actively developing this. =A0A while ago I decided I was
>> not going
>> >> to port of_platform_bus_type bus to any new architectures
>> because it
>> >> is effectively just platform_bus_type with a slightly different
>> >> matching scheme. =A0So I wrote a patch that generates
>> platform devices
>> >> from the device tree instead.
>> >>
>> >> However, since then I took on the task of removing
>> >> of_platform_bus_type entirely and just using
>> platform_bus_type on ppc,
>> >> mb & sparc, so arm will be able to use the same code. =A0The
>> patches I
>> >> just pushed out to my experimental branch show my WIP code and how
>> >> both the versatile and omap platforms are modified to use
>> the common
>> >> code.
>> >>
>> >> Word of warning though, this is highly experimental code
>> and I cannot
>> >> promise it won't break spectacularly.
>> >>
>> >
>> > I've updated to your latest tree and have MX51 working with
>> DT. I've got
>> > a few issues with bus_id/name+id. Is your goal that
>> existing platform
>> > drivers work unmodified? If so, the current <address>.<name> bus_id
>> > scheme doesn't really work. The platform matching code needs
>> > platform_device.name to be just a name without any instance
>> id. I was
>> > thinking this would be the compatible field. There are also
>> dependencies
>> > on the bus_id being name.id in the clock code for example. I was
>> > planning to use cell-index property for the id.
>>
>> As much as possible, I'd prefer drivers to use OF style matching for
>> the OF use case so that driver bindings are explicit. =A0For this to
>> work an OF match table needs to be added to the driver (which is
>> trivial). =A0The code to do this is already in my tree, but I don't yet
>> know if it works.
>>
> Adding the table may be trivial, but if there are other dependencies on n=
ame, id or dev_name, then more changes are needed. For example, id could be=
 used as an array index to driver data. The imx uart driver is one example =
of this:
>
> sport->port.line =3D pdev->id;
> ...
> imx_ports[pdev->id] =3D sport;

yeah, these are a bit ugly.  Ultimately I think the drivers should be
fixed to not depend on fixed length static arrays, but I understand
that it is non-trivial and will take time.  However, if a predefined
id really is needed, then I'd rather look into assigning it using a
property in the aliases node.  Trying to use cell-index gets really
ugly in a hurry.

>> I'm also playing with the platform bus code to test the compatible
>> list against the platform_driver's .id_table list, but I haven't
>> pushed any of that code out yet. =A0Either way, the of-style binding
>> string would need to be added to the driver. =A0I don't want to
>> reproduce the nasty hack that spi and i2c are using right now to
>> derive a single device name from the compatible list.
>>
>> > How do you see adding platform_data to the devices working?
>>
>> I'm hoping to avoid it as much as possible and get drivers to decode
>> their own platform_data from the device tree properties. =A0This does
>> require driver changes too, but again it is contained and can co-exist
>> with the existing platform_data method. =A0In the few cases where
>> platform data is unavoidable (such as function pointers), I'm thinking
>> about using platform-specific hooks or notifiers so that platform code
>> can modify device registrations before the device gets bound to a
>> driver (where modify =3D3D=3D3D add pdata at device registration time).
>> However, that approach is both opaque and still has the non-type-safe
>> problems of current pdata, and I'd rather avoid it unless absolutely
>> necessary.
>>
> I agree that static data should be in the device tree. As long as there i=
s a hook for setting platform_data, then this transisition can be done over=
 time. I think it is important that drivers not require changes to ease ado=
ption of device trees on ARM. On i.MX for example we have lots of chips wit=
h common drivers, but I don't want to have to move all platforms at once to=
 device trees.

No, you're right.  Moving all platforms to device trees is not an
option.  In fact I expect many/most existing platforms will not make
the switch and that the device tree stuff will mainly be interesting
for new(er) boards and SoCs.  Keeping driver impact minimal, and not
breaking non-device-tree usage is non-negotiable.  However, I don't
think there will be any issue with adding a match table for the
devices that need to work with the device tree; but I'm willing to
leave that matter open to debate.  Especially as we experiment more
with the best way to approach the problem.

g.
