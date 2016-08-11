From: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
Subject: Re: [PATCH] regulator: Add LTC3676 support
Date: Thu, 11 Aug 2016 13:48:21 -0700
Message-ID: <CAJ+vNU3k5mg37WxsZFOMRjH-JXU_aEwwYf8ewOu7ROCVYueqbg@mail.gmail.com>
References: <1470785767-4426-1-git-send-email-tharvey@gateworks.com>
 <20160810114140.GJ9347@sirena.org.uk> <CAJ+vNU3s=qxJr8x=ScnyEV0UKkD_gTOnMyY8oGuzVs14hTW0Ng@mail.gmail.com>
 <20160811094509.GP9347@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160811094509.GP9347-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jaffer Kapasi <jkapasi-td5IlybW20HQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 11, 2016 at 2:45 AM, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Wed, Aug 10, 2016 at 05:44:55PM -0700, Tim Harvey wrote:
>> On Wed, Aug 10, 2016 at 4:41 AM, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>
>> >> +/* LDO1 always on fixed 0.8V-3.3V via scalar via R1/R2 feeback res */
>> >> +static struct regulator_ops ltc3676_fixed_standby_regulator_ops = {
>> >> +};
>
>> > Remove this, it's pointless.
>
>> as I'm using macro's to define the ops, removing this ends up breaking
>> compilation:
>
>> do you know of some macro foo to best handle this? Part of me wants to
>> ditch the macro's and just simply declare the array of regulators
>> directly as its much easier to read/follow.
>
> Just don't use the macro for that regulator?
>

Mark,

regulators must have a non-null ops field or they will fail
registration so I can't just not assign it. What would be an
appropriate ops structure for a always-on fixed regulator?

Regards,

Tim
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
