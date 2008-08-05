From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH add immr alias 2/4] powerpc: 5121: Add immr alias
	to	MPC5121 ADS device tree.
Date: Tue, 05 Aug 2008 16:20:52 -0500
Message-ID: <4898C434.4040408@freescale.com>
References: <1217967220-30557-1-git-send-email-jrigby@freescale.com>		<1217967220-30557-2-git-send-email-jrigby@freescale.com>		<fa686aa40808051405j7268c216j8e5b526d6ad526c9@mail.gmail.com>	<fa686aa40808051405j7ea96957t9242e007c93d8e74@mail.gmail.com>
	<4898C34C.5000305@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <4898C34C.5000305-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: John Rigby <jrigby-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

John Rigby wrote:
>    I would like to use mpc83xx_add_bridge for 5121.  This is why I
>    moved it to fsl_pci.c.  It currently uses get_immrbase and adds
>    0x8300 and 0x8304 to it to pass to setup_indirect_pci as the
>    cfg_addr, and cfg_data addresses.
> 
>    I'm more than willing to change mpc83xx_add_bridge to not use
>    get_immrbase.  One simple solution is to pass the cfg_addr and
>    cfg_data addresses in.  If that seems ok then thats what I will do.

We should really be putting those addresses in the "reg" property of the 
PCI node.

-Scott
