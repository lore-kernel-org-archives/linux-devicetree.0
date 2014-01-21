From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [RFC PATCH 1/1] of/irq: create interrupts-extended-2 property
Date: Mon, 20 Jan 2014 17:03:23 -0800
Message-ID: <CAOesGMjrLs9eEPurjUpOfgyexnc__FJkRYmAR84_f7C15HH07Q@mail.gmail.com>
References: <1389786445-10598-1-git-send-email-plagnioj@jcrosoft.com>
	<20140115161224.GH25824@e106331-lin.cambridge.arm.com>
	<20140120224742.EC905C40B12@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140120224742.EC905C40B12-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 20, 2014 at 2:47 PM, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Wed, 15 Jan 2014 16:12:24 +0000, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
>> >
>> > Another, more invasive option would be extend the dts syntax and teach
>> > dtc to handle property appending. Then the soc dts could stay as it is,
>> > and the board dts could have something like:
>> >
>> >     /append-property/ interrupts = <&intc1 6 1>;
>> >     /append-property/ interrupt-names = "board-specific-irq";
>> >
>> > Both these options solve the issue at the source, are general to other
>> > properties, and allow more than one level of hierarchy (the proposed
>> > interrupts-extended-2 only allows one level).
>>
>> I've just had a go at implementing the append-property mechanism above
>> in dtc, and it was far easier than I expected (patch below).
>>
>> Does anyone have any issues with the /append-property/ idea?
>
> I think that is reasonable.


The main problem with this (same for clocks) is if you need to append
something with a name when the original didn't have any.

Reordering entries might not work for interrupts, since the bindings
might have requirements on order.

I'm not aware of a good solution for this. Suggestions welcome.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
