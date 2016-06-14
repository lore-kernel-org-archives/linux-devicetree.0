From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: case sensitivity for devicetree node names
Date: Mon, 13 Jun 2016 20:53:37 -0700
Message-ID: <575F7FC1.5040508@gmail.com>
References: <575B1D84.2010703@gmail.com>
 <20160614011021.GD4882@voom.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160614011021.GD4882-RXTfZT5YzpxwFLYp8hBm2A@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 06/13/16 18:10, David Gibson wrote:
> On Fri, Jun 10, 2016 at 01:05:24PM -0700, Frank Rowand wrote:
>> I had assumed that devicetree node names were case sensitive. But a recent
>> email thread asserted that they were not, which made me curious.
>>
>> dtc treats node names as case sensitive:
>>
>> $ cat test_node_case_1.dts
>>
>> /dts-v1/;
>>
>> / {
>> 	node-x {
>> 		prop_a = < 1 >;
>> 	};
>> };
>>
>> / {
>> 	node-X {
>> 		prop_a = < 2 >;
>> 	};
>> };
>>
>> $ cat test_node_case_2.dts
>>
>> /dts-v1/;
>>
>> / {
>> 	node-x {
>> 		prop_a = < 1 >;
>> 	};
>> };
>>
>> / {
>> 	node-x {
>> 		prop_a = < 2 >;
>> 	};
>> };
>>
>> $ dtc -O dts test_node_case_1.dts
>> /dts-v1/;
>>
>> / {
>>
>> 	node-x {
>> 		prop_a = <0x1>;
>> 	};
>>
>> 	node-X {
>> 		prop_a = <0x2>;
>> 	};
>> };
>>
>> $ dtc -O dts test_node_case_2.dts
>> /dts-v1/;
>>
>> / {
>>
>> 	node-x {
>> 		prop_a = <0x2>;
>> 	};
>> };
>>
>>
>> But the Linux kernel source code defines of_node_cmp() as:
>>
>>   include/linux/of.h:
>>
>>   /* Default string compare functions, Allow arch asm/prom.h to override */
>>   #if !defined(of_compat_cmp)
>>   #define of_node_cmp(s1, s2) strcasecmp((s1), (s2))
>>
>> arch/sparc/include/asm/prom.h uses strcmp() instead of strcasecmp().
>>
>> Examples of using of_node_cmp() to check for a node name can be found,
>> for example, of_find_node_by_name().
>>
>> Is case insensitivity for node names a bug in the Linux kernel, or desired
>> for some reason?
> 
> Hmm.. a bit embarrassingly, I've never really thought about this in
> all the years I've been doing dtc - I also pretty much just assumed
> it was case-sensitive.
> 
> I haven't been able to find something in IEEE 1275 definitively saying
> one way or the other - it's not exactly easy to search for since
> "case" gives you hundreds or thousands of irrelevant hits of the form
> "in the case of blah".

One reference in 1275 that I just happened to notice this morning is
in "3.2.1.1 Node names":

   Each node in the device tree is identified by a node name using the following notation:

      driver-name@unit-addres:device-arguments

   The driver name field is a sequence of between one and 31 letters, digits, and punctuation characters from the set
   ",._+-". Uppercase and lowercase characters are distinct.

I am reading "Uppercase and lowercase characters are distinct" to mean that
node names are case sensitive.


> I do recall that there was a semantic difference between vendor
> prefixes in uppercase (they were supposed to be stock tickers) and
> those in lowercase (those were freeform).  That suggests that property
> names at least were expected to be case sensitive.
> 
> Here's my inclination for how to treat this in dtc for the time being:
>     1) Leave the bulk of dtc case sensitive, as now
>     2) Add a new check which will generate an error if there are node
>        names which differ only in case.
> 
> Any objections to that plan?

I think that the kernel should match the current behavior of dtc.

I agree with "1)".

I don't think that "2)" is required.  I think it is a really dumb idea for
anyone to create a dts with node names that differ only in case.  But I
don't think it is the compiler's job to protect people from being dumb.
An analogue would be the C language and compilers.  The C compiler doesn't
error on a program that has variables "foo" and "Foo".

My current thought is to create a Linux kernel RFC patch that 

1) changes of_node_cmp() and friends to something like:

   #ifdef CONFIG_OF_CASE_BROKEN
   #define of_node_cmp(s1, s2) strcasecmp((s1), (s2))
   #else
   #define of_node_cmp(s1, s2) strcmp((s1), (s2))
   #endif

2) remove the sparc definition of of_node_cmp() and friends.

3) Change the Kconfig entry for CONFIG_PPC_PMAC to select
   CONFIG_OF_CASE_BROKEN

Then let the patch sit in the -next tree for two releases to
try to shake out any issues.  Any other case broken platform
could then select or set CONFIG_OF_CASE_BROKEN if the dts
and/or code can't be reasonably fixed.

I have a patch series (a few kernel printks and a userspace
program to parse the console output) that shows 1) which
properties the kernel attempts to access but do not exist
in a given device tree and 2) which properties are in a
given device tree but the kernel does _not_ attempt to
access.  I could probably extend that to do the same checks
for node names.  The patch series is not quite ready for
prime-time, but I could make it easily available for
anyone who is trying to figure out why my proposed
kernel patch breaks a system's boot.  Then it becomes
a case by case choice of whether to fix the devicetrees or
modify the kernel to also check for the incorrect case node.

-Frank
