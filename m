From: kbuild test robot <fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: [grant:spi/next 9/12] drivers/spi/spi.c:1554:37: sparse:
 incompatible types in comparison expression (different signedness)
Date: Fri, 07 Dec 2012 01:18:17 +0800
Message-ID: <50c0d359.Aj5Bwguy9Go3CS7P%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

tree:   git://git.secretlab.ca/git/linux-2.6.git spi/next
head:   b15d5d7004e25716c8b8dfe4e322a64551e2e6cc
commit: b3a223ee2d1a4635b0643c547bc0096a37334ed1 [9/12] spi: Remove SPI_BUFSIZ restriction on spi_write_then_read()


sparse warnings:

+ drivers/spi/spi.c:1554:37: sparse: incompatible types in comparison expression (different signedness)
drivers/spi/spi.c: In function 'spi_write_then_read':
drivers/spi/spi.c:1554:23: warning: comparison of distinct pointer types lacks a cast [enabled by default]

vim +1554 drivers/spi/spi.c

0c4a1590 Mark Brown     2011-05-11  1538  		const void *txbuf, unsigned n_tx,
0c4a1590 Mark Brown     2011-05-11  1539  		void *rxbuf, unsigned n_rx)
8ae12a0d David Brownell 2006-01-08  1540  {
068f4070 David Brownell 2007-12-04  1541  	static DEFINE_MUTEX(lock);
8ae12a0d David Brownell 2006-01-08  1542  
8ae12a0d David Brownell 2006-01-08  1543  	int			status;
8ae12a0d David Brownell 2006-01-08  1544  	struct spi_message	message;
bdff549e David Brownell 2009-04-13  1545  	struct spi_transfer	x[2];
8ae12a0d David Brownell 2006-01-08  1546  	u8			*local_buf;
8ae12a0d David Brownell 2006-01-08  1547  
b3a223ee Mark Brown     2012-12-02  1548  	/* Use preallocated DMA-safe buffer if we can.  We can't avoid
b3a223ee Mark Brown     2012-12-02  1549  	 * copying here, (as a pure convenience thing), but we can
b3a223ee Mark Brown     2012-12-02  1550  	 * keep heap costs out of the hot path unless someone else is
b3a223ee Mark Brown     2012-12-02  1551  	 * using the pre-allocated buffer or the transfer is too large.
8ae12a0d David Brownell 2006-01-08  1552  	 */
b3a223ee Mark Brown     2012-12-02  1553  	if ((n_tx + n_rx) > SPI_BUFSIZ || !mutex_trylock(&lock)) {
b3a223ee Mark Brown     2012-12-02 @1554  		local_buf = kmalloc(max(SPI_BUFSIZ, n_tx + n_rx), GFP_KERNEL);
b3a223ee Mark Brown     2012-12-02  1555  		if (!local_buf)
b3a223ee Mark Brown     2012-12-02  1556  			return -ENOMEM;
b3a223ee Mark Brown     2012-12-02  1557  	} else {
b3a223ee Mark Brown     2012-12-02  1558  		local_buf = buf;
b3a223ee Mark Brown     2012-12-02  1559  	}
8ae12a0d David Brownell 2006-01-08  1560  
8275c642 Vitaly Wool    2006-01-08  1561  	spi_message_init(&message);
bdff549e David Brownell 2009-04-13  1562  	memset(x, 0, sizeof x);

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
