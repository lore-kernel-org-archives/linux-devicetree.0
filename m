From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH] ARM: davinci: da850: add interrupt-parent property in
 soc node
Date: Mon, 28 Jan 2013 21:03:14 +0530
Message-ID: <51069A3A.8090404@ti.com>
References: <1359112724-1217-1-git-send-email-prabhakar.lad@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1359112724-1217-1-git-send-email-prabhakar.lad@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Prabhakar Lad <prabhakar.csengg@gmail.com>
Cc: LAK <linux-arm-kernel@lists.infradead.org>, DLOS <davinci-linux-open-source@linux.davincidsp.com>, LKML <linux-kernel@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, "Lad, Prabhakar" <prabhakar.lad@ti.com>, devicetree-discuss@lists.ozlabs.org, Heiko Schocher <hs@denx.de>
List-Id: devicetree@vger.kernel.org

On 1/25/2013 4:48 PM, Prabhakar Lad wrote:
> From: Lad, Prabhakar <prabhakar.lad@ti.com>
> 
> This patch adds 'interrupt-parent' property in soc node, so that
> the child inherits this property, this avoids adding 'interrupt-parent'
> to each node.
> 
> Signed-off-by: Lad, Prabhakar <prabhakar.lad@ti.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: davinci-linux-open-source@linux.davincidsp.com
> Cc: devicetree-discuss@lists.ozlabs.org
> Cc: Sekhar Nori <nsekhar@ti.com>
> Cc: Heiko Schocher <hs@denx.de>
> ---

Looks good to me. Queuing for v3.9. BTW, we are moving the interrupt
parent property to soc node rather than adding it. So, I think a better
headline is "move interrupt-parent property to soc node". I change the
headline while committing.

Thanks,
Sekhar
