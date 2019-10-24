Return-Path: <SRS0=F2+Z=YR=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 443D4CA9EBB
	for <linux-devicetree@archiver.kernel.org>; Thu, 24 Oct 2019 13:01:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1BAE3205C9
	for <linux-devicetree@archiver.kernel.org>; Thu, 24 Oct 2019 13:01:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502306AbfJXNBx (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 24 Oct 2019 09:01:53 -0400
Received: from salem.gmr.ssr.upm.es ([138.4.36.7]:38044 "EHLO
        salem.gmr.ssr.upm.es" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502314AbfJXNBw (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 24 Oct 2019 09:01:52 -0400
X-Greylist: delayed 430 seconds by postgrey-1.27 at vger.kernel.org; Thu, 24 Oct 2019 09:01:51 EDT
Received: by salem.gmr.ssr.upm.es (Postfix, from userid 1000)
        id 828CDAC0077; Thu, 24 Oct 2019 14:54:37 +0200 (CEST)
Date:   Thu, 24 Oct 2019 14:54:37 +0200
From:   Alvaro Gamez Machado <alvaro.gamez@hazent.com>
To:     Mark Brown <broonie@kernel.org>
Cc:     Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <shubhraj@xilinx.com>,
        linux-spi@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] spi: set bits_per_word based on controller's
 bits_per_word_mask
Message-ID: <20191024125436.GA8878@salem.gmr.ssr.upm.es>
References: <20191024110757.25820-1-alvaro.gamez@hazent.com>
 <20191024110757.25820-4-alvaro.gamez@hazent.com>
 <20191024111300.GD5207@sirena.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191024111300.GD5207@sirena.co.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Oct 24, 2019 at 12:13:00PM +0100, Mark Brown wrote:
> On Thu, Oct 24, 2019 at 01:07:57PM +0200, Alvaro Gamez Machado wrote:
> > By leaving this value unset, a default value of 8 was being set later on.
> > 
> > If it happens that the SPI master driver doesn't support this value of 8,
> > there will be an initial inconsistency between the SPI master and the device
> > itself. This isn't a problem for most devices because kernel drivers
> 
> This will break things, client devices are working on the basis that the
> default transfer width is 8 bits.  As I've repeatedly said if we have
> different parts of the system with different ideas about the word size
> we're going to end up with data corruption.  Please take this feedback
> on board.

Oh, ok. I didn't understand this cleary from previous mails, now I see what
you mean.

I think then the only way this would be feasible is to check if 8 bits is an
acceptable number for the master and, if it isn't, apply the lowest
available data width. I believe this cannot break anything, as it leaves 8
as the default unless the master can't work with that number, in which case
it really doesn't matter what client device wants because the hardware can't
provide it.

Thanks!

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 794e20e54237..4e26ac79e133 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -3079,8 +3079,12 @@ int spi_setup(struct spi_device *spi)
                return -EINVAL;
        }
 
-       if (!spi->bits_per_word)
-               spi->bits_per_word = 8;
+       if (!spi->bits_per_word) {
+               if (spi->controller->bits_per_word_mask & SPI_BPW_MASK(8))
+                       spi->bits_per_word = 8;
+               else
+                       spi->bits_per_word = ffs(spi->controller->bits_per_word_mask);
+       }
 
        status = __spi_validate_bits_per_word(spi->controller,
                                              spi->bits_per_word);





-- 
Alvaro G. M.
