From: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] devicetree: mxsfb: add reset-active property
Date: Tue, 12 Jan 2016 00:05:33 +0000
Message-ID: <yw1xvb6zvf02.fsf@unicorn.mansr.com>
References: <1450200297-19243-1-git-send-email-mans@mansr.com>
	<20151220033823.GE9883@rob-hp-laptop>
	<yw1xy4bww598.fsf@unicorn.mansr.com>
	<CAL_Jsq++UkEVJDcWVrDZ9pdkz++uU8uD_skYCAmGWv412RbnVA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq++UkEVJDcWVrDZ9pdkz++uU8uD_skYCAmGWv412RbnVA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
	(Rob Herring's message of "Mon, 11 Jan 2016 18:01:01 -0600")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree@vger.kernel.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel@vger.kernel.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marek =?utf-8?Q?Va=C5=A1ut?= <marex-ynQEQJNshbs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> writes:

> On Mon, Jan 11, 2016 at 8:38 AM, M=E5ns Rullg=E5rd <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org> w=
rote:
>> Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> writes:
>>
>>> On Tue, Dec 15, 2015 at 05:24:56PM +0000, Mans Rullgard wrote:
>>>> Some boards connect the LCD_RESET pin to a reset input on the
>>>> display panel.  On these boards, this pin must be set to the
>>>> proper level for the display to function.
>>>>
>>>> This adds an optional "reset-active" property to the "display"
>>>> subnode such that devicetrees can specify the desired polarity
>>>> of the LCD_RESET pin.
>>>>
>>>> Signed-off-by: Mans Rullgard <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>
>>>
>>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>
>> What happened to this patch?
>
> If I acked it, then I'm expecting the platform or subsystem maintaine=
r
> to pick up the series. I don't have patch #2 either, so I'm definitel=
y
> not picking up the series.

Argh, get_maintainer.pl picking different people for different patches
again.  I really wish it would/could send all patches in a series to th=
e
same recipients in cases like this.

Should I resend both to the combined set of people so everybody gets to
see everything?

--=20
M=E5ns Rullg=E5rd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
