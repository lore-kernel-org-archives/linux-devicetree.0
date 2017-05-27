From: Andy Gross <andy.gross@linaro.org>
Subject: Re: [RFC 2/3] of: reserved_mem: Accessor for acquiring reserved_mem
Date: Fri, 26 May 2017 22:37:33 -0500
Message-ID: <20170527033733.GB19546@hector.attlocal.net>
References: <20170422173519.5782-1-bjorn.andersson@linaro.org>
 <20170422173519.5782-2-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170422173519.5782-2-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: David Brown <david.brown@linaro.org>, Frank Rowand <frowand.list@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, Apr 22, 2017 at 10:35:18AM -0700, Bjorn Andersson wrote:
> In some cases drivers referencing a reserved-memory region might want to
> remap the entire region, but when defining the reserved-memory by "size"
> the client driver has no means to know the associated base address of
> the reserved memory region.
> 
> This patch adds an accessor for such drivers to acquire a handle to
> their associated reserved-memory for this purpose.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Andy Gross <andy.gross@linaro.org>
