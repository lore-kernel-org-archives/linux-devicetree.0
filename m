From: Belisko Marek <marek.belisko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCHv1 1/2] rx51_battery: convert to iio consumer
Date: Fri, 28 Feb 2014 21:59:28 +0100
Message-ID: <CAAfyv345wNTquDcxPRZGU6_9QQkPJvY4YRd=PJo549_-Yif8Ag@mail.gmail.com>
References: <1393375569-21751-1-git-send-email-sre@debian.org>
	<1393375569-21751-2-git-send-email-sre@debian.org>
	<CAAfyv37B=xn3AktnUxPDpuey+5S73vW0PJnuUZtorP4rajPKiw@mail.gmail.com>
	<20140226215452.GA11468@earth.universe>
	<CAAfyv340pA2ihUAoFytBgevLtedvtj5Z0aw_=G9Rbx5occtyqw@mail.gmail.com>
	<20140228020536.GB5427@earth.universe>
	<CAAfyv36jJoMxZQ5e43pEC2rzNBHHW9Jt_4dg5O-fS8e+Aim7jA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAfyv36jJoMxZQ5e43pEC2rzNBHHW9Jt_4dg5O-fS8e+Aim7jA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 28, 2014 at 9:32 PM, Belisko Marek <marek.belisko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi Sebastian,
>
> On Fri, Feb 28, 2014 at 3:05 AM, Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wrote:
>> On Thu, Feb 27, 2014 at 10:34:35PM +0100, Belisko Marek wrote:
>>> Well I've tried and it's worse :). I got during booting:
>>> [    2.218383] ERROR: could not get IIO channel /battery:temp(0)
>>> [    2.224639] platform battery.4: Driver twl4030_madc_battery
>>> requests probe deferral
>>> Not sure if it's just error or warning but temp is always reported as
>>> 0 (and also other values in sysfs).
>>
>> This is an error, which basically means, that twl4030-madc has not
>> yet been loaded. Do you get proper values when you use the old madc
>> API with the patchset applied?
> It works without converting to iio consumer (at least I get some
> reasonable values).
> With conversion it fails with above error. I recheck (add printk to
> iio twl4030-madc) that
> madc driver is loaded. Could this be that twl4030_madc_battery is
> loaded earlier then
> twl4030_madc and than it fails to get iio channels?
Hmm I wasn't far away from truth in previous email. I think that channel doesn't
exists because twl4030_madc driver isn't loaded yet and that is the
reason for deferral probe
message in log. So it seems after some time it is loaded correctly but
not working. No ideas.
>>
>> -- Sebastian
>
> BR,
>
> marek
>
> --
> as simple and primitive as possible
> -------------------------------------------------
> Marek Belisko - OPEN-NANDRA
> Freelance Developer
>
> Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
> Tel: +421 915 052 184
> skype: marekwhite
> twitter: #opennandra
> web: http://open-nandra.com

BR,

marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com
