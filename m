From: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Subject: Re: dtc: import latest upstream dtc
Date: Wed, 10 Oct 2012 08:23:29 -1000
Message-ID: <5075BD21.2070106@firmworks.com>
References: <1348867559-2495-1-git-send-email-swarren@wwwdotorg.org>
 <5069C042.40209@gmail.com> <5069C11C.6040505@wwwdotorg.org>
 <5069D946.1060502@gmail.com> <5069E1F0.5070902@wwwdotorg.org>
 <E1TIktZ-0000U4-Qh@jdl.com> <50749441.8030307@wwwdotorg.org>
 <5075ABB8.103@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <5075ABB8.103-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Michal Marek <mmarek-AlSwsSmVLrQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/10/2012 7:09 AM, Rob Herring wrote:
> On 10/09/2012 04:16 PM, Stephen Warren wrote:
>> On 10/01/2012 12:39 PM, Jon Loeliger wrote:
>>>>
>>>> What more do you think needs discussion re: dtc+cpp?
>>>
>>> How not to abuse the ever-loving shit out of it? :-)
>>
>> Perhaps we can just handle this through the regular patch review
>> process; I think it may be difficult to define and agree upon exactly
>> what "abuse" means ahead of time, but it's probably going to be easy
>> enough to recognize it when one sees it?
> 
> Rather than repeating things over and over in reviews, we should
> document at least rules we can easily agree on and then add to it when
> people get "creative." Also, I can't keep up with every single binding
> review as is, and this could just add another level of complexity to the
> review. A few off the top of my head and from the thread discussion:
> 
> - Headers must be self contained with no outside (i.e. libc, kernel,
> etc.) header dependencies.
> - No kernel kconfig option usage
> - No gcc built-in define usage
> - No unused items (i.e. externs, structs, etc.)
> - No macro concatenation
> - No macros for strings or property names

Instead of making a bunch of rules about how you can only use a small
subset of cpp, why not just add a "define name value" command to DTC?

One of the things I like least about C is that the language itself is
incomplete; in order to actually program in C, you have to deal with not
only with the C syntactic structure, but also cpp, with its different
rules, and also make, with fundamentally different linguistic structure,
and then you end up wrapping that in something like KConfig, with yet
another linguistic framework, and the makefile contains embedded shell
commands, which is yet another syntax.

Rather than open Pandora's box by grafting on cpp, why not solve the
actual problem?


> 
> Do we further restrict things to say defines are only numbers? One could
> start to define complex macros to build the nodes themselves. If each
> platform does this slightly differently, it will become difficult to
> review and maintain. Then we will be doing dts consolidation. The fact
> that we have some fixed structure and each SOC is not free to do things
> their own way makes things easier to maintain. You don't have that in
> the kernel across platforms. For example, look how register defines and
> static mappings or platform device creation are done. They are all
> similar, but yet slightly different. That makes doing changes across
> platforms more difficult.
> 
>> I imagine the most common usage will simply be a bunch of:
>>
>> #define TEGRA_GPIO_PB0 32
>> #define TEGRA_GPIO_INT_LEVEL_LOW 8
>>
>> / {
>>     xxx {
>>         interrupts = <TEGRA_GPIO_PB0 TEGRA_GPIO_INT_LEVEL_LOW>;
>>
>> and similarly, simple math:
>>
>>     something = <((FOO << XXX_SHIFT) | (BAR << YYY_SHIFT))>;
>>
> 
> These are all perfectly fine and sane use, but if we don't restrict
> things then the next step is this:
> 
> #define PROP_SOMETHING(v) (something = <(v)>)
> 
> Rob
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
> 
