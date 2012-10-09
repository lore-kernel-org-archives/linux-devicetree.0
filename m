From: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Subject: Re: dtc: import latest upstream dtc
Date: Tue, 09 Oct 2012 13:20:53 -1000
Message-ID: <5074B155.4090703@firmworks.com>
References: <1348867559-2495-1-git-send-email-swarren@wwwdotorg.org>
 <5069C042.40209@gmail.com> <5069C11C.6040505@wwwdotorg.org>
 <5069D946.1060502@gmail.com> <5069E1F0.5070902@wwwdotorg.org>
 <E1TIktZ-0000U4-Qh@jdl.com> <50749441.8030307@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <50749441.8030307-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
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
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Michal Marek <mmarek-AlSwsSmVLrQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/9/2012 11:16 AM, Stephen Warren wrote:
> On 10/01/2012 12:39 PM, Jon Loeliger wrote:
>>>
>>> What more do you think needs discussion re: dtc+cpp?
>>
>> How not to abuse the ever-loving shit out of it? :-)
> 
> Perhaps we can just handle this through the regular patch review
> process; I think it may be difficult to define and agree upon exactly
> what "abuse" means ahead of time, but it's probably going to be easy
> enough to recognize it when one sees it?


One of the ways it could get out of hand would be via "include
dependency hell".  People will be tempted to reuse existing .h files
containing pin definitions, which, if history is a guide, will end up
depending on all sorts of other .h files.

Another problem I often face with symbolic names is the difficulty of
figuring out what the numerical values really are (for debugging),
especially when .h files are in different subtrees from the files that
use the definitions, and when they use multiple macro levels and fancy
features like concatenation.  Sometimes I think it's clearer just to
write the number and use a comment to say what it is.


> 
> I imagine the most common usage will simply be a bunch of:
> 
> #define TEGRA_GPIO_PB0 32
> #define TEGRA_GPIO_INT_LEVEL_LOW 8
> 
> / {
>     xxx {
>         interrupts = <TEGRA_GPIO_PB0 TEGRA_GPIO_INT_LEVEL_LOW>;
> 
> and similarly, simple math:
> 
>     something = <((FOO << XXX_SHIFT) | (BAR << YYY_SHIFT))>;
> 
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
> 
