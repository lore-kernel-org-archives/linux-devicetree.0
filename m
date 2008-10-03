From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: DTS language enhancements
Date: Fri, 3 Oct 2008 15:29:42 +1000
Message-ID: <20081003052942.GJ3002@yookeroo.seuss>
References: <20081003043710.GH3002@yookeroo.seuss>
	<FB6717CF-EF47-40E1-B972-1E642066D5C6@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <FB6717CF-EF47-40E1-B972-1E642066D5C6-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 03, 2008 at 12:08:54AM -0500, Kumar Gala wrote:
>
> On Oct 2, 2008, at 11:37 PM, David Gibson wrote:
>
>> Node-content expressions
>> ------------------------
>>
>> Literals are node definitions in the current format:
>> 	{
>> 		prop = <bytestring expression>;
>> 		somesubnode@whatever <node content expression>;
>> 	}
>>
>> ?: would also be supported here (again, first argument integer, second
>> and third are node-content).
>>
>> I'm less sure what other operators we'll need here - probably need to
>> build these based on actual usage examples.  Likely candidates,
>> however are:
>> 	- set property
>> e.g. /setprop/({ }, "reg", < 17 >) == { reg = < 17 >; }
>> 	- remove property
>> e.g. /delprop({ reg = <17>; }, "reg") == { }
>> 	- add subnode
>> e.g. /addnode/({ }, "subnode@17", {reg = <17>;}) ==
>> 	{ subnode@17 { reg = <17>; }; }
>> 	- merge
>
> should we have /delnode/

Ah, yeah, I guess so, if we've got the rest.  Possibly they should be
called /graft/ and /prune/ instead of /addnode/ and /delnode/ to
emphasise the fact that they may be handling whole subtrees.

>> e.g. /merge/({foo = "abc";}, {bar = <17>;}) == {foo = "abc";  
>> bar=<17>;}
>> (this would recurse down subnodes with identical names)
>> 	- get subnode
>> e.g. /getnode/({ subnode { foo = "bar"; }; }, "subnode") ==
>> 	{ foo = "bar"; }
>> 	- get property (result of this is a bytestring, not a
>> node-content expression)
>> e.g. /getprop/({ foo = "bar"; }, "foo") = "bar"
>
> This is very interesting and seems to address some functionality I've  
> talked to Jon about us needing to modify and update nodes.

Yeah, well, this is kind of my point.  I'm pretty sure we'll need this
stuff regardless of whether we use preprocessing or post-evaluation;
and once we have these sorts of operators, I'm not sure that
post-evaluation will actually buy us much.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
