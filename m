From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH V3] of: Set the DMA mask to 64 bits when dma_addr_t is
 64-bits
Date: Fri, 26 Apr 2013 21:52:00 +0100
Message-ID: <20130426205159.GA48325@MacBook-Pro.local>
References: <1367008266-1431-1-git-send-email-lauraa@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1367008266-1431-1-git-send-email-lauraa@codeaurora.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Laura Abbott <lauraa@codeaurora.org>
Cc: "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 26, 2013 at 09:31:06PM +0100, Laura Abbott wrote:
> Currently, of_platform_device_create_pdata always sets the
> coherent DMA mask to 32 bits. On ARM systems without CONFIG_ZONE_DMA,
> arm_dma_limit gets set to ~0 or 0xFFFFFFFFFFFFFFFF on LPAE based
> systems. Since arm_dma_limit represents the smallest dma_mask
> on the system, the default of 32 bits prevents any dma_coherent
> allocation from succeeding unless clients manually set the
> dma mask first. Rather than make every client on an LPAE system set
> the mask manually, account for the size of dma_addr_t when setting
> the coherent mask.
> 
> Signed-off-by: Laura Abbott <lauraa@codeaurora.org>

Looks good.

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
