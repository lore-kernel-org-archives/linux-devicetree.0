From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: DTS language enhancements
Date: Tue, 07 Oct 2008 11:46:41 -0500
Message-ID: <48EB9271.2010801@freescale.com>
References: <20081003043710.GH3002@yookeroo.seuss>
	<20081006170601.GA31967@ld0162-tx32.am.freescale.net>
	<20081007014103.GA23135@yookeroo.seuss>
	<20081007041725.GD19037@yookeroo.seuss>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <20081007041725.GD19037-787xzQ0H9iRg7VrjXcPTGA@public.gmane.org>
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
> Oh, just remembered the more precise reason why this is the case.  By
> the time we get to the parser, whitespace and comments have
> disappeared entirely, which means they'd be ignored *in the midst* of
> node property names under this proposal, which is just not nice.
> 
> It's technically possible to recognize whitespace at the parser level
> instead, but it makes the grammar hideous.

Ah, right, that'd be unpleasant.  I think it could be done with a little 
less ugliness than fully recognizing whitespace in the parser (have the 
lexer set a flag on relevant tokens if the previous character was 
whitespace or a comment, and have the parser rule that glues the 
propnodename together check the flag and raise an error if set), but 
that's still uglier than the propnodename-after-opening-brace approach.

-Scott
