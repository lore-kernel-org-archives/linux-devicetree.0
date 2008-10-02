From: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: The new DTS language enhancements
Date: Wed, 1 Oct 2008 22:45:16 -0500
Message-ID: <11973616-0AA9-4CA4-BC12-7B896DDF533C@kernel.crashing.org>
References: <1222889827.28471.3.camel@ld0161-tx32>
	<3643ED8C-2AED-405A-8C7E-432FB311DE6A@kernel.crashing.org>
	<fa686aa40810011551w7250a5cdoc0d928456ea34d3b@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v929.2)
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <fa686aa40810011551w7250a5cdoc0d928456ea34d3b-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On Oct 1, 2008, at 5:51 PM, Grant Likely wrote:

> On Wed, Oct 1, 2008 at 3:11 PM, Kumar Gala  
> <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> wrote:
>>
>> On Oct 1, 2008, at 2:37 PM, Jon Loeliger wrote:
>>
>>> Folks,
>>>
>>> We have had some internal discussion inside Freescale
>>> about my proposed DTS language enhancements now.
>>> We feel that we have significant need for this approach,
>>> and in the absence of a solid alternate proposal,
>>> we would like to move forward with it.
>>
>> I agree with Jon here... if people aren't going to have useful  
>> comments on
>> what changes need to be made to Jon's work we'd (Freescale) like to  
>> see a
>> dtc-2.0 with these changes and getting those changes into the  
>> kernel for
>> 2.6.28.
>
> Jon's changes are non-trivial and have long lasting implications.
> First posting of the changes was made on Sept 23, just over a week
> ago.  Jon told me about the new design only a month ago.  Not a lot of
> time.
>
> This is not the same as adding a new driver or supporting a new SoC.
> The consequences have considerable broader reach.  Time must be
> allowed for us to mull over the design.
>
> Merging for 2.6.28 is too aggressive.
>
> I appreciate that you're frustrated with the lack of alternate
> proposals, but there hasn't been enough time yet.

I understand the short window, but if there isn't useful feedback what  
is one to do?  Just saying I don't like your solution and leaving at  
this isn't productive.  I'm all for getting this done right, but we  
need constructive feedback.

There are clearly some high level differences of opinions.  The only  
way I see of addressing those is by who is putting up code to address  
the problem versus not.. Jon's proposed a solution.. if no one else is  
(I know David's mentioned he's working on something) than it seems  
that wins by defacto.

I think David should be more transparent on what's he doing/thinking  
so we all can discuss it rather than us not knowing if/when he might  
produce something (and I've respond in such to him).

- k
