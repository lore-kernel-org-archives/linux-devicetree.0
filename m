From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: DTS language enhancements
Date: Sat, 4 Oct 2008 14:18:41 +1000
Message-ID: <20081004041841.GI30184@yookeroo.seuss>
References: <20081003043710.GH3002@yookeroo.seuss>
	<FB6717CF-EF47-40E1-B972-1E642066D5C6@kernel.crashing.org>
	<48E62739.8090109@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <48E62739.8090109-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Jon Loeliger <jdl-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 03, 2008 at 09:07:53AM -0500, Jon Loeliger wrote:
> Kumar Gala wrote:
>
>>> e.g. /merge/({foo = "abc";}, {bar = <17>;}) == {foo = "abc"; bar=<17>;}
>>> (this would recurse down subnodes with identical names)
>>>     - get subnode
>>> e.g. /getnode/({ subnode { foo = "bar"; }; }, "subnode") ==
>>>     { foo = "bar"; }
>>>     - get property (result of this is a bytestring, not a
>>> node-content expression)
>>> e.g. /getprop/({ foo = "bar"; }, "foo") = "bar"
>>
>> This is very interesting and seems to address some functionality I've  
>> talked to Jon about us needing to modify and update nodes.
>>
>> - k
>
> And Kumar, to be fair finish our conversation some more:
> I *agreed* that we should get to that level of functionality as well,
> and even said we'd work towards having it over time.  But, that we
> wanted to make a first step towards a framework with something usable.
>
> Feh.
>
> I am *not* the bad-guy here.  For 3 years folks have been saying
> "We need _something_...." and for three years no one did jack shit.

That's not entirely true.  I certainly should have been more public
about what I had, but I'm no guiltier than you.

> In the Open Source development world, the motto right behing
> "post early, post often" is most assuredly "Show me the code".
>
> Well, talk is cheap and proposing a vacuous and arguable something
> has always been just that -- arguable.  So I am showing you the code
> and giving you something to shoot at.
>
> It's more than anyone else has done on this front.

Bear in mind that when I posted my expression support patch, I thought
*that* was more than anyone else had done at the time.  And since I
got no response, not even a "I have something else in my tree I've
been working on" I continued to think so for some weeks until you
posted your series.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
