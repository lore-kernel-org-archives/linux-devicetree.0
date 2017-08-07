From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 4/5] soc: qcom: Remote FS memory driver
Date: Mon, 7 Aug 2017 09:23:27 -0700
Message-ID: <20170807162327.GH29306@minitux>
References: <20170803025754.19101-1-bjorn.andersson@linaro.org>
 <20170803025754.19101-5-bjorn.andersson@linaro.org>
 <20170805095804.GA14401@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170805095804.GA14401@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@infradead.org>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat 05 Aug 02:58 PDT 2017, Christoph Hellwig wrote:

> On Wed, Aug 02, 2017 at 07:57:53PM -0700, Bjorn Andersson wrote:
> > The rfsa driver is used for allocating and exposing regions of shared
> > memory with remote processors for the purpose of exchanging sector-data
> > between the remote filesystem service and its clients.
> 
> Please explain which remote fs this is for, and submit said file system
> for inclu??ion.
> 

In the NAND-era of Qualcomm platforms the modem firmware had direct
access to the storage media, but with the move to eMMC and the
transition of Linux/Android to become the "primary OS" this access was
lost.

Remaining in the modem firmware is a file system (EFS) for parameter
storage et al, but the block layer was replaced with a block-access
protocol, "conveniently" called RemoteFS.

The protocol is based on a chunk of RAM and a set of messages to
transfer sector-data between the storage device and the chunk of RAM.


Up until this patch the user space tool that implements the message
handler just mapped the reserved memory region though /dev/mem, but this
requires /dev/mem access and for the later platforms we need to make a
call into TrustZone to provide the remote permission to access this
memory region. So we need some code in the kernel to represent this.

> Else: NAK as the scheme looks completely brain dead and bonkers.

I can rework the commit message in an attempt to better explain the
setup and hope you/people find it slightly less bonkers.

Does this sound reasonable?

Regards,
Bjorn
