From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH REBASE] irqchip: Add TB10x interrupt controller driver
Date: Mon, 27 May 2013 15:36:02 +0530
Message-ID: <51A3300A.2060403@synopsys.com>
References: <1365686252-9828-1-git-send-email-christian.ruppert@abilis.com> <1367930258-27056-1-git-send-email-christian.ruppert@abilis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1367930258-27056-1-git-send-email-christian.ruppert@abilis.com>
Sender: linux-doc-owner@vger.kernel.org
To: Christian Ruppert <christian.ruppert@abilis.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Arnd Bergmann <arnd@arndb.de>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Pierrick Hascoet <pierrick.hascoet@abilis.com>
List-Id: devicetree@vger.kernel.org

On 05/07/2013 06:07 PM, Christian Ruppert wrote:
> The SOC interrupt controller driver for the Abilis Systems TB10x series of
> SOCs based on ARC700 CPUs.
> 
> This driver is required to boot the arch/arc/plat-tb10x platform already
> present in linux-next. Please consider this patch for inclusion in 3.10.
> This is the rebase of a previous version on linux-next.
> 
> Signed-off-by: Christian Ruppert <christian.ruppert@abilis.com>
> Signed-off-by: Pierrick Hascoet <pierrick.hascoet@abilis.com>

Looks good to me !

Reviewed-by: Vineet Gupta <vgupta@synopsys.com>

P.S. @tglx can you please review this at your earliest convenience and provide any
feedback to Chrisitian. This driver is essential to their platform and it would be
nice to have it in mainline in 3.11

Thx,
-Vineet
