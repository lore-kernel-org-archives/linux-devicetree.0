From: Thor Thayer <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: Re: [PATCHv8 1/4] EDAC, altera: Add Altera L2 Cache and OCRAM EDAC
 Support
Date: Fri, 22 Jan 2016 16:05:51 -0600
Message-ID: <56A2A7BF.1000307@opensource.altera.com>
References: <1453397668-32094-1-git-send-email-tthayer@opensource.altera.com>
 <56A1C5DE.1080501@mentor.com> <56A24C34.3000303@opensource.altera.com>
 <56A25F59.5070306@mentor.com> <20160122180830.GH9806@pd.tnic>
Reply-To: <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160122180830.GH9806-fF5Pk5pvG8Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>, Vladimir Zapolskiy <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Cc: dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, tthayer.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 01/22/2016 12:08 PM, Borislav Petkov wrote:
> On Fri, Jan 22, 2016 at 06:56:57PM +0200, Vladimir Zapolskiy wrote:
>> it sounds like the author of the original change is Dinh, but if you agreed
>> about authorship transfer, then "From: Thor Thayer" statement should be
>> correct, but in any case your SoB should follow Dinh's SoB, if you decide to
>> keep the latter one.
>>
>> This consideration may apply to the other changes in the changeset as well.
>
> So the patch author should be in the From:
>
> If Thor has changed the original patch considerably, then you Thor and
> Dinh could decide amongst each other who should be the author.
>
> If Thor becomes the author and lands in From:, then the commit message
> could state something like "based on original work from Dinh" or
> "Originally-from: Dinh" and so on. "git log" has some examples.
>
> The SOB chain shows who handled the patch on its way upstream. So in
> this case, it should be:
>
> SOB: Dinh (if From: is Dinh - otherwise Originally-by:)
> SOB: Thor
> SOB: Boris
>
> if I'm going to pick it up and send it to Linus.
>
> Ok?
>
OK. Thank you for the explanation, it is much clearer now. I apologize 
for creating this confusion.

I was the original author for the previous versions of patches (1-6) but 
since I was out for a portion of last year, Dinh picked up version 7 and 
submitted it.

Since I'm taking it back over, Dinh and I agreed that I'll be the only 
signoff from now on. Additionally, I'll make sure I'm the From: going 
forward.

Thor
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
