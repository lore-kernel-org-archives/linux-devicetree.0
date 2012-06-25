From: "ABRAHAM, KISHON VIJAY" <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v7 04/14] usb: chipidea: msm: add remove method
Date: Mon, 25 Jun 2012 19:14:14 +0530
Message-ID: <CAAe_U6JL5P26zJDOWaV3Z=uOmhJddBKE9B3r=OrzEtPEuM3vnA@mail.gmail.com>
References: <1340607391-16380-1-git-send-email-richard.zhao@freescale.com>
	<1340607391-16380-5-git-send-email-richard.zhao@freescale.com>
	<CAAe_U6JJe4U+oMR+xj4TwdNsXEzHNhQ0+t-PUPJT=kezHCqL2w@mail.gmail.com>
	<201206251533.20788.marex@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201206251533.20788.marex-ynQEQJNshbs@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Cc: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Mon, Jun 25, 2012 at 7:03 PM, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org> wrote:
> Dear ABRAHAM, KISHON VIJAY,
>
>> Hi,
>>
>> On Mon, Jun 25, 2012 at 12:26 PM, Richard Zhao
>>
>> <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
>> > From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
>> >
>> > allow this driver to be removed too.
>> >
>> > Signed-off-by: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
>> > Signed-off-by: Alexander Shishkin <alexander.shishkin-VuQAYsv1562uYJLRA6qg5Q@public.gmane.org=
com>
>> > ---
>> > =A0drivers/usb/chipidea/ci13xxx_msm.c | =A0 20 ++++++++++++++-----=
-
>> > =A01 file changed, 14 insertions(+), 6 deletions(-)
>> >
>> > diff --git a/drivers/usb/chipidea/ci13xxx_msm.c
>> > b/drivers/usb/chipidea/ci13xxx_msm.c index 8d438b8..68512d4 100644
>> > --- a/drivers/usb/chipidea/ci13xxx_msm.c
>> > +++ b/drivers/usb/chipidea/ci13xxx_msm.c
>> > @@ -84,6 +84,8 @@ static int __devinit ci13xxx_msm_probe(struct
>> > platform_device *pdev) if (ret)
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto put_platform;
>> >
>> > + =A0 =A0 =A0 platform_set_drvdata(pdev, plat_ci);
>> > +
>> > =A0 =A0 =A0 =A0pm_runtime_no_callbacks(&pdev->dev);
>> > =A0 =A0 =A0 =A0pm_runtime_enable(&pdev->dev);
>> >
>> > @@ -95,16 +97,22 @@ put_platform:
>> > =A0 =A0 =A0 =A0return ret;
>> > =A0}
>> >
>> > +static int __devexit ci13xxx_msm_remove(struct platform_device *p=
dev)
>> > +{
>> > + =A0 =A0 =A0 struct platform_device *plat_ci =3D platform_get_drv=
data(pdev);
>>
>> How about a pm_runtime_disable() here?
>
> MX28 doesn't do runtime PM yet. Actually it doesn't do any PM.

I was probably misled by the call to pm_runtime_enable in your probe
:-( Then can we have it removed from probe as well?

Thanks
Kishon
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
