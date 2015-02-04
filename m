From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH v5 2/7] mailbox: arm_mhu: add driver for ARM MHU
 controller
Date: Wed, 4 Feb 2015 15:09:57 +0000
Message-ID: <20150204150957.GH8656@n2100.arm.linux.org.uk>
References: <1422955310-6542-1-git-send-email-Vincent.Yang@tw.fujitsu.com>
 <4344803.3qsb2TUUaZ@wuerfel>
 <CAJe_Zhfyr9ts=k_=kyXqC=aGtQdrq9MtrRXt6LQKR7iofKjqKg@mail.gmail.com>
 <4418090.U8XOXMKsEU@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4418090.U8XOXMKsEU@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vincent Yang <vincent.yang.fujitsu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?utf-8?B?UGF3ZcWC?= Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Andy Green <andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Patch Tracking <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vincent Yang <Vincent.Yang-l16TxrwUIHTQFUHtdCDX3A@public.gmane.org>, Tetsuya Nuriya <nuriya.tetsuya-+CUm20s59erQFUHtdCDX3A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 04, 2015 at 11:29:55AM +0100, Arnd Bergmann wrote:
> On Wednesday 04 February 2015 08:57:43 Jassi Brar wrote:
> > On 3 February 2015 at 20:55, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> > > On Tuesday 03 February 2015 14:46:11 Russell King - ARM Linux wrote:
> > >> On Tue, Feb 03, 2015 at 08:09:34PM +0530, Jassi Brar wrote:
> 
> > > I had expected to see here something like:
> > >
> > > static int mhu_send_data(struct mbox_chan *chan, void *data)
> > > {
> > >         struct mhu_link *mlink = chan->con_priv;
> > >         u32 *arg = data;
> > >
> > >         writel_relaxed(*arg, mlink->tx_reg + INTR_SET_OFS);
> > > }
> > >
> > > i.e. dereferencing the pointer instead of using the actual value.
> > >
> > OK, just curious how is this (dereferencing to the u32 variable on
> > stack of the client driver) better?
> 
> The API as I understand is defined to use the pointer to point to
> a chunk of data of fixed size, with the size being known to both
> the client driver and the mailbox driver. This is the reason for
> having a pointer in the first place.
> 
> Using the bits of the pointer as the message instead of pointing
> to the message feels like an abuse of the API.

I agree on those two points.  However, passing the address of something
on the stack to mbox_send_message() is also not particularly on - it
may save the pointer to use later on if its operating on non-blocking
mode.

A possible alternative would be if the user of mbox_send_message()
stored the message in an array, operated as a circular buffer, and
passed the address of the word to send.  That would avoid the need
to repeatedly allocate and free memory (which would be expensive for
the sake of a u32.)

-- 
FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
