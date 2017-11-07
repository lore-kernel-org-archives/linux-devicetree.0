From: John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC][PATCH 0/3] Overlay manager for predefined DT overlay fragments
Date: Tue, 7 Nov 2017 15:10:15 -0800
Message-ID: <CALAqxLUBk6Mxcy78ZhExAbrmAE5gSg+AbV0E1By+FmVMa4YDSg@mail.gmail.com>
References: <1507613660-27236-1-git-send-email-john.stultz@linaro.org>
 <20171013214103.mv6wcemzcl36nnvs@rob-hp-laptop> <CALAqxLWcK-wbmQxtX4RziQsvQ26DmixC=gEPojFVHruFrpBnjw@mail.gmail.com>
 <20171017194600.he3suyuls4na5p6x@rob-hp-laptop> <CALAqxLWSLqmN8WWGktVDxfcs3zyk8ktqVJbtAEoHtqZZw5KTVw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CALAqxLWSLqmN8WWGktVDxfcs3zyk8ktqVJbtAEoHtqZZw5KTVw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dmitry Shmidt <dimitrysh-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 17, 2017 at 2:20 PM, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Tue, Oct 17, 2017 at 12:46 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>> On Fri, Oct 13, 2017 at 04:51:03PM -0700, John Stultz wrote:
>>> It seems you're suggesting that there be some sort of special overlay
>>> partition which users have to flash with pre-built images containing
>>> the appropriate overlay dtbs, so that something like the treble
>>> overlay-per-partition approach could be used.
>>
>> I'm not really suggesting anything. I'm not going to take something that
>> *only* solves your usecase of apply an overlay embedded in a base dtb
>> based on the kernel command line. I have no issue really with either one
>> of those. What I don't want is another "overlay manager" for each
>> usecase. And sorry, you don't win for being first (you're not really).
>> All this I said before.
>
> So, I'm not actually asking anyone to take anything here, I'm just
> trying to reopen the conversation that hasn't gone very far, so we can
> find some direction to take.
>
> I've not followed the discussion super closely here, so apologies if
> I'm off base here.  But it does seem there's a number of similar
> efforts, and it seems no one has gotten enough momentum to make a real
> push upstream. It seems its just easier for everyone to keep their own
> approach in their own tree and not to bother.  At one end, sure,
> keeping half baked ideas out of mainline until they really sort
> themselves out is fine, but at the other extreme you risk the
> half-baked ideas calcifying in their own tree and then you have more
> Android (or whatever variant) specific cruft to shake your fist at.
> :)
>
> How do we get to a shared solution here where folks are engaging with upstream?
>
> Even an "I like approach B, go make that work" would help here.

Nudge.  Any further thoughts on what sort of an approach might be viable here?

thanks
-john
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
