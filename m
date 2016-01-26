From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH 2/3] of: MSI: Simplify irqdomain lookup
Date: Tue, 26 Jan 2016 16:33:38 +0100
Message-ID: <20160126163338.1652dbe4@free-electrons.com>
References: <1453816347-32720-1-git-send-email-marc.zyngier@arm.com>
	<1453816347-32720-3-git-send-email-marc.zyngier@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1453816347-32720-3-git-send-email-marc.zyngier@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jiang Liu <jiang.liu@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Dear Marc Zyngier,

On Tue, 26 Jan 2016 13:52:26 +0000, Marc Zyngier wrote:
> So far, when trying to associate a device with its MSI domain,
> we first lookup the domain using a MSI token, and if this
> doesn't return anything useful, we pick up any domain matching
> the same node.
> 
> This logic is broken for two reasons:
> 1) Only the generic MSI code (PCI or platform) sets this token
>    to PCI/MSI or platform MSI. So we're guaranteed that if there
>    is something to be found, we will find it with the first call.
> 2) If we have a convoluted situation where:
>    - a single node implements both wired and MSI interrupts
>    - MSI support for that HW hasn't been compiled in
>    we'll end up using the wired domain for MSIs anyway, and things
>    break badly.
> 
> So let's just remove __of_get_msi_domain, and replace it by a direct
> call to irq_find_matching_host, because that's what we really want.
> 
> Signed-off-by: Marc Zyngier <marc.zyngier@arm.com>

Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

(same testing as for PATCH 1/3)

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
