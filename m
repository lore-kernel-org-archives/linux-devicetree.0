From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2 1/5] ARM: memory: da8xx-ddrctl: new driver
Date: Mon, 21 Nov 2016 17:56:51 +0000
Message-ID: <6576fc1d-cc16-8d7c-75e7-27c5fbc33101@arm.com>
References: <1477925138-23457-1-git-send-email-bgolaszewski@baylibre.com>
 <1477925138-23457-2-git-send-email-bgolaszewski@baylibre.com>
 <a309a738-7fa7-3aab-4457-f7d693e6b37f@ti.com>
 <CAMpxmJUXJi6PDq0qc-0+r2mLPASLpJUt_njWtXr4Mx4k0Fa82g@mail.gmail.com>
 <d0f3bc66-6dfd-dcdc-a15d-a8f9fdda6048@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <d0f3bc66-6dfd-dcdc-a15d-a8f9fdda6048-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-drm <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, arm-soc <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Robin,

On 21/11/16 17:47, Robin Murphy wrote:
> Hi Bartosz, Sekhar,
>
> On 21/11/16 16:48, Bartosz Golaszewski wrote:

[...]

>> Hi Sekhar,
>>
>> thanks for spotting that.
>>
>> I think we should introduce this function right away, rather than
>> having two static functions doing the same thing. If you don't mind,
>> I'll try to find a good spot for it and send a follow-up series fixing
>> the issue.
>
> As it happens, that was already proposed last week, for much the same
> reason:
>
> http://www.mail-archive.com/linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org/msg111395.html
>

Thanks for pointing this out, yet another platform to move to the new
API after v4.10.

Hi Shekar, Bartosz,

For v4.10, please continue with the open coding as proposed in this
thread in order to avoid cross tree dependencies. I will rework on the
above patch once v4.10 merge window closes to include all these
occurrence and replace them.

-- 
Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
