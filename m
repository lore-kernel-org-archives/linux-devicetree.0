From: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Subject: Re: [PATCH v2 REPOST] dtc: Add support for named integer constants
Date: Wed, 11 Jan 2012 14:05:28 -1000
Message-ID: <4F0E23C8.8030009@firmworks.com>
References: <1323720257-23847-1-git-send-email-swarren@nvidia.com>
 <CAPnjgZ3Rnbu6qZponnbQ8bRgABb-58HG-yYSxRu2FZfvwPnMJw@mail.gmail.com>
 <74CDBE0F657A3D45AFBB94109FB122FF1751860874@HQMAIL01.nvidia.com>
 <CAPnjgZ19s-O2m3CnrfSNLhg4hA61kKiwFym7pOTZ=C7kG+SVbA@mail.gmail.com>
 <74CDBE0F657A3D45AFBB94109FB122FF17761F17D5@HQMAIL01.nvidia.com>
 <74CDBE0F657A3D45AFBB94109FB122FF177EE3A52D@HQMAIL01.nvidia.com>
 <20120111130056.GK4935@truffala.fritz.box> <E1RkzJs-000590-4s@jdl.com>
 <74CDBE0F657A3D45AFBB94109FB122FF177EE3A7A5@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF177EE3A7A5-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

I find it ironic that the very first device tree implementation, dating 
back to 1989, was built around a Turing complete language.

On 1/11/2012 11:36 AM, Stephen Warren wrote:
> Jon Loeliger wrote at Wednesday, January 11, 2012 7:38 AM:
>>> On Tue, Jan 10, 2012 at 01:54:30PM -0800, Stephen Warren wrote:
>>>> John, David,
>>>>
>>>> What can we do to reach consensus on expanding dtc to handle named
>>>> constants, or in general any future direction to extend the syntax with
>>>> expressions etc.?
>>>
>>> Hrm, so, I'm not at all keen to add a named constant syntax without at
>>> least having an outline of what a future macro/function syntax would
>>> look like.
>>
>> Which is where I thought it was left earlier...? :-)
>> And it's not just what the macro/function syntax will look like,
>> but also how these will play into a more generalized expression
>> handling mechanism.  Defining something one-off now that doesn't
>> fit well into a long term plan is less than ideal.
>>
>> Yes, I know that is tantamount to requiring the whole, larger
>> picture be solved first.  But Dave is right -- at least an outline
>> of the direction.  Seriously, the lexical problems can form some
>> of the nastiest gotchas if we're not careful from the onset.
>
> So that all makes sense.
>
> My question is: How can we get consensus on what we want that complete
> future syntax to be? IIRC, Jon has a branch that implements a proposal,
> and David at least posted a different proposal if not actual code that
> implemented it. We're not missing proposals, but rather a mechanism to
> decide between them?
>
> For what it's worth, I'd tend towards a simple expression-based syntax
> where property values can be calculated with C-style expressions. Basic
> math stuff like ( ) + - * /&  | ~<<  >>  and some basic string handling
> operations (str(int) and concatenation). I think that'd cover the vast
> majority of use-cases wouldn't it? For more advanced stuff like loops
> to synthesize multiple nodes, it seems like writing a custom script to
> generate the .dts file and then passing the result to dtc would be more
> modular, and not require us to create a whole new Turing-complete
> language in dtc?
>
