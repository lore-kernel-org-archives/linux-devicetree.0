From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [linux-sunxi][PATCH 0/2] ARM: dts: sun4i: mk802 variant patches
Date: Wed, 9 Dec 2015 10:29:21 +0100
Message-ID: <5667F471.1090505@redhat.com>
References: <1449600534-5098-1-git-send-email-codekipper@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1449600534-5098-1-git-send-email-codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Marcus,

On 08-12-15 19:48, codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> From: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>
> This patch series splits the mk802 dts into common include file which
> can be shared with the mk802+ device. The only difference that I can
> see between this and the original device is that it has an internal
> microphone.
>
> With that in mind we can either leave things as they are and enable
> the capture to the original mk802 dts or apply this patch to distinguish
> between the two devices.

Thanks for your work on this, but I do not think that it is a good idea
to differentiate between the different mk802 (not mk802-ii) models, there
are many variants and the chances of a user knowing exactly which variant
he has are small.

So instead we should do the same as with the q8 formfactor tablets and
strive to have a single dts which works everywhere. Here that seems
easy enough, just always enable the mic input (once we have support for
it), this will give people without the mic just noise if they try to use
it but that is not a big deal IMHO.

Regards,

Hans
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
