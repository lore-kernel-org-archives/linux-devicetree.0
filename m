From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC PATCH] ARM: pmu: add OF match support
Date: Wed, 9 Feb 2011 11:09:37 -0700
Message-ID: <AANLkTin5aA0tq-PYBmRKh6tLv6bHRaK5ymjhsj9T4-Ah@mail.gmail.com>
References: <1297223617-19173-1-git-send-email-robherring2@gmail.com>
	<AANLkTi=7azYw8+sYrbDsLOfF1aZynBDo+ub37O9j+k49@mail.gmail.com>
	<3399156206431206254@unknownmsgid>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <3399156206431206254@unknownmsgid>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Feb 9, 2011 at 10:17 AM, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org> wrote:
> Hi Grant, Rob,
>
>> On Tue, Feb 8, 2011 at 8:53 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrot=
e:
>> > From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
>> >
>> > Add OF match table to enable OF style driver binding. The dts entry is=
 like
>> > this:
>> >
>> > pmu {
>> > =A0 =A0 =A0 =A0compatible =3D "arm,pmu";
>> > =A0 =A0 =A0 =A0interrupts =3D <100 101>;
>> > };
>> >
>> > The use of pdev->id as an index breaks with OF device binding. Change =
to use
>> > a counter instead. If more than 1 pmu device is ever really supported,=
 a
>> > better solution to match users with particular pmu is probably needed.
>> >
>> > Signed-off-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
>> > ---
>> > =A0arch/arm/kernel/pmu.c | =A0 13 ++++++++++---
>> > =A01 files changed, 10 insertions(+), 3 deletions(-)
>> >
>> > diff --git a/arch/arm/kernel/pmu.c b/arch/arm/kernel/pmu.c
>> > index b8af96e..7084057 100644
>> > --- a/arch/arm/kernel/pmu.c
>> > +++ b/arch/arm/kernel/pmu.c
>> > @@ -24,30 +24,37 @@
>> > =A0static volatile long pmu_lock;
>> >
>> > =A0static struct platform_device *pmu_devices[ARM_NUM_PMU_DEVICES];
>> > +static int pmu_device_count;
>> >
>> > =A0static int __devinit pmu_device_probe(struct platform_device *pdev)
>> > =A0{
>> >
>> > - =A0 =A0 =A0 if (pdev->id < 0 || pdev->id >=3D ARM_NUM_PMU_DEVICES) {
>> > + =A0 =A0 =A0 if (pmu_device_count >=3D ARM_NUM_PMU_DEVICES) {
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pr_warning("received registration reque=
st for unknown "
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"device=
 %d\n", pdev->id);
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -EINVAL;
>> > =A0 =A0 =A0 =A0}
>> >
>> > - =A0 =A0 =A0 if (pmu_devices[pdev->id])
>> > + =A0 =A0 =A0 if (pmu_devices[pmu_device_count])
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pr_warning("registering new PMU device =
type %d overwrites "
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"previo=
us registration!\n", pdev->id);
>> > =A0 =A0 =A0 =A0else
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pr_info("registered new PMU device of t=
ype %d\n",
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pdev->i=
d);
>> >
>> > - =A0 =A0 =A0 pmu_devices[pdev->id] =3D pdev;
>> > + =A0 =A0 =A0 pmu_devices[pmu_device_count++] =3D pdev;
>> > =A0 =A0 =A0 =A0return 0;
>> > =A0}
>> >
>> > +static struct of_device_id pmu_device_ids[] =3D {
>> > + =A0 =A0 =A0 { .compatible =3D "arm,pmu" },
>>
>> This is a pretty generic compatible string and it doesn't account for
>> the possibility that the implementation behaviour will change with
>> newer devices. =A0Is there any form of versioning on the pmu that would
>> be appropriate to encode here?
>
> Following on from Rob's update, it would be nice if you could specify that
> the PMU is a CPU PMU (as opposed to L2-cache, bus, gpu etc) in the string.
> That way adding different PMUs in the future seems more natural and it ac=
counts
> for your concerns above. Is that ok, or does the compatible string have to
> match that used by the platform bus?

It does make sense to encode the specific implementation into the
compatible string.  A single device driver can bind against multiple
compatible strings.  ie. the match table could include {.compatible =3D
"arm,cortex-a9-pmu"},{.compatible =3D "arm,cortex-a9-l2cache-pmu"}...

> As for versioning, the PMU detection is done dynamically at runtime,
> so knowing that we're poking a CPU is enough.

Fair enough.  It is still good practice in the compatible list to
encode the specific PMU implementation (maybe arm,cortex-a9-pmu?)
instead of trying to define a 'generic' or wildcard compatible value.
Newer implementations can always claim compatibility with an older
implementation so that the kernel doesn't have to be modified to find
the new devices.  "arm,pmu" is probably too generic.

g.
