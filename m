From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v3] mfd: Add specific compatible strings for Qualcomm's
 SPMI PMIC's
Date: Mon, 23 Mar 2015 13:06:28 -0700
Message-ID: <20150323200628.GA21712@codeaurora.org>
References: <1426589244-16740-1-git-send-email-iivanov@mm-sol.com>
 <20150323132109.GF24804@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150323132109.GF24804@x1>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: "Ivan T. Ivanov" <iivanov@mm-sol.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Samuel Ortiz <sameo@linux.intel.com>, Stanimir Varbanov <svarbanov@mm-sol.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 03/23, Lee Jones wrote:
> I want to see if Stephen B is now happy with this.
> 
> Not CC'ing him as a previous review is bad form IMO.
> 
> > Some of the PMIC's could have specific regmap configuration
> > tables in future, so add specific compatible strings for known
> > PMIC's. Also print runtime detected chip revision information.
> > 
> > Signed-off-by: Ivan T. Ivanov <iivanov@mm-sol.com>
> > ---

Looks OK to me.

Acked-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
