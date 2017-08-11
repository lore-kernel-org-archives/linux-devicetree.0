From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v2 4/5] soc: qcom: Remote FS memory driver
Date: Fri, 11 Aug 2017 03:00:58 -0700
Message-ID: <20170811100058.GA7064@infradead.org>
References: <20170803025754.19101-1-bjorn.andersson@linaro.org>
 <20170803025754.19101-5-bjorn.andersson@linaro.org>
 <20170805095804.GA14401@infradead.org>
 <20170807162327.GH29306@minitux>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170807162327.GH29306@minitux>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Christoph Hellwig <hch@infradead.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Aug 07, 2017 at 09:23:27AM -0700, Bjorn Andersson wrote:
> Up until this patch the user space tool that implements the message
> handler just mapped the reserved memory region though /dev/mem, but this
> requires /dev/mem access and for the later platforms we need to make a
> call into TrustZone to provide the remote permission to access this
> memory region. So we need some code in the kernel to represent this.
> 
> > Else: NAK as the scheme looks completely brain dead and bonkers.
> 
> I can rework the commit message in an attempt to better explain the
> setup and hope you/people find it slightly less bonkers.
> 
> Does this sound reasonable?

Please rework the commit message.  And it should probably grow a saner
module name, too.
