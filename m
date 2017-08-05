From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v2 4/5] soc: qcom: Remote FS memory driver
Date: Sat, 5 Aug 2017 02:58:04 -0700
Message-ID: <20170805095804.GA14401@infradead.org>
References: <20170803025754.19101-1-bjorn.andersson@linaro.org>
 <20170803025754.19101-5-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170803025754.19101-5-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 02, 2017 at 07:57:53PM -0700, Bjorn Andersson wrote:
> The rfsa driver is used for allocating and exposing regions of shared
> memory with remote processors for the purpose of exchanging sector-data
> between the remote filesystem service and its clients.

Please explain which remote fs this is for, and submit said file system
for incluѕion.

Else: NAK as the scheme looks completely brain dead and bonkers.
