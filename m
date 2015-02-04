From: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 2/7] mailbox: arm_mhu: add driver for ARM MHU controller
Date: Wed, 4 Feb 2015 20:04:21 +0530
Message-ID: <CAJe_Zhe_d-H10J8cH-fxcbusoJV8jMUW-pruXVkEKY7PnLMGFA@mail.gmail.com>
References: <1422955310-6542-1-git-send-email-Vincent.Yang@tw.fujitsu.com>
	<4344803.3qsb2TUUaZ@wuerfel>
	<CAJe_Zhfyr9ts=k_=kyXqC=aGtQdrq9MtrRXt6LQKR7iofKjqKg@mail.gmail.com>
	<4418090.U8XOXMKsEU@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4418090.U8XOXMKsEU@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Vincent Yang <vincent.yang.fujitsu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?UTF-8?Q?Pawe=C5=82_Moll?= <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Andy Green <andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Patch Tracking <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vincent Yang <Vincent.Yang-l16TxrwUIHTQFUHtdCDX3A@public.gmane.org>, Tetsuya Nuriya <nuriya.tetsuya-+CUm20s59erQFUHtdCDX3A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 4 February 2015 at 15:59, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Wednesday 04 February 2015 08:57:43 Jassi Brar wrote:
>> On 3 February 2015 at 20:55, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
>> > On Tuesday 03 February 2015 14:46:11 Russell King - ARM Linux wrote:
>> >> On Tue, Feb 03, 2015 at 08:09:34PM +0530, Jassi Brar wrote:
>
>> > I had expected to see here something like:
>> >
>> > static int mhu_send_data(struct mbox_chan *chan, void *data)
>> > {
>> >         struct mhu_link *mlink = chan->con_priv;
>> >         u32 *arg = data;
>> >
>> >         writel_relaxed(*arg, mlink->tx_reg + INTR_SET_OFS);
>> > }
>> >
>> > i.e. dereferencing the pointer instead of using the actual value.
>> >
>> OK, just curious how is this (dereferencing to the u32 variable on
>> stack of the client driver) better?
>
> The API as I understand is defined to use the pointer to point to
> a chunk of data of fixed size, with the size being known to both
> the client driver and the mailbox driver. This is the reason for
> having a pointer in the first place.
>
Yes, we are on the same page. I just have a slightly more liberal view
about the usage of 'void* data'.

> Using the bits of the pointer as the message instead of pointing
> to the message feels like an abuse of the API.
>
I can see your POV.
Now consider a client, like mine, that sends a u32 value as the data.
But unlike me, the client uses the mailbox api in 'async' mode i.e,
register a callback function, submit a 32bit message and move on. It
is perfectly doable, but doesn't kalloc'ing a u32 for each submission,
seem overkill?  Lets say what the client and controller drivers do in
their bedroom is none of the API's business.

> Maybe it would have been better to pass the size explictly as
> a third argument in the API to make that clear.
>
Actually that did come up for consideration. But since the structure
of 'data' packet is already known to the controller driver, having to
also tell the size of that structure seems redundant.

Thanks.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
