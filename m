From: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/8] rtc: sa1100: add OF support
Date: Thu, 1 Mar 2012 20:52:56 +0800
Message-ID: <CAN1soZwe+NRaf--SKupqtTnJ=YExT9LYBx+R9jUV3aA0ecbkbg@mail.gmail.com>
References: <1330582228-12424-1-git-send-email-haojian.zhuang@marvell.com>
 <1330582228-12424-4-git-send-email-haojian.zhuang@marvell.com>
 <201203010951.12405.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201203010951.12405.arnd-r2nGTMty4D4@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Haojian Zhuang <haojian.zhuang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 1, 2012 at 5:51 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Thursday 01 March 2012, Haojian Zhuang wrote:
>> +#ifdef CONFIG_OF
>> +static int sa1100_rtc_probe_dt(struct platform_device *pdev,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct sa11=
00_rtc *info)
>> +{
>> + =A0 =A0 =A0 info->irq_alarm =3D platform_get_irq(pdev, 0);
>> + =A0 =A0 =A0 info->irq_1hz =3D platform_get_irq(pdev, 1);
>> + =A0 =A0 =A0 if (info->irq_1hz < 0 || info->irq_alarm < 0)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENODEV;
>> + =A0 =A0 =A0 return 0;
>> +}
>> +#else
>> +static int sa1100_rtc_probe_dt(struct platform_device *pdev,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct sa11=
00_rtc *info)
>> +{
>> + =A0 =A0 =A0 return 1;
>> +}
>> +#endif
>> +
>> +static int sa1100_rtc_probe_irq(struct platform_device *pdev,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct sa1=
100_rtc *info)
>> +{
>> + =A0 =A0 =A0 info->irq_1hz =3D platform_get_irq_byname(pdev, "rtc 1Hz");
>> + =A0 =A0 =A0 info->irq_alarm =3D platform_get_irq_byname(pdev, "rtc ala=
rm");
>> + =A0 =A0 =A0 if (info->irq_1hz < 0 || info->irq_alarm < 0)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENODEV;
>> + =A0 =A0 =A0 return 0;
>> +}
>
> This should not be necessary. I thought we had already added support
> for named irq resources coming from the device tree. If not, why not
> just make the other ones anonymous as well and just use platform_get_irq(=
)?
>

Yes, platform_get_irq() is better. I'll append the two irqs into
interrupts property.
