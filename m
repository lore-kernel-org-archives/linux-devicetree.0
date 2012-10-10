From: Warner Losh <imp-uzTCJ5RojNnQT0dZR+AlfA@public.gmane.org>
Subject: Re: dtc: import latest upstream dtc
Date: Wed, 10 Oct 2012 08:41:45 -0600
Message-ID: <0E46FFF5-4500-47D6-8CEA-FA252D87E585@bsdimp.com>
References: <1349827466.26044.16@snotra>
 <ADE80D65-5170-4A8E-8D90-29161F8DB3BB@bsdimp.com>
 <20121010072401.GA28467@truffula.fritz.box>
Mime-Version: 1.0 (Apple Message framework v1084)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20121010072401.GA28467-W9XWwYn+TF0XU02nzanrWNbf9cGiqdzd@public.gmane.org>
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
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Michal Marek <mmarek-AlSwsSmVLrQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


On Oct 10, 2012, at 1:24 AM, David Gibson wrote:

> On Tue, Oct 09, 2012 at 10:43:50PM -0600, Warner Losh wrote:
>> 
>> On Oct 9, 2012, at 6:04 PM, Scott Wood wrote:
>> 
>>> On 10/09/2012 06:20:53 PM, Mitch Bradley wrote:
>>>> On 10/9/2012 11:16 AM, Stephen Warren wrote:
>>>>> On 10/01/2012 12:39 PM, Jon Loeliger wrote:
>>>>>>> 
>>>>>>> What more do you think needs discussion re: dtc+cpp?
>>>>>> 
>>>>>> How not to abuse the ever-loving shit out of it? :-)
>>>>> 
>>>>> Perhaps we can just handle this through the regular patch review
>>>>> process; I think it may be difficult to define and agree upon exactly
>>>>> what "abuse" means ahead of time, but it's probably going to be easy
>>>>> enough to recognize it when one sees it?
>>>> One of the ways it could get out of hand would be via "include
>>>> dependency hell".  People will be tempted to reuse existing .h files
>>>> containing pin definitions, which, if history is a guide, will end up
>>>> depending on all sorts of other .h files.
>>>> Another problem I often face with symbolic names is the difficulty of
>>>> figuring out what the numerical values really are (for debugging),
>>>> especially when .h files are in different subtrees from the files that
>>>> use the definitions, and when they use multiple macro levels and fancy
>>>> features like concatenation.  Sometimes I think it's clearer just to
>>>> write the number and use a comment to say what it is.
>>> 
>>> Both comments apply just as well to ordinary C code, and I don't think anyone would seriously suggest just using comments instead for C code.
>> 
>> .h files include both structs and defines, which are fine for
>> ordinary C code, but problematic in this context.
> 
> Right, cpp should be invoked with similar options to the way it's done
> for asm files which have the same problem.  I'm not sure if the
> current patch does so.

I know the current dtc code is very careful to license itself in a very agnostic way.  Would including files, possibly from the Linux kernel, pose any kind of license issue?  Or does the fact that many (but not all) .dts files being apparently licensed GPL already make this a moot point?  Or does it not matter since this is an interface and declaration of information, which likely isn't creative enough to receive to copyright protection....  Or is this a can of worms best avoided :)

Warner
