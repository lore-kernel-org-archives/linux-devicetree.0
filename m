From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] memory: add a basic OF-based memory driver
Date: Mon, 16 Sep 2013 07:55:29 -0500
Message-ID: <CAL_Jsq+iYJBCKoM7S2wC1PVVM1sktmX6dWDpoKzYAvB7Q7j_8A@mail.gmail.com>
References: <1378863781-4235-1-git-send-email-emilio@elopez.com.ar>
	<1379032225-6425-1-git-send-email-emilio@elopez.com.ar>
	<CAOesGMiUMniKRLRgGPsimR0bXWQFbx+SL5dUJXOb8t0JfEcHsg@mail.gmail.com>
	<52326ADC.8040703@elopez.com.ar>
	<CAL_JsqJACEtSRaDg0TcYODzhpsHFGa4mFSYa_R3qspypEKH+hQ@mail.gmail.com>
	<CAOesGMj=b5c_1v-nAejUzuOMfx44AHr2=yfoPepHYsh0=t0wOQ@mail.gmail.com>
	<20130915124325.B1DF2C42C5C@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130915124325.B1DF2C42C5C-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, =?ISO-8859-1?Q?Emilio_L=F3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?ISO-8859-1?Q?David_Lanzend=F6rfer?= <david.lanzendoerfer-Z7Kmv9EsliU@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Sep 15, 2013 at 7:43 AM, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>=
 wrote:
> On Fri, 13 Sep 2013 08:49:06 -0700, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> w=
rote:
>> On Fri, Sep 13, 2013 at 7:00 AM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>=
 wrote:
>> > On Thu, Sep 12, 2013 at 8:31 PM, Emilio L=F3pez <emilio-0Z03zUJReD7QT0dZR+AlfA@public.gmane.org=
=2Ear> wrote:

[snip]

>> > Better, but this is still wrong. DT describes the hardware. There =
is
>> > no such h/w as a simple-memory-controller. The fact that you have =
a
>> > simple-memory-ctrlr kernel driver is a kernel
>> > feature/artifact/limitation. Describe the h/w with a meaningful
>> > compatible string and put that string in the simple memory control=
ler
>> > driver match table. If someday we have a real driver for said memo=
ry
>> > controller, then it is only a kernel change to use a different dri=
ver.
>>
>>
>> We discussed this over IRC last night -- I still think it makes more
>> sense to make the clock driver for sunxi aware of this and just add =
a
>> reference to the clock at init time.
>>
>> This is never going to differ from board to board (today the clock
>> name is the same on all sunxi platforms -- pll5_ddr. And the need wi=
ll
>> likewise be there for all platforms at this time.
>>
>> If and when it changes in the future, we can reevaluate. But this
>> doesn't have to be driven by device tree at this time, it seems to
>> just make things overly complicated and contrived.
>
> I agree. Creating a new platform driver + device tree binding just to
> claim a clock that must not be disables does not look like the right
> approach to me either.

Maybe a driver is overkill, but fully describing the h/w would be a
good thing. Only defining the h/w that Linux currently uses is not a
good practice (although admittedly hard to avoid).

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
