From: Nathan Fontenot <nfont-V7BBcbaFuwjMbYB6QlFGEg@public.gmane.org>
Subject: Re: [PATCH 0/4] Merge OF dynamic patches
Date: Wed, 18 Nov 2009 14:16:03 -0600
Message-ID: <4B045603.5060801@austin.ibm.com>
References: <4B030FC2.9070401@austin.ibm.com>
	<20091118104147.GD5166@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20091118104147.GD5166-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Wolfram Sang wrote:
> On Tue, Nov 17, 2009 at 03:04:02PM -0600, Nathan Fontenot wrote:
>> This set of patches merges the common dynamic device tree
>> updating routines of_attach_node() and of_detach_node() to
>> drivers/of/of_dynamic.c.
>>
>> Built and tested on powerpc, I have no access to build/test
>> this on microblaze.
> 
> They look good, but I can't test them as they don't apply to test-devicetree.
> On which commit are they based?

I meant to base these on the test-devicetree branch but it appears that I did
not checkout the test-devicetree branch after cloning.  I will rebase the patches
against the test-devicetree branch and re-send.

> 
> It would be nice if you could also add a diffstat to every patch, this makes
> reviewing 'move-around'-patches a bit easier.

will do.

-Nathan Fontenot
