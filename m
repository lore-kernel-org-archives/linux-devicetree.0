From: Julian Calaby <julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sunxi: Raise minimum CPU voltage
 for sun7i-a20 to a level all boards can supply
Date: Mon, 3 Aug 2015 14:22:13 +1000
Message-ID: <CAGRGNgXH90m9h0DDejd5MTf8enduGFQ8dPKrRhmc8Z6y_PaC1w@mail.gmail.com>
References: <1438543386-7253-1-git-send-email-public_timo.s@silentcreek.de>
 <CAGRGNgV6b9yt2HnB2x2Wyc05KEahoX-Y+mVhxsryztcfA36H1g@mail.gmail.com> <CAGb2v67o-=_cL2RWfXJ+3C86zfQ_1b5DYRi3_zwvwy6su6+gdw@mail.gmail.com>
Reply-To: julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDQIP76OUQLBBCOZ7OWQKGQE72YS5MY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <CAGb2v67o-=_cL2RWfXJ+3C86zfQ_1b5DYRi3_zwvwy6su6+gdw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: public_timo.s-fWgRPtSzPNU3WX+qO2AYSQ@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Mailing List, Arm" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Chen-Yu,

On Mon, Aug 3, 2015 at 12:37 PM, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:
> Hi,
>
> On Mon, Aug 3, 2015 at 7:35 AM, Julian Calaby <julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> Hi Timo,
>>
>> On Mon, Aug 3, 2015 at 5:23 AM, Timo Sigurdsson
>> <public_timo.s-fWgRPtSzPNU3WX+qO2AYSQ@public.gmane.org> wrote:
>>> sun7i-a20.dtsi contains an cpufreq operating point at 0.9 volts. Most A20 boards
>>> (or all?), however, do not allow the voltage to go below 1.0V. Thus, raise the
>>> voltage for the lowest operating point to 1.0V so all boards can actually use
>>> it.
>>
>> Surely it wouldn't be added here if some could supply 0.9v.
>
> On the side, the original OPPs in the FEX files are actually
> frequency/voltage ranges, and not just points. Mainlines OPPv2
> will support these, along with turbo frequencies.

Ah, that makes sense.

> Furthermore, the FEX files also have fields that limit the
> minimum and maximum frequencies.

Is this going to be supported by OPPv2 too?

>> Is the code that uses this smart enough to sensibly switch between two
>> operating points with the same frequency and different voltages? If
>> so, maybe just add a 144MHz @ 1.0v operating point?
>
> You could try. Though I really don't see much to gain here.

>From what I recall, lower frequency = less power usage, though my
experience is from x86 laptops, not ARM SoCs and I'm sure I'm missing
a lot of details. This is the sort of thing that requires thorough
testing on a dev board.

>> (Alternatively, would it make sense to modify the code that uses this
>> to use frequencies with voltages specified that are lower than can be
>> supplied with the lowest voltage it can?)
>
> I think that's a bit harder to get accepted.

Oh, definitely. It kinda makes sense, but at the same time it'll
require some seriously thorough testing on a lot of different boards.

My only real objection here is are there boards that can go down to
0.9v and if so, won't this change make them less power efficient in
the almost-idle case? And are those power savings enough to justify
not accepting this patch?

Thanks,

-- 
Julian Calaby

Email: julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Profile: http://www.google.com/profiles/julian.calaby/
