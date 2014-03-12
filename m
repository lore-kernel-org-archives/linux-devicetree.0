From: Santosh Shilimkar <santosh.shilimkar@ti.com>
Subject: Re: [PATCH] arm: boot: dts: build keystone devicetree blob
Date: Thu, 13 Mar 2014 00:35:41 +0800
Message-ID: <53208CDD.7030106@ti.com>
References: <1394639330-1288-1-git-send-email-balbi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1394639330-1288-1-git-send-email-balbi@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <balbi@ti.com>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: linux@arm.linux.org.uk, devicetree@vger.kernel.org, Linux ARM Kernel Mailing List <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 12 March 2014 11:48 PM, Felipe Balbi wrote:
> Currently, even when building keystone only
> kernel builds, DTB won't get build because
> we lack a Makefile rule to get it compiled.
> 
> This patch adds that rule so mainline kernel
> users have a chance to use up-to-date DTB on
> keystone 2 platforms.
> 
> Signed-off-by: Felipe Balbi <balbi@ti.com>
> ---
>
We have been building dtbs with explicit command
instead of dtbs since it was just one dtb so far
supported. Was planning to add the rule once more
boards get added. Now with Lamarr and Edision in
for next merge window, will do that post 3.15-rc1.

> note that I just tried this on top of linux-next
> (commit 69d5cdda16b3c9767b82d80b07edb9bb056448e3)
> and, even though dtb builds fine, I still couldn't
> get keystone_defconfig uImage to boot fine.
> 
> It's probably my LOADADDR which is wrong.
> 
> Santosh, what's the LOADADDR I should be using
> for keystone boots ?
>
LOADADDR is same 0x80008000. You might have missed
to configure the environment u-boot variable to
disable higher address space switch.
'setenv mem_lpae 0'. Also ensure to update
the boot loaders since the default ones comes with
EVM are long back outdated.

Regards,
Santosh
 
