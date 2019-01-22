From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH RESEND] media: s5p-mfc: Fix memdev DMA configuration
Date: Mon, 21 Jan 2019 18:49:29 -0600
Message-ID: <20190122004928.GA26160@bogus>
References: <4235afdd39766f11a3bf4c8daa0d1f4e6a1cd6dc.1547476835.git.robin.murphy@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <4235afdd39766f11a3bf4c8daa0d1f4e6a1cd6dc.1547476835.git.robin.murphy@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Robin Murphy <robin.murphy@arm.com>
Cc: devicetree@vger.kernel.org, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, linux-media@vger.kernel.org, frowand.list@gmail.com, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 14, 2019 at 03:14:14PM +0000, Robin Murphy wrote:
> Having of_reserved_mem_device_init() forcibly reconfigure DMA for all
> callers, potentially overriding the work done by a bus-specific
> .dma_configure method earlier, is at best a bad idea and at worst
> actively harmful. If drivers really need virtual devices to own
> dma-coherent memory, they should explicitly configure those devices
> based on the appropriate firmware node as they create them.
> 
> It looks like the only driver not passing in a proper OF platform device
> is s5p-mfc, so move the rogue of_dma_configure() call into that driver
> where it logically belongs.
> 
> Reviewed-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Acked-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
> 
> Hi Rob, Frank,
> 
> Bit of an old one bit it's rebased cleanly - Mauro reckoned[1] this
> would suit the OF tree better than media, are you happy to pick it up?

Applied.

Rob
