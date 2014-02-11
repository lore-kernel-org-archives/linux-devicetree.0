From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Linux-3.14-rc2: Order of serial node compatibles in DTS files.
Date: Wed, 12 Feb 2014 00:46:36 +0100
Message-ID: <52FAB65C.4090201@gmail.com>
References: <OF784BA598.ACFE9DA4-ONCA257C76.00827472-CA257C77.000BCFAD@csc.com> <20140206082635.GA7048@visitor2.iram.es> <OFA4C1AF9F.B23E83EC-ONCA257C78.00044235-CA257C78.00080D50@csc.com> <20140207101036.GA823@visitor2.iram.es> <alpine.LRH.2.00.1402071348380.10318@ra8135-ec1.am.freescale.net> <20140210110342.GA15806@visitor2.iram.es> <alpine.LRH.2.00.1402101056410.10318@ra8135-ec1.am.freescale.net> <20140211072606.GA26514@visitor2.iram.es> <OF6F6A0029.3B20EF5B-ONCA257C7C.0071BFDA-CA257C7C.00732AD3@csc.com> <63AEBD99-AA87-4FD7-BBDA-0CE419959F14@kernel.crashing.org> <52FAA97F.4060600@gmail.com> <1392162080.6733.404.camel@snotra.buserror.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1392162080.6733.404.camel-88ow+0ZRuxG2UiBs7uKeOtHuzzzSOjJt@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Stephen N Chivers <schivers-znpAAEhiOVUQrrorzV6ljw@public.gmane.org>, Chris Proctor <cproctor-znpAAEhiOVUQrrorzV6ljw@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 02/12/2014 12:41 AM, Scott Wood wrote:
> On Tue, 2014-02-11 at 23:51 +0100, Sebastian Hesselbarth wrote:
>> On 02/11/2014 11:33 PM, Kumar Gala wrote:
>>> Hmm,
>>>
>>> Wondering if this caused the issue:
>>>
>>> commit 105353145eafb3ea919f5cdeb652a9d8f270228e
>>> Author: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>> Date:   Tue Dec 3 14:52:00 2013 +0100
>>>
>>>       OF: base: match each node compatible against all given matches first
>>
>> [adding Arnd on Cc]
>>
>> Could be. I checked tty/serial/of_serial.c and it does not provide a
>> compatible for "fsl,ns16550". Does reverting the patch fix the issue
>> observed?
>>
>> I don't think the missing compatible is causing it, but of_serial
>> provides a DT match for .type = "serial" just to fail later on
>> with the error seen above.
>>
>> The commit in question reorders of_match_device in a way that match
>> table order is not relevant anymore. This can cause it to match
>> .type = "serial" first here.
>>
>> Rather than touching the commit, I suggest to remove the problematic
>> .type = "serial" from the match table. It is of no use anyway.
>
> Regardless of whether .type = "serial" gets removed, it seems wrong for
> of_match_node() to accept a .type-only match (or .name, or anything else
> that doesn't involve .compatible) before it accepts a compatible match
> other than the first in the compatible property.

Right, I thought about it and came to the same conclusion. I sent a
patch a second ago to prefer .compatible != NULL matches over those
with .compatible == NULL.

Would be great if Stephen can re-test that. If it solves the issue, I
can send a patch tomorrow.

Sebastian

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
