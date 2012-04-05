From: David Vrabel <david.vrabel-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] ARM: DT: Add binding for GIC virtualization extentions
 (VGIC)
Date: Thu, 5 Apr 2012 14:15:57 +0100
Message-ID: <4F7D9B0D.7020009@citrix.com>
References: <1333384217-13441-1-git-send-email-marc.zyngier@arm.com>
 <4F7AC138.9020308@citrix.com> <4F7AC8A8.9020606@arm.com>
 <20120403153538.0D1B83E044A@localhost> <4F7D974C.9050506@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4F7D974C.9050506-5wv7dgnIgG8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 05/04/12 13:59, Marc Zyngier wrote:
> 
> How about this?
> 
> 	gic: interrupt-controller@2c001000 {
> 		compatible = "arm,cortex-a15-gic";
> 		#interrupt-cells = <3>;
> 		#address-cells = <1>;
> 		#size-cells = <1>;
> 		interrupt-controller;
> 		reg = <0x2c001000 0x1000>,
> 		      <0x2c002000 0x100>;
> 
> 		vgic@2c004000 {
> 			compatible = "arm,cortex-a15-vgic", "arm,vgic";
> 			reg = <0x2c004000 0x2000>,
> 			      <0x2c006000 0x2000>;
> 			interrupts = <1 9 0xf04>;
> 		};
> 	};
> 
> It cleanly separate the extension from the core GIC, and still make it
> part of the GIC node.

This looks sensible to me.

David
