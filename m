From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: case sensitivity for devicetree node names
Date: Sun, 12 Jun 2016 11:39:37 -0700
Message-ID: <575DAC69.5010804@gmail.com>
References: <575B1D84.2010703@gmail.com> <575C68A1.1020701@gmail.com>
 <1465682743.19533.18.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1465682743.19533.18.camel-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/11/16 15:05, Benjamin Herrenschmidt wrote:
> On Sat, 2016-06-11 at 12:38 -0700, Frank Rowand wrote:
>> I chased through the history and found a 2.6.0-test5 announcement
>> which noted the patch from you which adds:
>>
>>   of_find_node_by_path()
>>   of_find_node_by_name()
>>   of_find_node_by_type()
>>   of_find_compatible_node()
>>
>> (And the patch is commit 394edd852a14 in the git recreation
>> of bitkeeper days, which is found at
>> git://git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git)
>>
>> That version of the functions uses a case insensitive compare for
>> devicetree node names.
>>
>> Do you remember why you chose to not use a case sensitive compare?
> 
>>From memory, there were inconsistency in case on various earlier
> machines (notably old macs). I think that's the main reason.
> 
> Cheers,
> Ben.

Is there a kernel config option (or a small set of config options)
that would identify the affected machines?  It would be ok if
the option(s) also included some non-affected machines.  That
way we could use the case insensitive compare for a small
set of machines.
