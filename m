From: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Subject: Re: [RFC] More compatibles or more quirk properties
Date: Thu, 05 Mar 2009 21:32:38 -1000
Message-ID: <49B0D196.7080207@firmworks.com>
References: <3A45394FD742FA419B760BB8D398F9ED29E274@zch01exm26.fsl.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <3A45394FD742FA419B760BB8D398F9ED29E274-bKEhWGtIRUJ4Lp7cDGe+DVjVikpgYyvb5NbjCUgZEJk@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Li Yang-R58472 <LeoLi-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

>
> I'm running into a dilemma choosing between two approaches of defining device tree binding.  Let's say if we have several chips with a similar SoC block, but each of them have different quirks.  If I define different compatibles for each of the chips, the driver will have a longer match table and thus bloat the device matching process.  Or we can use a same compatible for all of them and  define properties for each of the quirks.  But it somewha
Properties to describe quirks precisely are definitely better.  In fact, 
that's fundamental principle - describe the situation, don't infer a 
bunch of details from a name.
