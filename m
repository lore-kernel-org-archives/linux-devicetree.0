From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] Add initial SX3000b platform code to MIPS arch
Date: Wed, 22 Mar 2017 09:09:38 +0000
Message-ID: <68b3b5ff-f03d-61ca-ddb9-0f6038360a88@arm.com>
References: <AM4PR0201MB2179B0EE9D0C00461C999697E43C0@AM4PR0201MB2179.eurprd02.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AM4PR0201MB2179B0EE9D0C00461C999697E43C0-jNhaPLMSWHGuGPaJ3yMUg+mQVOPts17knBOFsp37pqbUKgpGm//BTAC/G2K4zDHf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Amit Kama IL <Amit.Kama-Q/c1bGB+/R9BDgjK7y7TUQ@public.gmane.org>, "ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org" <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org" <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, "tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org" <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, "jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org" <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "corbet-T1hC0tSOHrs@public.gmane.org" <corbet-T1hC0tSOHrs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Amit,

On 22/03/17 05:38, Amit Kama IL wrote:
> Add initial support for boards based on Satixfy's SX3000b (Catniss) SoC.
> The SoC includes a MIPS interAptiv dual core 4 VPE processor and boots 
> using device-tree.
> 
> Signed-off-by: Amit Kama <amit.kama-ClUhi80AV6VBDgjK7y7TUQ@public.gmane.org>
> 
> The irqchip file (irq-sx3000b.c) is pertinent to the platform. 
> IRQCHIP maintainers - is it possible to merge this through MIPS tree? 

Can you please send something that is the result of "git format-patch"?
You should have a diff-stat before the patch itself...

Also, this file (irq-sx3000b.c) doesn't seem to be in this huge patch,
which doesn't seem to concern the irqchip subsystem (it all looks
platform code to me). Wrong patch?

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
