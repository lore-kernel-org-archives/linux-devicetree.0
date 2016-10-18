From: Noam Camus <noamca-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Subject: RE: [PATCH 3/3] clocksource: Add clockevent support to NPS400 driver
Date: Tue, 18 Oct 2016 14:51:05 +0000
Message-ID: <DB6PR0501MB251897240ABCBAFAA50CD925AAD30@DB6PR0501MB2518.eurprd05.prod.outlook.com>
References: <1476370350-3853-1-git-send-email-noamca@mellanox.com>
 <1476370350-3853-4-git-send-email-noamca@mellanox.com>
 <20161018135722.oflcjm5hfy6eugiy@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org" <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

>From: Noam Camus=20
>Sent: Tuesday, October 18, 2016 5:33 PM


>>You're letting Linux details define the binding. Are these blocks differe=
nt (the block itself, not connections to >the block like interrupts)?


>>If you need a particular timer instance to be used, then describe whateve=
r is the difference in the h/w.  For >example, the clockevent timer has to =
be the timer with an interrupt.

>Yes, blocks are different.
>The difference is that only second timer instance are actually producing t=
imer interrupt served by Linux for the clockevent framework.
>Please note that the numbering used here for timer (i.e. 0 or 1) are deriv=
ed from HW blocks and are not any Linux detail I used for binding definitio=
n (It is a note at this patch set cover letter).

The timers actually are: first instance (timer 0) for clockevents and secon=
d instance (timer 1) for clocksource.
Sorry for the confusion.

Noam
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
