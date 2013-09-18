From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: "memory" binding issues
Date: Wed, 18 Sep 2013 10:28:44 -0600
Message-ID: <5239D4BC.3030600@wwwdotorg.org>
References: <1379300274.4098.77.camel@pasglop> <1379371567.3721.46.camel@pasglop> <CAOesGMgE1jiF5OHsmPQz2z66Bcqu0HeAj=taE1vmFK-0-0s2TQ@mail.gmail.com> <1815499.tpfeUKmP6V@flatron> <20130917164307.GA31327@quad.lixom.net> <5238C4D1.6060500@gmail.com> <CAOesGMh0F09OAR4bepGSCE5Z5OZ56fBmDPBSfwZ+NB9RgcE0Vw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOesGMh0F09OAR4bepGSCE5Z5OZ56fBmDPBSfwZ+NB9RgcE0Vw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 09/17/2013 03:15 PM, Olof Johansson wrote:
> On Tue, Sep 17, 2013 at 2:08 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On 9/17/2013 9:43 AM, Olof Johansson wrote:
>>> On Tue, Sep 17, 2013 at 09:56:39AM +0200, Tomasz Figa wrote:
>>>> I'm afraid that I must disagree. For consistency I'd rather go with what
>>>> Ben said. Please see ePAPR chapter 2.2.1.1, which clearly defines how
>>>> nodes should be named.
>>>
>>> 2.2.1.1 is there to point out that unit address _has_ to reflect reg.
>>>
>>> 2.2.3 says that unit addresses can be omitted.
>>
>> 2.2.3 is talking about path names.
>>
>> 2.2.1.1 is talking about node names.
>>
>> 2.2.1.1 _does_ require the unit address in the node name, 2.2.3 does not
>> remove that requirement.
> 
> Sigh, that's horrible. OF clearly doesn't require it.
> 
> I guess people prefer to follow ePAPR even though it's broken? That
> means someone needs to cleanup the current dts files. Any takers?

FWIW, I investigated enhancing dtc to enforce this rule. Here are the
results:

********** TEST SUMMARY
*     Total testcases:	1446
*                PASS:	1252
*                FAIL:	58
*   Bad configuration:	136
* Strange test result:	0
**********

That's just in dtc itself, and not any of the *.dts in the kernel or
U-Boot source trees...

I'll see how much of patch it takes to fix up all the test-cases in dtc.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
