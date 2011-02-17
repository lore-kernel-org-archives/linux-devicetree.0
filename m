From: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/7] watchdog: s3c2410: Add support for device tree based
	probe
Date: Thu, 17 Feb 2011 19:34:59 +0530
Message-ID: <AANLkTimm=mm8PKTWhtTPq48d5182QKkOFBFOmNuEDR=V@mail.gmail.com>
References: <1297514825-10345-1-git-send-email-thomas.abraham@linaro.org>
	<1297514825-10345-5-git-send-email-thomas.abraham@linaro.org>
	<20110217001732.GA14124@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <20110217001732.GA14124-MrY2KI0G/OVr83L8+7iqerDks+cytr/Z@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Grant,

On 17 February 2011 05:47, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> On Sat, Feb 12, 2011 at 06:17:02PM +0530, Thomas Abraham wrote:
>> This patch adds the of_match_table to enable s3c2410-wdt driver
>> to be probed when watchdog device node is found in the device tree.
>>
>> Signed-off-by: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> ---
>> =A0drivers/watchdog/s3c2410_wdt.c | =A0 10 ++++++++++
>> =A01 files changed, 10 insertions(+), 0 deletions(-)
>
> Need to add documentation for compatible =3D "samsung,s3c2410-wdt" to
> Documentation/devicetree/bindings/wdt before this patch can be merged.
>
> A couple more comments below, but I'm okay with this one. =A0I'd go
> ahead and submit it to the linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org list and cc:
> Wim. =A0It can be mainlined right away after fixing up the comments.
> I'll ack it when you repost and then work out with Wim if it should be
> merged through his tree or through mine.
>
>>
>> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_w=
dt.c
>> index ae53662..a9edd50 100644
>> --- a/drivers/watchdog/s3c2410_wdt.c
>> +++ b/drivers/watchdog/s3c2410_wdt.c
>> @@ -592,6 +592,13 @@ static int s3c2410wdt_resume(struct platform_device=
 *dev)
>> =A0#define s3c2410wdt_resume =A0NULL
>> =A0#endif /* CONFIG_PM */
>>
>> +#ifdef CONFIG_OF
>> +static const struct of_device_id s3c2410_wdt_match[] =3D {
>> + =A0 =A0 { .compatible =3D "samsung,s3c2410-wdt" },
>> + =A0 =A0 {},
>> +};
>> +MODULE_DEVICE_TABLE(of, s3c2410_wdt_match);
>> +#endif
>
> #else
> #define s3c2410_wdt_match NULL
> #endif
>
>>
>> =A0static struct platform_driver s3c2410wdt_driver =3D {
>> =A0 =A0 =A0 .probe =A0 =A0 =A0 =A0 =A0=3D s3c2410wdt_probe,
>> @@ -602,6 +609,9 @@ static struct platform_driver s3c2410wdt_driver =3D {
>> =A0 =A0 =A0 .driver =A0 =A0 =A0 =A0 =3D {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .owner =A0=3D THIS_MODULE,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =3D "s3c2410-wdt",
>> +#ifdef CONFIG_OF
>> + =A0 =A0 =A0 =A0 =A0 =A0 .of_match_table =3D s3c2410_wdt_match,
>> +#endif
>
> The #ifdef can be dropped here now. =A0.of_match_table is no longer condi=
tional.
>

The of_match_table is conditional in devicetree/arm and
devicetree/test branches. Are you referring to any other branch?

Thanks,
Thomas.

>
>> =A0 =A0 =A0 },
>> =A0};
>>
>> --
>> 1.6.6.rc2
>>
>
