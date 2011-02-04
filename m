From: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [PATCH TIP 03/14] x86/dtb: Add a device tree for CE4100
Date: Fri, 04 Feb 2011 10:40:26 +0100
Message-ID: <4D4BC98A.1090006@linutronix.de>
References: <1295843342-1122-1-git-send-email-bigeasy@linutronix.de>	<1295843342-1122-4-git-send-email-bigeasy@linutronix.de>	<20110127050027.GB23443@yookeroo>	<20110127091147.GA9770@www.tglx.de>
	<20110203205928.GH6180@angua.secretlab.ca>
	<4D4B1EFD.4060305@firmworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4D4B1EFD.4060305-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Cc: sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Mitch Bradley wrote:

> The text representation is "D,F" , where D is the hexadecimal ASCII 
> representation of the binary number ddddd and F is the hexadecimal ASCII 
> representation of the binary number fff .  So "show-devs" will display 
> names like  "/pci/ethernet@12,e" - device number 0x12, function number 0xe.

[snip more of it]

> I don't know how this plays out in the flattened DT world, but the above 
> is a summary of what the PCI bus binding stipulates.

Thanks for clearing it up. After David pointed it out I looked it up in
the PCI spec and it seems to match what you saying here.

Sebastian
