From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC PATCH] ARM: pmu: add OF match support
Date: Wed, 9 Feb 2011 10:13:16 -0700
Message-ID: <AANLkTi=7azYw8+sYrbDsLOfF1aZynBDo+ub37O9j+k49@mail.gmail.com>
References: <1297223617-19173-1-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1297223617-19173-1-git-send-email-robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 8, 2011 at 8:53 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
>
> Add OF match table to enable OF style driver binding. The dts entry is li=
ke
> this:
>
> pmu {
> =A0 =A0 =A0 =A0compatible =3D "arm,pmu";
> =A0 =A0 =A0 =A0interrupts =3D <100 101>;
> };
>
> The use of pdev->id as an index breaks with OF device binding. Change to =
use
> a counter instead. If more than 1 pmu device is ever really supported, a
> better solution to match users with particular pmu is probably needed.
>
> Signed-off-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> ---
> =A0arch/arm/kernel/pmu.c | =A0 13 ++++++++++---
> =A01 files changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm/kernel/pmu.c b/arch/arm/kernel/pmu.c
> index b8af96e..7084057 100644
> --- a/arch/arm/kernel/pmu.c
> +++ b/arch/arm/kernel/pmu.c
> @@ -24,30 +24,37 @@
> =A0static volatile long pmu_lock;
>
> =A0static struct platform_device *pmu_devices[ARM_NUM_PMU_DEVICES];
> +static int pmu_device_count;
>
> =A0static int __devinit pmu_device_probe(struct platform_device *pdev)
> =A0{
>
> - =A0 =A0 =A0 if (pdev->id < 0 || pdev->id >=3D ARM_NUM_PMU_DEVICES) {
> + =A0 =A0 =A0 if (pmu_device_count >=3D ARM_NUM_PMU_DEVICES) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pr_warning("received registration request =
for unknown "
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"device %d=
\n", pdev->id);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -EINVAL;
> =A0 =A0 =A0 =A0}
>
> - =A0 =A0 =A0 if (pmu_devices[pdev->id])
> + =A0 =A0 =A0 if (pmu_devices[pmu_device_count])
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pr_warning("registering new PMU device typ=
e %d overwrites "
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"previous =
registration!\n", pdev->id);
> =A0 =A0 =A0 =A0else
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pr_info("registered new PMU device of type=
 %d\n",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pdev->id);
>
> - =A0 =A0 =A0 pmu_devices[pdev->id] =3D pdev;
> + =A0 =A0 =A0 pmu_devices[pmu_device_count++] =3D pdev;
> =A0 =A0 =A0 =A0return 0;
> =A0}
>
> +static struct of_device_id pmu_device_ids[] =3D {
> + =A0 =A0 =A0 { .compatible =3D "arm,pmu" },

This is a pretty generic compatible string and it doesn't account for
the possibility that the implementation behaviour will change with
newer devices.  Is there any form of versioning on the pmu that would
be appropriate to encode here?

g.
