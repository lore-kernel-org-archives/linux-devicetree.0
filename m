Return-Path: <jchandra@broadcom.com>
Date: Mon, 9 Feb 2015 21:45:50 +0530
From: Jayachandran C. <jchandra@broadcom.com>
Subject: Re: [PATCH 2/2] i2c: Support for Netlogic XLP9XX/5XX I2C controller.
Message-ID: <20150209161549.GA2787@jayachandranc.netlogicmicro.com>
References: <1421393020-18807-1-git-send-email-jchandra@broadcom.com>
 <1421393020-18807-2-git-send-email-jchandra@broadcom.com>
 <20150209152805.GC8024@katana>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20150209152805.GC8024@katana>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "Kumar Gala  <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Subhendu Sekhar Behera" <sbehera@broadcom.com>, Ray Jui <rjui@broadcom.com>
List-ID: <devicetree@vger.kernel.org>

On Mon, Feb 09, 2015 at 04:28:06PM +0100, Wolfram Sang wrote:
> On Fri, Jan 16, 2015 at 12:53:40PM +0530, Jayachandran C wrote:
> > From: Subhendu Sekhar Behera <sbehera@broadcom.com>
> > 
> > Add an I2C bus driver i2c-xlp9xx.c to support the I2C block in the
> > XLP9xx/XLP5xx MIPS SoC. Update Kconfig and Makefile to add the
> > CONFIG_I2C_XLP9XX option.
> > 
> > Also add document Documentation/devicetree/bindings/i2c/i2c-xlp9xx.txt
> > for DT compatible string "netlogic,xlp9xx-i2c".
> > 
> > Signed-off-by: Subhendu Sekhar Behera <sbehera@broadcom.com>
> > Signed-off-by: Jayachandran C <jchandra@broadcom.com>
> 
> I would like to request some in-house teaching here. Ray Jui (also from
> Broadcom and on CC now) just got his i2c driver applied. He should be
> able to help you and spot a few issues which he had to solve just
> recently, too. That would save me some bandwidth which would go into
> other I2C maintenance. OK, guys?

Given that we have already have i2c/busses/i2c-xlr.c upstream (and updates
to i2c-ocores.c for our earlier chip), I was hoping that we have got things
right this time.

Anyway, I will forward it internally to Ray for review, and if necessary
submit another patch.

Thanks,
JC.
