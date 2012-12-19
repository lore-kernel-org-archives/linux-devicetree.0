From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH v3] of: Output devicetree alias names in uevent
Date: Wed, 19 Dec 2012 11:26:55 +0000
Message-ID: <20121219112655.AC0503E0AD7@localhost>
References: <20121206192500.0BF073E3A5E@localhost> <1354834541-26765-1-git-send-email-stepanm@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1354834541-26765-1-git-send-email-stepanm@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Rob Herring <rob.herring@calxeda.com>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, Bryan Huntsman <bryanh@codeaurora.org>, Daniel Walker <dwalker@fifo99.com>, David Brown <davidb@codeaurora.org>, mbohan@codeaurora.org, Stepan Moskovchenko <stepanm@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Thu,  6 Dec 2012 14:55:41 -0800, Stepan Moskovchenko <stepanm@codeaurora.org> wrote:
> In some situations, userspace may want to resolve a
> device by function and logical number (ie, "serial0")
> rather than by the base address or full device path. Being
> able to resolve a device by alias frees userspace from the
> burden of otherwise having to maintain a mapping between
> device addresses and their logical assignments on each
> platform when multiple instances of the same hardware block
> are present in the system.
> 
> Although the uevent device attribute contains devicetree
> compatible information and the full device path, the uevent
> does not list the alises that may have been defined for the
> device.
> 
> Signed-off-by: Stepan Moskovchenko <stepanm@codeaurora.org>

I've picked this up into my devicetree/next branch. It will get pushed out to linux-next after the merge window closes.

Thanks,
g.
