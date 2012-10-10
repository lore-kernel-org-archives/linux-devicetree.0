From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: dtc: import latest upstream dtc
Date: Wed, 10 Oct 2012 12:45:40 -0600
Message-ID: <5075C254.4040304@wwwdotorg.org>
References: <1348867559-2495-1-git-send-email-swarren@wwwdotorg.org>
 <5069C042.40209@gmail.com> <5069C11C.6040505@wwwdotorg.org>
 <5069D946.1060502@gmail.com> <5069E1F0.5070902@wwwdotorg.org>
 <E1TIktZ-0000U4-Qh@jdl.com> <50749441.8030307@wwwdotorg.org>
 <5075ABB8.103@gmail.com> <5075BD21.2070106@firmworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <5075BD21.2070106-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Cc: Michal Marek <mmarek-AlSwsSmVLrQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/10/2012 12:23 PM, Mitch Bradley wrote:
> On 10/10/2012 7:09 AM, Rob Herring wrote:
>> On 10/09/2012 04:16 PM, Stephen Warren wrote:
>>> On 10/01/2012 12:39 PM, Jon Loeliger wrote:
>>>>>
>>>>> What more do you think needs discussion re: dtc+cpp?
>>>>
>>>> How not to abuse the ever-loving shit out of it? :-)
>>>
>>> Perhaps we can just handle this through the regular patch review
>>> process; I think it may be difficult to define and agree upon exactly
>>> what "abuse" means ahead of time, but it's probably going to be easy
>>> enough to recognize it when one sees it?
>>
>> Rather than repeating things over and over in reviews, we should
>> document at least rules we can easily agree on and then add to it when
>> people get "creative." Also, I can't keep up with every single binding
>> review as is, and this could just add another level of complexity to the
>> review. A few off the top of my head and from the thread discussion:
>>
>> - Headers must be self contained with no outside (i.e. libc, kernel,
>> etc.) header dependencies.
>> - No kernel kconfig option usage
>> - No gcc built-in define usage
>> - No unused items (i.e. externs, structs, etc.)
>> - No macro concatenation
>> - No macros for strings or property names
> 
> Instead of making a bunch of rules about how you can only use a small
> subset of cpp, why not just add a "define name value" command to DTC?

I implemented a patch to do exactly that, and it was rejected because it
only solved part of the problem (named constants) and not the reset (a
completely generic macro language/... within dtc). The argument was that
defining just the named constant syntax on its own without knowing what
the unspecified future macro language will look like might result in the
named constant syntax not fitting into it.

That all said, I now think that using cpp is actually a much better
solution that adding yet more dtc-specific syntax. The *huge* benefit
here is that it allows you to share .h files between *.dts and C code,
so you don't have to write out the same set of #defines once in dtc
syntax and once in cpp syntax.
