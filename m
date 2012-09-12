From: David Brown <davidb@codeaurora.org>
Subject: Re: [PATCH 8/9] ARM: msm: Add DT support for 8960
Date: Wed, 12 Sep 2012 09:23:41 -0700
Message-ID: <20120912162341.GA22065@codeaurora.org>
References: <1346873339-10927-1-git-send-email-sboyd@codeaurora.org>
 <1346873339-10927-9-git-send-email-sboyd@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1346873339-10927-9-git-send-email-sboyd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Bryan Huntsman <bryanh@codeaurora.org>, Daniel Walker <dwalker@fifo99.com>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 05, 2012 at 12:28:58PM -0700, Stephen Boyd wrote:

> diff --git a/arch/arm/boot/dts/msm8960-cdp.dts b/arch/arm/boot/dts/msm8960-cdp.dts

> +	intc: interrupt-controller@02000000 {
> +	timer@0200a004 {
> +	timer@0200a024 {

Same here.  Again, I'll fix these when I pull the patch in.

I guess a question: According to
https://lists.ozlabs.org/pipermail/devicetree-discuss/2012-February/012412.html

these leading zeros shouldn't be there, but I do find a few hundred of
them in our existing devicetree files.  There are also a handful that
have a @0xnnn form of address.

David

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation
