From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v5 2/7] mailbox: arm_mhu: add driver for ARM MHU controller
Date: Wed, 04 Feb 2015 15:48:37 +0100
Message-ID: <3593142.nVgVfPmW1o@wuerfel>
References: <1422955310-6542-1-git-send-email-Vincent.Yang@tw.fujitsu.com> <4418090.U8XOXMKsEU@wuerfel> <CAJe_Zhe_d-H10J8cH-fxcbusoJV8jMUW-pruXVkEKY7PnLMGFA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAJe_Zhe_d-H10J8cH-fxcbusoJV8jMUW-pruXVkEKY7PnLMGFA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andy Green <andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, =?utf-8?B?UGF3ZcWC?= Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Vincent Yang <vincent.yang.fujitsu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Vincent Yang <Vincent.Yang-l16TxrwUIHTQFUHtdCDX3A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Patch Tracking <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Tetsuya Nuriya <nuriya.tetsuya-+CUm20s59erQFUHtdCDX3A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 04 February 2015 20:04:21 Jassi Brar wrote:
> 
> > Using the bits of the pointer as the message instead of pointing
> > to the message feels like an abuse of the API.
> >
> I can see your POV.
> Now consider a client, like mine, that sends a u32 value as the data.
> But unlike me, the client uses the mailbox api in 'async' mode i.e,
> register a callback function, submit a 32bit message and move on. It
> is perfectly doable, but doesn't kalloc'ing a u32 for each submission,
> seem overkill?

That could easily be done by dereferencing the message data in the
function that queues the asynchronous message: instead of queuing
the pointer, you queue the data in the driver.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
