From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] dmaengine: Add hisilicon k3 DMA engine driver
Date: Mon, 24 Jun 2013 18:15:57 +0200
Message-ID: <10541174.SUr9yD0veu@wuerfel>
References: <1371444872-26994-1-git-send-email-zhangfei.gao@linaro.org>
 <201306211341.53928.arnd@arndb.de>
 <CAMj5Bkg_4G9n9BaQjA-Xj2p8jGO8PZxNW7E7jOeWMMZa5sH6yQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAMj5Bkg_4G9n9BaQjA-Xj2p8jGO8PZxNW7E7jOeWMMZa5sH6yQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: Vinod Koul <vinod.koul@intel.com>, Zhangfei Gao <zhangfei.gao@linaro.org>, device-tree <devicetree-discuss@lists.ozlabs.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, zhangfei gao <zhangfei.gao@gmail.com>
List-Id: devicetree@vger.kernel.org

On Monday 24 June 2013 16:49:08 zhangfei gao wrote:
> 
> Dear Arnd & Vinod
> 
> The suggestion of using dma_get_slave_channel instead of filter works here.
> Dma driver should modify accordingly.

The changes all look good to me, thanks a lot for following up!

However, you should really follow the procedure for posting patches even
if it's just for the sake of discussion:

* always provide a signed-off-by and a patch description
* use an email client that doesn't break whitespace
* I would have split this up into two separate patches, one for the
  subsystem and one for the new driver.

	Arnd
