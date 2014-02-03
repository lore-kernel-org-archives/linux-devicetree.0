From: Christopher Covington <cov@codeaurora.org>
Subject: Re: [PATCH] arm: document "mach-virt" platform.
Date: Mon, 03 Feb 2014 08:46:07 -0500
Message-ID: <52EF9D9F.5020600@codeaurora.org>
References: <1391098262-15944-1-git-send-email-ian.campbell@citrix.com> <52EA83D6.9050506@codeaurora.org> <20140203045638.GB4167@cbox>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140203045638.GB4167@cbox>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoffer Dall <christoffer.dall@linaro.org>
Cc: Ian Campbell <ian.campbell@citrix.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Pawel Moll <pawel.moll@arm.com>, Stefano Stabellini <stefano.stabellini@eu.citrix.com>, Marc Zyngier <marc.zyngier@arm.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Christoffer,

On 02/02/2014 11:56 PM, Christoffer Dall wrote:
> On Thu, Jan 30, 2014 at 11:54:46AM -0500, Christopher Covington wrote:
>> I think it would be informative to provide pointers here to commonly used
>> paravirtualized devices, especially VirtIO PCI/MMIO.
> 
> I disagree: that would only encourage limited testing or assumptions
> about these specific devices when really this platform is just a
> bare-bones platform driven by device tree which should make no
> preference, whatsoever, about which devices are used with the platform.

I'd be all for clearly stating that no assumptions can be made. Perhaps you
can explain though how providing less documentation will result in more
testing? The assertion does not currently make sense to me.

Thanks,
Christopher

-- 
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by the Linux Foundation.
