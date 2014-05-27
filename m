From: Thor Thayer <tthayer.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCHv5 3/3] edac: altera: Add EDAC support for Altera SoC SDRAM Controller
Date: Tue, 27 May 2014 12:58:15 -0500
Message-ID: <CAF03EBd+B5F_UOMOcn+pCE4dOL_24KZku4pweGym=Bip+H_-Rg@mail.gmail.com>
References: <1400169891-29546-1-git-send-email-tthayer@altera.com>
	<1400169891-29546-4-git-send-email-tthayer@altera.com>
	<20140526095730.GC25732@pd.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140526095730.GC25732-fF5Pk5pvG8Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>
Cc: Thor Thayer <tthayer-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, pawel.moll-5wv7dgnIgG8@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, May 26, 2014 at 4:57 AM, Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org> wrote:
> On Thu, May 15, 2014 at 11:04:51AM -0500, tthayer-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org wrote:
>> From: Thor Thayer <tthayer-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
>>
>> v2: Use the SDRAM controller registers to calculate memory size
>>     instead of the Device Tree. Update To & Cc list. Add maintainer
>>     information.
>>
>> v3: EDAC driver cleanup based on comments from Mailing list.
>>
>> v4: Panic on DBE. Add macro around inject-error reads to prevent
>>     them from being optimized out. Remove of_match_ptr since this
>>     will always use Device Tree.
>>
>> v5: Addition of printk to trigger function to ensure read vars
>>     are not optimized out.
>
> Yeah, you could turn those vX: messages into a real commit message -
> much better than none at all :-)
>
> Other than that, the edac bits look ok. I'll wait out until you guys've
> sorted the devicetree issues so ping me when it is ready to pick up.
>
> Thanks.
>
> --
> Regards/Gruss,
>     Boris.
>
> Sent from a fat crate under my desk. Formatting is fine.
> --

Hi Boris,

Sorry about the commit message - I thought I'd fixed it. It will be
fixed in the next version.

I think Steffen and I have worked out how the devicetree should look.
I'll submit the changes soon.

Thanks,

Thor
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
