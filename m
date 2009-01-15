From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [U-Boot] dtc/u-boot tool naming, "ftdump", "mkimage"
Date: Thu, 15 Jan 2009 11:49:19 +1100
Message-ID: <20090115004919.GA26726@yookeroo.seuss>
References: <496E2796.3090405@genesi-usa.com>
	<20090114181028.GB7768@yoda.jdub.homelinux.org>
	<496E3604.8030007@genesi-usa.com> <496E38DA.8080408@ge.com>
	<20090114191905.GA18581@yoda.jdub.homelinux.org>
	<496E849A.8020707@genesi-usa.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <496E849A.8020707-sEEEE4iEDtaXzmuOJsdVMQ@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Matt Sealey <matt-sEEEE4iEDtaXzmuOJsdVMQ@public.gmane.org>
Cc: u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, Jerry Van Baren <gerald.vanbaren-JJi787mZWgc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 14, 2009 at 06:34:34PM -0600, Matt Sealey wrote:
> Josh Boyer wrote:
>
>> David has said before that ftdump is sort of a pointless debugging tool.
>> Or at least that is what the Debian bug report referrenced as the reason
>> from removing it from the Debian dtc package.
>
> As long as you have the original device tree source code to hand. I tend  
> to find that the guy who sent me the device tree and kernel for me to  
> test, has gone to bed and will not be back for 8 to 10 hours. Rather  
> than hang around, on the event that I think it's a device tree problem I  
> tend to ftdump to see what's going on.

Like I said, "dtc -I dtb -O dts" is the non-hacky way to do this.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
