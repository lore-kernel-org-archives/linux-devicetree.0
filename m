From: Jon Loeliger <jdl-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [2/5] dtc: Use flex's YY_USER_ACTION feature to avoid
	code	duplication
Date: Fri, 03 Oct 2008 09:17:53 -0500
Message-ID: <48E62991.6010102@freescale.com>
References: <20081002140427.GD11662@yookeroo.seuss>
	<20081002140512.GE11662@yookeroo.seuss>
	<20081002140556.GF11662@yookeroo.seuss>
	<1222964727.9242.10.camel@ld0161-tx32>
	<20081003010531.GE3002@yookeroo.seuss>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <20081003010531.GE3002-787xzQ0H9iRg7VrjXcPTGA@public.gmane.org>
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
> On Thu, Oct 02, 2008 at 11:25:27AM -0500, Jon Loeliger wrote:
>> On Fri, 2008-10-03 at 00:05 +1000, David Gibson wrote:
>>> Current, every lexer rule starts with some boiler plate to update the
>>> yylloc value for use by the parser.  One of the rules, even mistakenly
>>> has a redundant allocation to one of the members.
>>>
>>> This patch uses the flex YY_USER_ACTION macro hook, which is executed
>>> before every rule to avoid this duplication.
>>>
>>> Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
>>>
>>> ---
>> This, and the xstrdup() change are both excellent suggestions.
> 
> Ok, so lets apply them, clearing a bit more muck out of the way to
> focus on the new language stuff.
> 
> But does this imply you don't like the rest of the series?
> 

Dave,

You need to interpret less and quit trying to out-guess people.
I for one just don't like it.

Here's what I'm doing right now.

First, I buy the YY_USER_ACTION patch entirely.  I've refactored
it to apply to my branch to verify that it works with my code as well.

So I am going to apply it to the *current* master branch and
rebase my stuff on to it to bring it forward through my patches.
Then, as you say, we'll clear some muck.

Second, I buy the desire for strdup() -> xstrdup().  However, I
am not going to put xstrdup() into srcpos.c.  No way, not no how.
So I am going to introduce utiil.[ch] or so.  And to get it into
the convert tool, I am first going to refactor the Makfile.

Finally, I've not entirely read through and understood some of
the parts of the rest of your series yet.  There are definitely
parts that I'd like to pick up, and yet there are parts that I
am not sure about yet.  I need to re-read and understand it more.

In the meantime, I'm going to make further progress on cleaning
up "the muck".

Thanks,
jdl
