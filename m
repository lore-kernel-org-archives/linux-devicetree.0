From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] Fix an overflow case in fdt_offset_ptr() detected by
	GCC 4.3.
Date: Tue, 30 Sep 2008 11:28:18 -0500
Message-ID: <48E253A2.1090702@freescale.com>
References: <1222358537.25112.7.camel@ld0161-tx32>
	<E1KkQ3b-0000uT-6H@jdl.com>	<20080930011525.GB6189@yookeroo.seuss>
	<E1KkUOE-0001OX-EF@jdl.com> <20080930023934.GB8939@yookeroo.seuss>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <20080930023934.GB8939-787xzQ0H9iRg7VrjXcPTGA@public.gmane.org>
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
Cc: devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, Stephen Papacharalambous <SteveP-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

David Gibson wrote:
> On Mon, Sep 29, 2008 at 08:51:02PM -0500, Jon Loeliger wrote:
>>> On Mon, Sep 29, 2008 at 04:13:27PM -0500, Jon Loeliger wrote:
>>> Uh.. Jon.. did you see my reply to this.  I'm not at all convinced
>>> this patches a real problem.  I suspect it's just replacing a problem
>>> that gcc could detect with a similar one that gcc can't (and for which
>>> we already had a test to deal with, anyway).
>> I saw your reply, and you are welcome to read up
>> on the fist fight over in GCC land too.
>>
>> In the meantime, it fixes a real problem that we
>> have at Freescale.
> 
> Ok.. and can you explain this real problem?
> 
> If this is just to work around a silly gcc warning that appears in
> some circumstances and not others, that's fine, but the commit message
> should say so.

It seems that the C standard says that signed overflow is undefined, but 
not unsigned overflow.  Presumably that was to accomodate 
non-twos-complement machines (which we don't really care about), but GCC 
abuses it to completely optimize away any paths that depend on such 
overflow, and the fact that they had to add a warning about it didn't 
strike them as a reason why they should maybe not go ahead with such an 
optimization by default, even if it's permitted by the spec.

-Scott
