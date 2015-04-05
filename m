From: Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] libfdt: Add fdt_path_offset_namelen()
Date: Sat, 04 Apr 2015 23:50:01 -0400
Message-ID: <5520B0E9.1090902@hurleysoftware.com>
References: <1425654758-2575-1-git-send-email-peter@hurleysoftware.com> <20150310001711.GB30335@voom.fritz.box> <54FEF600.50402@hurleysoftware.com> <20150313054350.GA11132@voom.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150313054350.GA11132-1s0os16eZneny3qCrzbmXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 03/13/2015 01:43 AM, David Gibson wrote:
> On Tue, Mar 10, 2015 at 09:47:44AM -0400, Peter Hurley wrote:
>> Hi David,
>>
>> On 03/09/2015 08:17 PM, David Gibson wrote:
>>> On Fri, Mar 06, 2015 at 10:12:38AM -0500, Peter Hurley wrote:
>>>> Properties may contain path names which are not NUL-terminated.
>>>> For example, the 'stdout-path' property allows the form 'path:options',
>>>> where the ':' character terminates the path specifier.
>>>>
>>>> Allow these path names to be used in-place for path descending;
>>>> add fdt_path_offset_namelen(), which limits the path name to 'namelen'
>>>> characters.
>>>>
>>>> Reimplement fdt_path_offset() as a trivial wrapper.
>>>>
>>>> Signed-off-by: Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
>>>
>>> I think this function is a good idea, however I would like to see a
>>> testcase for it.
>>
>> Sure, I can do that.
>>
>> I assume you mean a path name with non-NUL termination because
>> the fdt_path_offset() tests are already exercising the
>> fdt_path_offset_name() implementation.
> 
> Yes, I mean the non-\0-terminated case.  Or more specifically still,
> making sure that if you call fdt_path_offset_namelen() on a portion of
> a longer path, it correctly gives you the offset for only the partial
> path.
> 
> That said, there may be some other edge cases that could do with
> testing too, if you have time.  In particular I'm thinking of paths
> where there are repeated '/' character, and paths ending with one or
> more '/' characters.
> 
>> Is there a readme somewhere regarding the test matrix (ie.,
>> which dts files go with which tests)?
> 
> I'm afraid not, apart from the test runner script itself.  I'm not
> sure quite what information you're after here.

Ok, now that I have the test working, I see why you didn't understand
what I was after.

The purpose of fdt_path_offset_namelen() is to perform path-descending
from in-place property values; for example, finding the node offset from
the /chosen/stdout-path property of the form

/ {
	chosen {
		stdout-path = "/ocp/serial@44e04d00:115200";
	};
}

I wrote the test to get string properties containing paths from the
fdt; for example, assuming the fdt contains

	path1 = "/subnode@1/subsubnode:";
	path2 = "/subnode@2/subsubnode@0:";
	path3 = "/subnode@1////subsubnode///:";
	path4 = "/subnode@2///subsubnode///:/subnode@1";

the test did:

	const char *path1;

	path1 = fdt_getprop(fdt, 0, "path1", &len);
	...


I had looked at the run_test.sh scripts and known that there were
multiple dtb files produced for the test_tree1 tests so I was asking
for a handy readme to tell me which dts(i) files to add the string
properties to.

When I got the test running for dtbs produced from test_tree1.body.dtsi,
I discovered there were some cross-referenced tests from other
sources, like sw_tree1.c; thus the changes to test_tree1.body.dtsi
cause other tests to fail.

So I've given up on testing fdt_path_offset_namelen() that way,
and instead, am just using static const paths defined in the test
itself, which I will submit shortly.

Regards,
Peter Hurley
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
