From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 0/8] Implement a new DTS Source Language
Date: Thu, 25 Sep 2008 10:25:07 -0500
Message-ID: <48DBAD53.7090201@freescale.com>
References: <1222196652-13811-1-git-send-email-jdl@jdl.com>	<097BFF8D-317F-4E85-AC2A-4C0A8D6C608B@kernel.crashing.org>	<1222275105.11692.9.camel@ld0161-tx32>
	<20080925042613.GJ15169@yookeroo.seuss>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <20080925042613.GJ15169-787xzQ0H9iRg7VrjXcPTGA@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

David Gibson wrote:
>> /define/ make_cpu(\cpu)
> 
> Eck.  The \identified parameters certainly seem to violate the
> look-like-C principle.

It's to disambiguate from existing doesn't-look-like-C constructs 
(property and node definitions), though it's not really needed in this 
context.

>> {
>> 		device_type = "cpu";
>> 		reg = < (\cpu) >;
> 
> So.. in the node name the \cpu parameter is treated as a string, here
> it's treated as a number.  What makes the difference?  Does the %
> operator implicitly convert?

Yes, it implicitly converts.

> Can you define multiple nodes with one
> function.  Can you define properties only with a function?

Yes to both.

>> 			for \i in 0 .. 3 {
> 
> This would seem to be another violation of the look-like-C principle.

I don't think we particularly need to inherit C's warts.

> This for syntax is pretty much unprecedented.

It's similar to Python, albeit with less flexibility (I suggested to Jon 
that we introduce a "set" construct to remedy this).

-Scott
