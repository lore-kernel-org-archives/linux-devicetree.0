From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: Re: a case for a common efuse API?
Date: Wed, 9 Jul 2014 14:49:07 +0300
Message-ID: <20140709114907.GI23218@tbergstrom-lnx.Nvidia.com>
References: <53BC4DD7.20906@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <53BC4DD7.20906@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Stephen Warren <swarren@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 08, 2014 at 10:00:23PM +0200, Stephen Boyd wrote:
> 
> I added Tegra folks because I see that on Tegra this hardware is exposed
> via an SoC specific API, tegra_fuse_readl(), and an associated driver in
> drivers/misc/fuse/tegra/. Unfortunately I don't see any users of the API
> outside of the speedo code in the same directory and the sysfs bin
> attribute that may or may not be in use by some userspace code.
> 

The SATA driver by Mikko Perttunen uses it. The driver hasn't been merged
though. There's some more upcoming work which makes use of it.
I don't think we can standardize much of an API for this. The data is
SoC specific, so the user will always need to have some SoC specific
knowledge on how to use it. In some cases we need it very early (eg. to
determine the correct Tegra20 revision). On Tegra20 we can't use the CPU
to read the fuses due to a hw bug, we have to use DMA, which means the
transaction becomes blocking and could fail due to lack of resources.

Cheers,

Peter.
