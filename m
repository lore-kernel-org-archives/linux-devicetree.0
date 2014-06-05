From: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv5 2/4] mailbox: Introduce framework for mailbox
Date: Thu, 5 Jun 2014 17:09:22 +0530
Message-ID: <CAJe_ZheUpALkb9+8W_DNu=WGHMn0N+7Ctik6DNJZiARVsbR35Q@mail.gmail.com>
References: <1400134105-3847-1-git-send-email-jaswinder.singh@linaro.org>
	<1400134260-3962-1-git-send-email-jaswinder.singh@linaro.org>
	<7978295.UBGxYvcnvH@wuerfel>
	<CAJe_Zhe_VFTpPW0sKBsqit347MR7QmEDvzvQTyh1DWr3v991tg@mail.gmail.com>
	<20140529154348.GH32082@beef>
	<CABb+yY2PiGpqy2uevCFexAKeS4aZxJxZHEDJTRN1SW6VVjBzGQ@mail.gmail.com>
	<20140602151454.GK32082@beef>
	<CABb+yY3ZYqtT+R0PwZDtpW0O0SsbxTyiYmXaseZHoj4Nr6UBPQ@mail.gmail.com>
	<CAPKp9uZTnWCojeZHyvrm=vTuY15dAHiW1CWP18JUfuKU-mfH0Q@mail.gmail.com>
	<CAJe_ZheA_2PwzFGwx2rdba0oVsAKRnwK02XE-8nPY6K5NKpdTw@mail.gmail.com>
	<20140605111205.GD32082@beef>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140605111205.GD32082@beef>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "Anna, Suman" <s-anna-l0cyMroinI0@public.gmane.org>, Loic Pallardy <loic.pallardy-qxv4g6HH51o@public.gmane.org>, LeyFoon Tan <lftan.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Craig McGeachie <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>, Courtney Cavin <courtney.cavin-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Josh Cartwright <joshc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "ks.giri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <ks.giri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 5 June 2014 16:42, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Tue, Jun 03, 2014 at 03:51:55PM +0530, Jassi Brar wrote:
>
>> BTW, here we at least have a hardware resource to specify in the DT
>> node, there are examples in kernel where the DT nodes are purely
>> virtual. For ex, grep for "linux,spdif-dit". So I think we should be
>> ok.
>>
>
> There's a bit of a difference between my concern over a virtual node and
> this example you've cited. In the dummy spdif transmitter, it's defining
> a virtual device that plugs in for a codec, a hardware concept well
> defined in the audio bindings. I agree that there are many examples of
> this type of virtual node, including dummy phys, but in all cases they
> are stubbing out a real hardware concept.
>
> I find it to be distinctly different to create a node that doesn't
> represent the hardware's use of mailboxes.
>
The way I see "cpm_ipc" is that it represents a device that doesn't
need MMIO or an IRQ, but only the mailbox hardware resource.
"linux,spdif-dit" needs no hardware resource at all. So if anything,
more "virtual" than cpm_ipc.

> I'd be happy if a DT
> maintainer could say that this is acceptable though. ;)
>
OK, though it becomes clear only after reading this ;)

Cheers
-Jassi
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
