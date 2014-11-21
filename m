From: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/9] clk: Add clock driver for mb86s7x
Date: Fri, 21 Nov 2014 23:28:38 +0530
Message-ID: <CAJe_Zhc2UePxy-Y2LsU1Pn18OOknDKZw-8rjJ06DEWOhvs6CMw@mail.gmail.com>
References: <1416486442-25200-1-git-send-email-Vincent.Yang@tw.fujitsu.com>
	<2147877.AXJukoovHQ@wuerfel>
	<CAJe_Zhdg0tRx1SiACpCci3B2XaCxECGvkE7D=fne6vch4Bhk-w@mail.gmail.com>
	<5451217.D7Cssxh5Uh@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5451217.D7Cssxh5Uh@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Vincent Yang <vincent.yang.fujitsu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andy Green <andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Patch Tracking <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vincent Yang <Vincent.Yang-l16TxrwUIHTQFUHtdCDX3A@public.gmane.org>, Tetsuya Nuriya <nuriya.tetsuya-+CUm20s59erQFUHtdCDX3A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 21 November 2014 22:45, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Friday 21 November 2014 22:06:51 Jassi Brar wrote:

>> >> Only MB86S70_CRG11_UNGPRT is marked to mean one special (non-maskable)
>> >> port on the controller, which the clock driver does make use of.
>> >
>> > Is this the actual port number that is known to be non-maskable?
>> >
>> Yes the clock comes out of the controller and is also the parent of
>> other 8 independently maskable clock ports of the domain.
>
> I'm getting confused by the terminology here. Is MB86S70_CRG11_ALW
> a port or a controller?
>
Sorry, bad symbols. ALW..DPHY are controllers. UNGPRT is the ninth
parent clock (port) of a domain that can't be masked.
FYKI, there are 6 instances, of some CRG11 clock controller, under
control of the remote f/w. The Mailbox protocol between remote f/w and
Linux assigned indices [0-5] to these controllers.

>>  The firmware on remote master, lets say, don't wanna be bothered by
>> the clock topology. Even for set-rate the onus is on Linux to request
>> only appropriate rates at appropriate times so that other devices are
>> not messed up.
>
> Is there any code to validate that, or does Linux just treat all
> clocks transparently?
>
The remote does not expose the clock topology and only accepts
requests on port-basis. The remote f/w is supposed to keep track of
which ports are used by Linux and then work out inter-dependencies
upon receiving a request from Linux. So for Linux there are N
independent 'root' clocks, ops on which may or may not succeed at any
given time.

thanks
jassi
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
