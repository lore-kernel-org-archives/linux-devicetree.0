From: Christoffer Dall <christoffer.dall@linaro.org>
Subject: Re: [PATCH] arm: document "mach-virt" platform.
Date: Sun, 2 Feb 2014 20:54:02 -0800
Message-ID: <20140203045402.GA4167@cbox>
References: <1391098262-15944-1-git-send-email-ian.campbell@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1391098262-15944-1-git-send-email-ian.campbell@citrix.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ian Campbell <ian.campbell@citrix.com>
Cc: linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Stefano Stabellini <stefano.stabellini@eu.citrix.com>, Marc Zyngier <marc.zyngier@arm.com>, Will Deacon <will.deacon@arm.com>, Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Kumar Gala <galak@codeaurora.org>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Jan 30, 2014 at 04:11:02PM +0000, Ian Campbell wrote:
> mach-virt has existed for a while but it is not written down what it actually
> consists of. Although it seems a bit unusual to document a binding for an
> entire platform since mach-virt is entirely virtual it is helpful to have
> something to refer to in the absence of a single concrete implementation.
> 
> I've done my best to capture the requirements based on the git log and my
> memory/understanding.

[...]

> 
> +
> +The platform may also provide hypervisor specific functionality
> +(e.g. PV I/O), if it does so then this functionality must be
> +discoverable (directly or indirectly) via device tree.

While this is obviously true, I'm not sure I see the value of this text.

Isn't it more essential to just say that *any* functionality provided to
the platform must be discoverable via device tree?

-Christoffer
