From: Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCHv10 0/4] Common Mailbox Framework
Date: Tue, 9 Sep 2014 11:23:54 -0500
Message-ID: <540F299A.6030906@ti.com>
References: <1406896194-4667-1-git-send-email-jaswinder.singh@linaro.org>	<20140801182656.GJ30458@sirena.org.uk> <CAJe_ZhcmEUDD3+xC2mBFnBm7uiMhibtHhBOMxVBhy700BTvYsA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAJe_ZhcmEUDD3+xC2mBFnBm7uiMhibtHhBOMxVBhy700BTvYsA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ks.giri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <ks.giri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Courtney Cavin <courtney.cavin-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Craig McGeachie <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>, LeyFoon Tan <lftan.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Loic Pallardy <loic.pallardy-qxv4g6HH51o@public.gmane.org>, Ashwin Chaugule <ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>, Patch Tracking <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mollie Wu <mollie.wu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Tetsuya Takinishi <t.takinishi-+CUm20s59erQFUHtdCDX3A@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andy Green <andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Jassi,

On 08/02/2014 02:48 AM, Jassi Brar wrote:
> On 1 August 2014 23:56, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>> On Fri, Aug 01, 2014 at 05:59:54PM +0530, Jassi Brar wrote:
>>> Hello,
>>>  Here's v10. Not much different from v9. The code and the generic
>>> bindings looked good enough to relevant gods, but the patchset still
>>> needs some formal loving in the form of Acked-by's.
>>>
>>> Changes since v9:
>>>  o Purely cosmetic changes - added headers and used BIT()
>>
>> Given that this code is now getting very stable can I suggest setting up
>> a git tree and making sure it's included in -next?  Just send Stephen a
>> mail with a pointer to the relevant tree and branch and ask him to add it.
>>
>> I'd say it's probably worth merging at this point though since it's not
>> been in -next yet and the merge window is likely to open this weekend it
>> might be a bit much to try to merge it this window.
>>
> Thanks, sounds good. Will do.

Is there anything pending on this series to make it into 3.18?

This is one of the dependencies for our AM335/AM437 PM suspend support,
so it would be great to see this in 3.18, so that we can target 3.19 for
the PM series.

regards
Suman


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
