From: Li Yang <leoli-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: License for ARM device tree file
Date: Mon, 28 Sep 2015 15:19:05 -0500
Message-ID: <CADRPPNQniPRmLq4WmSPU818=PafUV99djC9JveajMVdxARz0KA@mail.gmail.com>
References: <DM2PR0301MB07343BCB0B5059C96CA31438BA4F0@DM2PR0301MB0734.namprd03.prod.outlook.com>
	<20150928192931.GE21513@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150928192931.GE21513-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sharma Bhupesh <bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Stuart Yoder <stuart.yoder-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Peter Newton <Peter.Newton-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 28, 2015 at 2:29 PM, Russell King - ARM Linux
<linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> wrote:
> On Mon, Sep 28, 2015 at 07:14:30PM +0000, Li Leo wrote:
>> I saw some discussion going on last year about the permissive license
>> to be used in ARM device tree files.  I know a lot of files have been
>> changed to use GPLv2/X11 license.  But may I know if GPLv2/BSD 3-clause
>> dual license is still a valid license to use in ARM device tree files.
>> It has been our standard permissive license used for a long time in
>> many components like device trees in Power architecture.
>
> It would have been nice to have had some input at the time that what
> little discussion there was happened.
>
> I'm sorry, but at this point I'm of the opinion that the window for
> discussing what license we switch to has been had, and the matter is
> settled; those who didn't take part in the discussion have themselves
> to blame if they don't like the outcome.
>
> What I'm saying is that I doubt anyone has the stomach to go through
> another set of license changes on the existing files to suit some
> late-commer to the party.
>

Right.  I'm not proposing to change all the device trees into another
license.  GPL/X11 is actually a good license to use.

> However, we can't dictate to people what license they wish to submit
> their work under; though, we can make the decision whether to accept
> it under the license terms or not.

But I'm wondering if we submit a device tree patch using other GPL
compatible permissive license(like GPL/3-clause-BSD dual license)
which doesn't include any other device tree files, will it still be
acceptable or not?

>
> I think the problem will come if we try to mix a file that's licensed
> one way, which includes files licensed under a different set of
> licenses... if you want to use a file licensed under BSD 3-clause but
> don't want to agree to the GPL license (so you're only bound by the
> BSD 3-clause license) and that file includes some GPL/X11 licensed
> files, then what?

Permissive licenses like X11 and BSD 3-clause should be compatible
with each other right?

Regards,
Leo
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
