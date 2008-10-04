From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [2/5] dtc: Use flex's YY_USER_ACTION feature to avoid code
	duplication
Date: Sat, 4 Oct 2008 14:13:07 +1000
Message-ID: <20081004041307.GH30184@yookeroo.seuss>
References: <20081002140427.GD11662@yookeroo.seuss>
	<20081002140512.GE11662@yookeroo.seuss>
	<20081002140556.GF11662@yookeroo.seuss>
	<1222964727.9242.10.camel@ld0161-tx32>
	<20081003010531.GE3002@yookeroo.seuss>
	<48E62991.6010102@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <48E62991.6010102-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
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

On Fri, Oct 03, 2008 at 09:17:53AM -0500, Jon Loeliger wrote:
> David Gibson wrote:
>> On Thu, Oct 02, 2008 at 11:25:27AM -0500, Jon Loeliger wrote:
>>> On Fri, 2008-10-03 at 00:05 +1000, David Gibson wrote:
>>>> Current, every lexer rule starts with some boiler plate to update the
>>>> yylloc value for use by the parser.  One of the rules, even mistakenly
>>>> has a redundant allocation to one of the members.
>>>>
>>>> This patch uses the flex YY_USER_ACTION macro hook, which is executed
>>>> before every rule to avoid this duplication.
>>>>
>>>> Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
>>>>
>>>> ---
>>> This, and the xstrdup() change are both excellent suggestions.
>>
>> Ok, so lets apply them, clearing a bit more muck out of the way to
>> focus on the new language stuff.
>>
>> But does this imply you don't like the rest of the series?
>
> Dave,
>
> You need to interpret less and quit trying to out-guess people.
> I for one just don't like it.

Ok, my apologies.  I'm aware that I've been impatient and rude.

But, this language thing has become urgent with very little notice;
you're not the only one with other things to work on too.  I think
both in implementation and especially in language design your current
patch series had not had sufficient thought and polish yet, and seeing
people gung-ho about merging ugliness into a project I have such a
stake in makes me quite upset.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
