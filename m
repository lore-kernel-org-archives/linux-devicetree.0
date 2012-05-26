From: Richard Zhao <linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 00/12] add imx usb driver for mx28/6x
Date: Sat, 26 May 2012 20:50:44 +0800
Message-ID: <CANg6MZhKkjre_5wCj70Zajc2s51hw88t=K-eemmN+DVePEQD5A@mail.gmail.com>
References: <1337912665-16615-1-git-send-email-richard.zhao@freescale.com>
	<201205261337.59500.marex@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201205261337.59500.marex-ynQEQJNshbs@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Cc: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Marek,

On Sat, May 26, 2012 at 7:37 PM, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org> wrote:
> Dear Richard Zhao,
>
>> The work is based on =A0ci13xxx rework done by Alexander Shishkin.
>>
>> Status:
>> =A0 - this version only support host
>> =A0 - usbotg controler works at host role
>>
>> Changes since V2:
>> =A0 - Rebase to Alex's tree
>> =A0 - Use regulator to control vbus power
>> =A0 - Remove ARCH check in Kconfig, but add OF_DEV check.
>> =A0 - Other changes according laster version comments.
>
> Is there any git tree with these patches?
https://github.com/riczhao/kernel-imx/commits/topics/usb

> Also, on top of what tree are these
> based on please?
They're based on Alex's tree.
>
> Thanks!
>
> Best regards,
> Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
