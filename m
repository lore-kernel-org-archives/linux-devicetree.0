From: Jon Loeliger <jdl-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: DTS language enhancements
Date: Fri, 03 Oct 2008 09:07:53 -0500
Message-ID: <48E62739.8090109@freescale.com>
References: <20081003043710.GH3002@yookeroo.seuss>
	<FB6717CF-EF47-40E1-B972-1E642066D5C6@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
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

Kumar Gala wrote:

>> e.g. /merge/({foo = "abc";}, {bar = <17>;}) == {foo = "abc"; bar=<17>;}
>> (this would recurse down subnodes with identical names)
>>     - get subnode
>> e.g. /getnode/({ subnode { foo = "bar"; }; }, "subnode") ==
>>     { foo = "bar"; }
>>     - get property (result of this is a bytestring, not a
>> node-content expression)
>> e.g. /getprop/({ foo = "bar"; }, "foo") = "bar"
> 
> This is very interesting and seems to address some functionality I've 
> talked to Jon about us needing to modify and update nodes.
> 
> - k

And Kumar, to be fair finish our conversation some more:
I *agreed* that we should get to that level of functionality as well,
and even said we'd work towards having it over time.  But, that we
wanted to make a first step towards a framework with something usable.

Feh.

I am *not* the bad-guy here.  For 3 years folks have been saying
"We need _something_...." and for three years no one did jack shit.
In the Open Source development world, the motto right behing
"post early, post often" is most assuredly "Show me the code".

Well, talk is cheap and proposing a vacuous and arguable something
has always been just that -- arguable.  So I am showing you the code
and giving you something to shoot at.

It's more than anyone else has done on this front.

jdl
