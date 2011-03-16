From: Jason Hui <jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V4 5/5] net/fec: add device tree matching support
Date: Wed, 16 Mar 2011 11:36:56 +0800
Message-ID: <AANLkTingmW29g1SCpXPUDLXGDnHeAgx_ZL1np5ffJnuF@mail.gmail.com>
References: <1299733185-2172-1-git-send-email-jason.hui@linaro.org>
	<1299733185-2172-6-git-send-email-jason.hui@linaro.org>
	<20110315071404.GE23050@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110315071404.GE23050-MrY2KI0G/OVr83L8+7iqerDks+cytr/Z@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi, Grant,

On Tue, Mar 15, 2011 at 3:14 PM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> w=
rote:
> On Thu, Mar 10, 2011 at 12:59:45PM +0800, Jason Liu wrote:
>> Signed-off-by: Jason Liu <jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Signed-off-by: Jason Liu <r64343-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>> ---
>> =A0drivers/net/fec.c | =A0 13 +++++++++++++
>> =A01 files changed, 13 insertions(+), 0 deletions(-)
>>
>> diff --git a/drivers/net/fec.c b/drivers/net/fec.c
>> index 02cdd71..fcb9768 100644
>> --- a/drivers/net/fec.c
>> +++ b/drivers/net/fec.c
>> @@ -45,6 +45,9 @@
>> =A0#include <linux/phy.h>
>> =A0#include <linux/fec.h>
>>
>> +#include <linux/of.h>
>> +#include <linux/of_address.h>
>> +
>
> Should be mixed in with the rest of the linux/*.h includes (don't put
> a blank line between them.

OK,

>
>> =A0#include <asm/cacheflush.h>
>>
>> =A0#ifndef CONFIG_ARM
>> @@ -1523,6 +1526,13 @@ static const struct dev_pm_ops fec_pm_ops =3D {
>> =A0};
>> =A0#endif
>>
>> +#ifdef CONFIG_OF
>> +static struct of_device_id fec_matches[] =3D {
>> + =A0 =A0 { .compatible =3D "fsl,imx-fec" },
>
> Must have documentation for this binding in
> Documentation/devicetree/bindings before I can pick this up. =A0Same
> goes for the uart driver patch.

OK, I will write one documentation for it and the same with uart.

>
> Also, I recommend being more specific on the compatible property.
> fsl,imx51-fec would be better. =A0Newer parts can claim compatibility
> with this one if you're concerned about supporting multiple parts.
>
> ie. for imx 53, this would be appropriate:
>
> =A0 =A0 =A0 =A0compatible =3D "fsl,imx53-fec", "fsl,imx51-fec";

OK,

>
>> + =A0 =A0 {},
>> +};
>> +#endif
>> +
>> =A0static struct platform_driver fec_driver =3D {
>> =A0 =A0 =A0 .driver =3D {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =3D DRIVER_NAME,
>> @@ -1530,6 +1540,9 @@ static struct platform_driver fec_driver =3D {
>> =A0#ifdef CONFIG_PM
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pm =A0 =A0 =3D &fec_pm_ops,
>> =A0#endif
>> +#ifdef CONFIG_OF
>> + =A0 =A0 =A0 =A0 =A0 =A0 .of_match_table =3D fec_matches,
>> +#endif
>> =A0 =A0 =A0 },
>> =A0 =A0 =A0 .id_table =3D fec_devtype,
>> =A0 =A0 =A0 .probe =A0=3D fec_probe,
>> --
>> 1.7.1
>>
>>
>> _______________________________________________
>> linaro-dev mailing list
>> linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
>> http://lists.linaro.org/mailman/listinfo/linaro-dev
>
