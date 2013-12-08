From: Peter Maydell <peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: cpu: Document and tweak clock-frequency property
Date: Sun, 8 Dec 2013 16:38:58 +0000
Message-ID: <CAFEAcA8qsb0f_5dVbytCD3fGQdT+W4=PJudCY1f-ee4Pwm=0=Q@mail.gmail.com>
References: <1386331027-26065-1-git-send-email-broonie@kernel.org>
 <52A36AB3.6060102@gmail.com> <20131208161922.GK29268@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131208161922.GK29268-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linaro-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, arm-mail-list <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 8 December 2013 16:19, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Sat, Dec 07, 2013 at 12:36:35PM -0600, Rob Herring wrote:
>> On 12/06/2013 05:57 AM, Mark Brown wrote:
>
>> > +   - clock-frequency
>> > +           Usage: required
>
>> This breaks compatibility. It may be required for a feature in the
>
> It doesn't, it's listed as mandatory in ePAPR section 3.7.1 which is
> already part of our bindings - this is merely copying that information
> into the binding document in the kernel so that it's more discoverable
> and so that we can tweak the definition to reflect reality a bit more
> closely.

Sorry, but there is already shipping software (kvmtool
and QEMU) which isn't emitting clock-frequency properties
for cpu nodes, based on what you documented in the kernel
doc file, which says:
"The ARM architecture, in accordance with the ePAPR, requires
the cpus and cpu nodes to be present and contain the properties
described below."

not "must contain the properties described below and also
any others that the ePAPR spec says are mandatory".

So I'm afraid you're stuck with this being an optional property.

(It's also not at all clear what a virtual machine's devicetree
should set the clock-frequency properties to anyway...)

thanks
-- PMM
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
