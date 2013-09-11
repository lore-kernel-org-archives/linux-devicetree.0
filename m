Return-Path: <devicetree-owner@vger.kernel.org>
Received: from quartz.orcorp.ca ([184.70.90.242]:46396 "EHLO quartz.orcorp.ca"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756031Ab3IKXI6 (ORCPT <rfc822;devicetree@vger.kernel.org>);
	Wed, 11 Sep 2013 19:08:58 -0400
Date: Wed, 11 Sep 2013 17:08:41 -0600
From: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Subject: Re: [PATCH] tpm: Add support for Atmel I2C TPMs
Message-ID: <20130911230841.GB4251@obsidianresearch.com>
References: <20130911205807.GA21467@obsidianresearch.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20130911205807.GA21467@obsidianresearch.com>
Sender: devicetree-owner@vger.kernel.org
To: tpmdd-devel@lists.sourceforge.net, Teddy Reed <teddy@prosauce.org>, Teddy Reed <teddy.reed@gmail.com>, Leonidas Da Silva Barbosa <leosilva@linux.vnet.ibm.com>, Ashley Lai <ashley@ashleylai.com>, Rajiv Andrade <mail@srajiv.net>, Peter Huewe <peter.huewe@infineon.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Wed, Sep 11, 2013 at 02:58:07PM -0600, Jason Gunthorpe wrote:

> I'm not yet 100% certain this driver works perfectly, for some reason
> my TPM will not create an EK, which is either due to a larger sent TPM
> messages becoming corrupt (combined with a TPM bug to not report an
> error code) or something wrong with the TPM itself.

> +
> +	status = i2c_smbus_write_i2c_block_data(client, buf[0], len - 1,
> +						buf + 1);

Thankfully Peter pointed out that these calls only transfer 32 bytes,
which causes the problem I observed. The TPM returns success with a
corrupted response when you truncate the request, apparently.

Fixing it with:

+	status = i2c_master_send(client, buf, len);

Has the driver pass all my tests. I will post a v1 after a few days
and collect any other comments.

Jason
