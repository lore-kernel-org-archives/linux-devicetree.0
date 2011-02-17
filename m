From: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [sodaville] [PATCH OF 13/14] rtc/cmos: add OF bindings
Date: Thu, 17 Feb 2011 14:26:12 +0100
Message-ID: <20110217132612.GB13500@www.tglx.de>
References: <1295843342-1122-1-git-send-email-bigeasy@linutronix.de>
	<1295843342-1122-14-git-send-email-bigeasy@linutronix.de>
	<20110216221108.GJ22837@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110216221108.GJ22837-MrY2KI0G/OVr83L8+7iqerDks+cytr/Z@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

* Grant Likely | 2011-02-16 15:11:08 [-0700]:

>> diff --git a/Documentation/powerpc/dts-bindings/rtc-cmos.txt b/Documenta=
tion/powerpc/dts-bindings/rtc-cmos.txt
>> new file mode 100644
>> index 0000000..7382989
>> --- /dev/null
>> +++ b/Documentation/powerpc/dts-bindings/rtc-cmos.txt
>
>Move to Documentation/devicetree/bindings/rtc/
moved.

>> diff --git a/drivers/rtc/rtc-cmos.c b/drivers/rtc/rtc-cmos.c
>> index c7ff8df..2709e00 100644
>> --- a/drivers/rtc/rtc-cmos.c
>> +++ b/drivers/rtc/rtc-cmos.c
>> @@ -1162,6 +1205,9 @@ static struct platform_driver cmos_platform_driver=
 =3D {
>>  #ifdef CONFIG_PM
>>  		.pm		=3D &cmos_pm_ops,
>>  #endif
>> +#if defined(CONFIG_OF)
>> +		.of_match_table =3D of_cmos_match,
>> +#endif
>
>The #if defined(CONFIG_OF) is no longer necessary around
>.of_match_table, particularly if you have a #else above that #defines
>of_cmos_match to NULL.

Kinda does not work. I get here:
|drivers/rtc/rtc-cmos.c:1209:3: error: unknown field =E2=80=98of_match_tabl=
e=E2=80=99 specified in initializer

I rebased on top of -rc5. Is this something new you describing?

Sebastian
