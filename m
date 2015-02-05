From: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 2/7] mailbox: arm_mhu: add driver for ARM MHU controller
Date: Thu, 5 Feb 2015 20:20:11 +0530
Message-ID: <CAJe_ZhfeMpA-4+OgAuiTKVCbqi_de8BXT3iKY2pJ8obXdVhtSA@mail.gmail.com>
References: <1422955310-6542-1-git-send-email-Vincent.Yang@tw.fujitsu.com>
	<3540319.u6RL7AO77m@wuerfel>
	<CAJe_ZhcXR4oaBKZx3n0ckCzXgbREoezUXjizJ09QXQVqEQ3G_g@mail.gmail.com>
	<2790199.44Rvt91EcZ@wuerfel>
	<CAJe_Zhf_WuRK2EE0Sj9ksXDDe5VA=DJ+H3eS4YRKpDZLdRRfow@mail.gmail.com>
	<20150205120829.GO8656@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150205120829.GO8656-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Vincent Yang <vincent.yang.fujitsu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Vincent Yang <Vincent.Yang-l16TxrwUIHTQFUHtdCDX3A@public.gmane.org>, Andy Green <andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, =?UTF-8?Q?Pawe=C5=82_Moll?= <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Patch Tracking <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Tetsuya Nuriya <nuriya.tetsuya-+CUm20s59erQFUHtdCDX3A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 5 February 2015 at 17:38, Russell King - ARM Linux
<linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> wrote:
> On Thu, Feb 05, 2015 at 05:32:39PM +0530, Jassi Brar wrote:
>> On Feb 5, 2015 5:13 PM, "Arnd Bergmann" <arnd-r2nGTMty4D4@public.gmane.org> wrote:
>> >
>> > >
>> > > I know typedef's are frowned upon, but how bad is the following option?
>> > >        typedef void*  mbox_data_info
>> > >        int mbox_send_message(struct mbox_chan *chan, mbox_data_info
>> data);
>> >
>> > I don't see how that would help.
>> >
>> If it's abuse because the argument is a void*... What if we called it
>> mbox_data_info?  To say platforms are free to pass data as a pointer or a
>> value :)
>
> Using a typedef really doesn't change anything.  If you read the kernel
> coding style, you'll realise that typedefs are a reason to reject
> patches - especially to use them in the way you are proposing.
>
I started with "I know typedef's are frowned upon". But thanks for reminding me.

Instead of a void*, we could say a client passes data to the
controller via an argument that is sizeof(void *) big, so we
facilitate both usages. Anyways, I get the message that that is not
acceptable.

> Try the solution I suggested (which I notice was seemingly totally
> ignored.)
>
My client drivers work in blocking mode, so I don't suffer. For the
platform that passes u32 in async mode, we'll let it manage its own
circular buffer scheme as you suggested.

Thanks.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
