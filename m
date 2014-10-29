From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 10/11] irqchip: bcm7120-l2: Extend driver to support 64+ bit controllers
Date: Wed, 29 Oct 2014 08:53:38 +0100
Message-ID: <7518897.LmfE2WsusV@wuerfel>
References: <1414555138-6500-1-git-send-email-cernekee@gmail.com> <1414555138-6500-10-git-send-email-cernekee@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1414555138-6500-10-git-send-email-cernekee@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Cernekee <cernekee@gmail.com>
Cc: f.fainelli@gmail.com, tglx@linutronix.de, jason@lakedaemon.net, ralf@linux-mips.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mbizon@freebox.fr, jogo@openwrt.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

On Tuesday 28 October 2014 20:58:57 Kevin Cernekee wrote:
> Most implementations of the bcm7120-l2 controller only have a single
> 32-bit enable word + 32-bit status word.  But some instances have added
> more enable/status pairs in order to support 64+ IRQs (which are all
> ORed into one parent IRQ input).  Make the following changes to allow
> the driver to support this:
> 
>  - Extend DT bindings so that multiple words can be specified for the
>    reg property, various masks, etc.
> 
>  - Add loops to the probe/handle functions to deal with each word
>    separately
> 
>  - Allocate 1 generic-chip for every 32 IRQs, so we can still use the
>    clr/set helper functions
> 
>  - Update the documentation
> 
> Signed-off-by: Kevin Cernekee <cernekee@gmail.com>

You should probably specify a 'big-endian' DT property for the driver
to check. If you have both LE and BE versions of this device, we
must make sure that we use the correct accessors.

As long as we don't need to build a kernel that supports both (if
I understand you correctly, the ARM SoCs use a LE instance of this
device, while the MIPS SoCs use a BE version) you can still decide
at compile-time which one you want, but please add the runtime check
now, so if we ever get a new combination we can handle it at runtime
with a more complex driver implementation.

If I read your code right, you have decided to use one IRQ domain
per register set, rather than one domain for all of them. I don't
know which of the two ways is better here, but it would be good if
you could explain in the patch description why you did it like this.

	Arnd
