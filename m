From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] spmi: pmic-arb: Enforce the ownership check optionally
Date: Fri, 18 Aug 2017 21:20:39 +0800
Message-ID: <20170818132038.GO7608@dragon>
References: <1503057279-27318-1-git-send-email-kgunda@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1503057279-27318-1-git-send-email-kgunda@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kiran Gunda <kgunda@codeaurora.org>
Cc: gregkh@linuxfoundation.org, sboyd@codeaurora.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Abhijeet Dharmapurikar <adharmap@codeaurora.org>, David Collins <collinsd@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Aug 18, 2017 at 05:24:36PM +0530, Kiran Gunda wrote:
> The peripheral ownership check is not necessary on single master
> platforms. Hence, enforce the peripheral ownership check optioanlly.
> 
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>

Tested-by: Shawn Guo <shawnguo@kernel.org>
