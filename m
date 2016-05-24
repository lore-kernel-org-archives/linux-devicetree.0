From: Adam J Allison <adamj.allison-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Straight up new person
Date: Tue, 24 May 2016 16:08:54 -0500
Message-ID: <CANF=RFSo+SAq514xtywGmLg0_+2CXGbNB4dQMw2OPeZ--n8ezg@mail.gmail.com>
References: <CANF=RFTPy+V2qzFiihEYNxRhn52uoL=RXZBAcGXcRi72DniLbw@mail.gmail.com>
	<5744B67E.6040209@gmail.com>
	<alpine.LFD.2.20.1605241638360.11009@Device-040570>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.LFD.2.20.1605241638360.11009@Device-040570>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Robert P. J. Day" <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Robert,
I'll _safely_ assume you'll do the patching...

Frank,
thank you for pointing me in the right direction.

Have a good day,
-Adam


On Tue, May 24, 2016 at 3:40 PM, Robert P. J. Day <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org> wrote:
> On Tue, 24 May 2016, Frank Rowand wrote:
>
>> On 5/23/2016 3:40 PM, Adam J Allison wrote:
>> > I'm a noob to this, and I've just got a simple typo.
>> > I don't want to bother you, but I can't find out who to email to get it fixed.
>> > I've read the documentation a few times, but still couldn't figure it out.
>> >
>> >
>> > tl dr
>> > am33xx.dtsi: line 190 emda3_mperr should probably be edma3_mperr
>> >
>> >
>> > Thank you for your understanding,
>> > Adam
>>
>> The documentation can be a little hard to navigate.
>>
>> Does this file help?
>>
>>    Documentation/devicetree/bindings/submitting-patches.txt
>>
>> If not, let me know and I'll try to make the documentation
>> better.
>
>   also, when you spot a typo like that, ***immediately*** assume there
> are more of them:
>
> $ grep emda *
> am33xx.dtsi:                    interrupt-names = "edma3_ccint", "emda3_mperr",
> am4372.dtsi:                    interrupt-names = "edma3_ccint", "emda3_mperr",
> dm814x.dtsi:                    interrupt-names = "edma3_ccint", "emda3_mperr",
> dra7.dtsi:                      interrupt-names = "edma3_ccint", "emda3_mperr",
> $
>
> because there always are.
>
> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
