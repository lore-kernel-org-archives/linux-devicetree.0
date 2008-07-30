From: Jon Loeliger <jdl-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [Fwd: Re: [U-Boot-Users] using a flat device tree to drive	u-boot
	config]
Date: Wed, 30 Jul 2008 16:15:06 -0500
Message-ID: <4890D9DA.1010603@freescale.com>
References: <488F28BF.6030902@freescale.com>
	<20080730011908.GB19216@yookeroo.seuss>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <20080730011908.GB19216-787xzQ0H9iRg7VrjXcPTGA@public.gmane.org>
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

> Heh, I guess with the new dtc release out, I should have a serious
> look at getting the long-mooted expression support ready to merge.
> 


Well, I'm likely to work in this direction too.

I think one of the first things that we might do
is to convert the DTC to a two pass tool where the
first pass just parses and creates an internal node
structure, and the second pass traverses it writing
it out.

jdl
