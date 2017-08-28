From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH V2] spmi: pmic-arb: Enforce the ownership check optionally
Date: Mon, 28 Aug 2017 13:53:28 +0200
Message-ID: <20170828115328.GA26757@kroah.com>
References: <1503070110-15018-1-git-send-email-kgunda@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1503070110-15018-1-git-send-email-kgunda@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Kiran Gunda <kgunda@codeaurora.org>
Cc: sboyd@codeaurora.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Abhijeet Dharmapurikar <adharmap@codeaurora.org>, David Collins <collinsd@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, shawnguo@kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Aug 18, 2017 at 08:58:29PM +0530, Kiran Gunda wrote:
> The peripheral ownership check is not necessary on single master
> platforms. Hence, enforce the peripheral ownership check optionally.
> 
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> Tested-by: Shawn Guo <shawnguo@kernel.org>
> ---
> v2:
> 	Fixed the commit message.
> 	Added Shawn's 'Tested-by' tag.
> 
> v1:
> 	This patch depends on the below patch series. Please take this patch
> 	along with this series.
> 
> 	[PATCH V2 00/12]: spmi: pmic-arb: Support for HW v5 and other fixes
> 
>  Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.txt | 6 ++++++
>  drivers/spmi/spmi-pmic-arb.c                                  | 7 ++++++-
>  2 files changed, 12 insertions(+), 1 deletion(-)

This doesn't apply on top of the other spmi patches I just added to my
tree.  Did I mess something up here?

thanks,

greg k-h
