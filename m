From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 2/2] hwrng: iproc-rng200 - Add Broadcom IPROC RNG driver
Date: Sat, 28 Feb 2015 20:31:27 +0100
Message-ID: <2555599.AxGoQ20pkj@wuerfel>
References: <1424888184-22180-3-git-send-email-sbranden@broadcom.com> <2093191.gujNGSl66k@wuerfel> <54F1E647.10106@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <54F1E647.10106@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Scott Branden <sbranden@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, Grant Likely <grant.likely@linaro.org>, Ray Jui <rjui@broadcom.com>, Jonathan Richardson <jonathar@broadcom.com>, Dmitry Torokhov <dtor@google.com>, Anatol Pomazao <anatol@google.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Saturday 28 February 2015 08:01:11 Scott Branden wrote:
> > The udelay(10) that the other drivers have seems about appropriate then,
> > and we can independently think of a way to refine the interface.
> > Please add a comment that explains the rate. Also, is there some kind
> > of FIFO present in the hwrng device? If it can store close to 1ms work
> > of data (1000 bits), you can just use an msleep(1) to wait for the
> > pool to recover.
> FIFO is 512 bits.  I will look as to whether we can live with 1/2 
> throughput.

In that case, I think usleep_range(min(len * 8, 500), 500)) would be
a good compromise: it waits at most until the fifo is full, but might
return earlier if enough bits are available to fulfill the request.

	Arnd
