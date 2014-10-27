From: Thor Thayer <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: Re: [PATCHv2 0/4] Add Altera peripheral memories to EDAC framework
Date: Mon, 27 Oct 2014 17:48:17 -0500
Message-ID: <544ECBB1.2040600@opensource.altera.com>
References: <1413578029-13205-1-git-send-email-tthayer@opensource.altera.com> <544E93F0.3030409@opensource.altera.com> <20141027204307.GB4741@pd.tnic> <544EBA84.7080109@opensource.altera.com> <20141027215908.GC4741@pd.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141027215908.GC4741-fF5Pk5pvG8Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>
Cc: dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, tthayer.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, tthayer-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org


On 10/27/2014 04:59 PM, Borislav Petkov wrote:
> On Mon, Oct 27, 2014 at 04:35:00PM -0500, Thor Thayer wrote:
>> Should I move the EDAC Device probe and error handling from
>> altera_edac_mgr.c to altera_edac.c? Can I mix the MC and Device models
>> in the same file?
> Right, for basic practical reasons, I'd like to keep all functionality
> pertaining to one hw flavour in one compilation unit/one driver. We can
> always split them later if a compelling reason emerges.
>
> Thanks.
>
OK. I will make the changes.

Would the L2 cache and OCRAM specific functions also be in 
altera_edac.c? Each of these EDAC pieces is independent and can be 
compiled in without the others. I've read that the use of #ifdef's is 
discouraged and having separate files in the Makefile solves that.

Thanks for the clarification.

Thor
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
