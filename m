Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.20]:62764 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751012Ab3IKXap (ORCPT <rfc822;devicetree@vger.kernel.org>);
	Wed, 11 Sep 2013 19:30:45 -0400
Received: from lamerx.localnet ([84.56.20.94]) by mail.gmx.com (mrgmx101)
 with ESMTPSA (Nemesis) id 0MYKGj-1VOSBh0qht-00VAKw for
 <devicetree@vger.kernel.org>; Thu, 12 Sep 2013 01:30:44 +0200
From: Peter =?iso-8859-1?q?H=FCwe?= <PeterHuewe@gmx.de>
Subject: Re: [tpmdd-devel] [PATCH] tpm: Add support for Atmel I2C TPMs
Date: Thu, 12 Sep 2013 00:44:29 +0200
References: <20130911205807.GA21467@obsidianresearch.com>
In-Reply-To: <20130911205807.GA21467@obsidianresearch.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <201309120044.30003.PeterHuewe@gmx.de>
Sender: devicetree-owner@vger.kernel.org
To: tpmdd-devel@lists.sourceforge.net
Cc: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Teddy Reed <teddy@prosauce.org>, Teddy Reed <teddy.reed@gmail.com>, Leonidas Da Silva Barbosa <leosilva@linux.vnet.ibm.com>, Ashley Lai <ashley@ashleylai.com>, Rajiv Andrade <mail@srajiv.net>, Peter Huewe <peter.huewe@infineon.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Am Mittwoch, 11. September 2013, 22:58:07 schrieb Jason Gunthorpe:
> This is based on the work of Teddy Reed <teddy@prosauce.org> published
> on GitHub:
>  https://github.com/theopolis/tpm-i2c-atmel.git
>  34894b988b67e0ae55088d6388e77b0dbf10c07d
> 
> That driver was never merged, I have taken it as a starting point,
> forward ported, tested and revised the driver:
>  - Make it broadly textually similar to the Infineon and Nuvoton I2C
>    driver
>  - Place everything in a format suitable for mainline inclusion
>  - Use high level I2C functions i2c_smbus_write_i2c_block_data and
>    i2c_master_recv for data xfer
>  - Use the timeout system from the core code, by faking out a status
>    register
>  - checkpatch cleanups
>  - Testing on ARM Kirkwood, with this device tree, using a
>    AT97SC3204T-X1A180
>         tpm@29 {
>                 compatible = "atmel,at97sc3204t";
>                 reg = <0x29>;
>         };
> 
> PENDING: Teddy will need to provide a Signed-Off line for this driver,
> although very little of his original text remained unchanged, the
> work to discover the protocol is entirely his and he will need to
> certify the Developer Certification of Origin that it is suitable
> for mainline inclusion.
> 
> [jgg: revised and tested]
> Signed-off-by: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>


Hi Jason,

thanks for porting yet another driver.
I think I'll stage them (nuvoton, st and atmel) all in a temporary branch 
"testing-and-review" so it's easier for people to try them out.

Thanks,
Peter
