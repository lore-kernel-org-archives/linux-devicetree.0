From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v2 07/19] tegra: fdt: Add LCD definitions for
	Tegra
Date: Thu, 14 Jun 2012 17:32:45 -0600
Message-ID: <4FDA749D.2030201@wwwdotorg.org>
References: <1339604395-6621-1-git-send-email-sjg@chromium.org>
	<1339604395-6621-8-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <1339604395-6621-8-git-send-email-sjg@chromium.org>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, U-Boot Mailing List <u-boot@lists.denx.de>, Jerry Van Baren <vanbaren@cideas.com>, Tom Warren <twarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

On 06/13/2012 10:19 AM, Simon Glass wrote:
> Add LCD definitions and also a proposed binding for LCD displays.
> 
> The PWFM is in progress on the device-tree-discuss list, so only a
> very basic binding is offered here.

I believe we have settled on a final representation, it just hasn't been
added into linux-next yet. See:

http://gitorious.org/linux-pwm/linux-pwm/commit/d3ce73e5dc86646a6302f2b0f7dd40e8c552fa04

> I am not sure if it is better to have the lcd within the display
> controller as with i2c/spi, or a separate node. From a hardware point
> of view the LCD is certainly connected to the display controller, so
> perhaps this version makes most sense. We could have a stand-alone
> top-level lcd node with a phandle pointing to the display controller,
> but these doesn't seem to be an obvious advantage to that approach.

Equally, there's been extensive discussion re: how to represent the
NVIDIA display controller in DT. I strongly believe that U-Boot
shouldn't go ahead in isolation with a binding that's completely
unrelated to what's happening in the kernel. Please can you take what
Thierry is working on for the kernel, and/or contribute to that binding
etc., so we don't end up with multiple ways of doing the same thing.
Part of the whole point of DT is to have a single way of representing HW
that multiple OSs (or perhaps bootloaders) cna use. If everyone just
goes and does their own thing, we've lost.
