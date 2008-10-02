From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 8/9 V3] Add documentation for the new DTS language.
Date: Thu, 02 Oct 2008 12:22:53 -0500
Message-ID: <48E5036D.9040509@freescale.com>
References: <1222460748-20127-5-git-send-email-jdl@jdl.com>
	<1222460748-20127-6-git-send-email-jdl@jdl.com>
	<1222460748-20127-7-git-send-email-jdl@jdl.com>
	<1222460748-20127-8-git-send-email-jdl@jdl.com>
	<1222460748-20127-9-git-send-email-jdl@jdl.com>
	<20080930145537.GJ18313@secretlab.ca>
	<20081001034656.GF30810@yookeroo.seuss>
	<48E396A3.809@freescale.com>
	<20081002011800.GI25598@yookeroo.seuss>
	<20081002152242.GB22258@ld0162-tx32.am.freescale.net>
	<20081002161150.GA14351@yookeroo.seuss>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <20081002161150.GA14351-787xzQ0H9iRg7VrjXcPTGA@public.gmane.org>
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
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

David Gibson wrote:
> On Thu, Oct 02, 2008 at 10:22:42AM -0500, Scott Wood wrote:
>> On Thu, Oct 02, 2008 at 11:18:00AM +1000, David Gibson wrote:
>>>> I vote against anything similar to the C preprocessor.
>>> Why?
>> It's not nearly as powerful as the semantic approach, and it is
> 
> How so? 

Compare this:

/for/ i in 0..7
	do_something(\i);

to this:

#define DO2SOMETIHNGS DOSOMETHING DOSOMETHING
#define DO4SOMETHINGS DO2SOMETHINGS DO2SOMETHINGS
#define DO8SOMETHINGS DO4SOMETHINGS DO4SOMETHINGS

And if you want the number of somethings to be easily tweakable, you may 
need to do #include/#ifdef recursion.

> If anything I think it's more powerful, because the macro
> boundaries can be anywhere, not only at the edges of particular
> semantic constructs.

Is that useful outside the International Obfuscated DTC Contest?

-Scott
