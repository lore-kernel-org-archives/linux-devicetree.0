Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.20]:49533 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756512Ab3IKXXc (ORCPT <rfc822;devicetree@vger.kernel.org>);
	Wed, 11 Sep 2013 19:23:32 -0400
Received: from lamerx.localnet ([84.56.20.94]) by mail.gmx.com (mrgmx103)
 with ESMTPSA (Nemesis) id 0MJjUO-1VL0De3Lme-0019vX for
 <devicetree@vger.kernel.org>; Thu, 12 Sep 2013 01:23:31 +0200
From: Peter =?iso-8859-1?q?H=FCwe?= <PeterHuewe@gmx.de>
Subject: Re: [tpmdd-devel] [PATCH] tpm: Add support for Atmel I2C TPMs
Date: Thu, 12 Sep 2013 01:23:59 +0200
References: <20130911205807.GA21467@obsidianresearch.com> <20130911230841.GB4251@obsidianresearch.com>
In-Reply-To: <20130911230841.GB4251@obsidianresearch.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <201309120124.00067.PeterHuewe@gmx.de>
Sender: devicetree-owner@vger.kernel.org
To: tpmdd-devel@lists.sourceforge.net
Cc: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Teddy Reed <teddy@prosauce.org>, Teddy Reed <teddy.reed@gmail.com>, Leonidas Da Silva Barbosa <leosilva@linux.vnet.ibm.com>, Ashley Lai <ashley@ashleylai.com>, Rajiv Andrade <mail@srajiv.net>, Peter Huewe <peter.huewe@infineon.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Jason,

Am Donnerstag, 12. September 2013, 01:08:41 schrieb Jason Gunthorpe:
> On Wed, Sep 11, 2013 at 02:58:07PM -0600, Jason Gunthorpe wrote:
> > I'm not yet 100% certain this driver works perfectly, for some reason
> > my TPM will not create an EK, which is either due to a larger sent TPM
> > messages becoming corrupt (combined with a TPM bug to not report an
> > error code) or something wrong with the TPM itself.
> > 
> > +
> > +	status = i2c_smbus_write_i2c_block_data(client, buf[0], len - 1,
> > +						buf + 1);
> 
> Thankfully Peter pointed out that these calls only transfer 32 bytes,
> which causes the problem I observed. The TPM returns success with a
> corrupted response when you truncate the request, apparently.
> 
> Fixing it with:
> 
> +	status = i2c_master_send(client, buf, len);
> 
> Has the driver pass all my tests. I will post a v1 after a few days
> and collect any other comments.

Yes this should probably do the thing ;)


Thanks for porting yet another driver.

I think I'll stage them (nuvoton, st and atmel) all in a temporary branch 
"testing-and-review" so it's easier for people to try them out.
This branch might rebase and change all the time, but maybe it makes things 
easier (and patches can be squashed afterwards easily if needed).


But since you'll be sending a v2, I'll wait until the v2.

Thanks,
Peter


