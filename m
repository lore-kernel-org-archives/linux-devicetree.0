From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH v5 00/14] Add support for MSM's mmio clock/reset controller
Date: Thu, 06 Feb 2014 20:15:42 -0800
Message-ID: <52F45DEE.8020400@gmail.com>
References: <1389811654-21397-1-git-send-email-sboyd@codeaurora.org>
Reply-To: frowand.list@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1389811654-21397-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Saravana Kannan <skannan@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On 1/15/2014 10:47 AM, Stephen Boyd wrote:
> The first breaks a reset-controller include ordering requirement. It got
> an ack so I think we're ok for it to go through the clock tree.
> 

< snip >

checkpatch is whining about patches

  4
  5
  6
  7
  8

(Just for completeness if someone thinks I did not check all the patches,
it also whines about patch 11, but I think the whining should be ignored,
and it whines about patch 1 but I think that might be a checkpatch bug.)

-Frank
