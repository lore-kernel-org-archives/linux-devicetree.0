From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 3/8] Enhance source position implementation.
Date: Wed, 24 Sep 2008 12:21:06 -0500
Message-ID: <48DA7702.9040801@freescale.com>
References: <1222196652-13811-1-git-send-email-jdl@jdl.com>	
	<1222196652-13811-2-git-send-email-jdl@jdl.com>	
	<1222196652-13811-3-git-send-email-jdl@jdl.com>	
	<1222196652-13811-4-git-send-email-jdl@jdl.com>	
	<48DA73DA.5000603@freescale.com>
	<1222276655.11692.18.camel@ld0161-tx32>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <1222276655.11692.18.camel@ld0161-tx32>
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

Jon Loeliger wrote:
> On Wed, 2008-09-24 at 12:07 -0500, Scott Wood wrote:
>>  are there cases where reporting the 
>> line/column of the first character of the token is not clear?
> 
> Yes.

I was hoping for an example. :-)

> Well, it was really a more general formatting routine.

We already have *printf().

> It may not always directly be output directly to a FILE.
> 
> So, maybe there is some room for improvement or optimization
> in the future...

There's also room for generalization in the future.

-Scott
