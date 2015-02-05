From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v5 2/7] mailbox: arm_mhu: add driver for ARM MHU controller
Date: Thu, 05 Feb 2015 13:31:51 +0100
Message-ID: <5765997.dBPa4LUUq1@wuerfel>
References: <1422955310-6542-1-git-send-email-Vincent.Yang@tw.fujitsu.com> <CAJe_Zhf_WuRK2EE0Sj9ksXDDe5VA=DJ+H3eS4YRKpDZLdRRfow@mail.gmail.com> <20150205120829.GO8656@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150205120829.GO8656-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andy Green <andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, =?utf-8?B?UGF3ZcWC?= Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Vincent Yang <vincent.yang.fujitsu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Vincent Yang <Vincent.Yang-l16TxrwUIHTQFUHtdCDX3A@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Patch Tracking <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Tetsuya Nuriya <nuriya.tetsuya-+CUm20s59erQFUHtdCDX3A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thursday 05 February 2015 12:08:29 Russell King - ARM Linux wrote:
> On Thu, Feb 05, 2015 at 05:32:39PM +0530, Jassi Brar wrote:
> > On Feb 5, 2015 5:13 PM, "Arnd Bergmann" <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> > >
> > > >
> > > > I know typedef's are frowned upon, but how bad is the following option?
> > > >        typedef void*  mbox_data_info
> > > >        int mbox_send_message(struct mbox_chan *chan, mbox_data_info
> > data);
> > >
> > > I don't see how that would help.
> > >
> > If it's abuse because the argument is a void*... What if we called it
> > mbox_data_info?  To say platforms are free to pass data as a pointer or a
> > value 

I misunderstood then, I thought you were trying to enforce that
people use a proper pointer.

> Using a typedef really doesn't change anything.  If you read the kernel
> coding style, you'll realise that typedefs are a reason to reject
> patches - especially to use them in the way you are proposing.

Agreed, using a typedef here would add an extra problem rather than
solve the one we already have.

> Try the solution I suggested (which I notice was seemingly totally
> ignored.)

As I understood, Jassi doesn't even have this problem, because his
driver uses a synchronous call rather than an asynchronous one
and he can just pass the data on the stack.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
