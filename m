From: Ashwin Chaugule <ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv8 2/2] mailbox: Introduce framework for mailbox
Date: Mon, 14 Jul 2014 09:04:05 +0100
Message-ID: <CAJ5Y-eb3EqbmNNKFPFShiBEDEf11pPMg2hVhMz=RPt+1H+FyZQ@mail.gmail.com>
References: <1405071167-14503-1-git-send-email-jaswinder.singh@linaro.org>
	<1405071325-14683-1-git-send-email-jaswinder.singh@linaro.org>
	<CAJ5Y-eYPffYQ57ERODyBYYKjL2FVhGapKmP0YxzcT9rswfaJaA@mail.gmail.com>
	<CAJe_Zhe5W4D+TzyfKdE8KvSc8SJwyHG3SQGpUyd8-ML-wHBDyg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAJe_Zhe5W4D+TzyfKdE8KvSc8SJwyHG3SQGpUyd8-ML-wHBDyg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ks.giri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <ks.giri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Courtney Cavin <courtney.cavin-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Craig McGeachie <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>, LeyFoon Tan <lftan.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Loic Pallardy <loic.pallardy-qxv4g6HH51o@public.gmane.org>, "Anna, Suman" <s-anna-l0cyMroinI0@public.gmane.org>, Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>, Patch Tracking <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "Mollie.Wu" <Mollie.Wu-l16TxrwUIHTQFUHtdCDX3A@public.gmane.org>, Tetsuya Takinishi <t.takinishi-+CUm20s59erQFUHtdCDX3A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

On 14 July 2014 05:17, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On 11 July 2014 17:16, Ashwin Chaugule <ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> Hi Jassi,
>>
>> Other than a few nits, this looks good to me.
>>
> Thanks for the nits. I will club them together with other feedback on
> the patchset.
>
>>
>> Hopefully you've run this through checkpatch as well? Also, were you
>> able to sort out the process of getting this stuff hosted on Linaro's
>> git servers? or elsewhere? It would really help maintainers to pick
>> this up and for others to rebase on top of your changes.
>>
> I didn't think it was a good idea to keep a 'dev-branch' for a new
> subsystem before having even a single Ack or Reviewed-by.  Users
> should track patch revisions on mailing lists and later maintainers
> will be sent a tree:branch to pick Acked patches from.

Your private dev branch doesn't need to have any Acks/Reviewed-bys.
You can add my signature after addressing the feedback.

Reviewed-by: Ashwin Chaugule <ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Cheers,
Ashwin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
