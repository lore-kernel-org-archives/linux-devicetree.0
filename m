From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH v5 00/14] Add support for MSM's mmio clock/reset controller
Date: Thu, 06 Feb 2014 20:32:38 -0800
Message-ID: <52F461E6.7070608@gmail.com>
References: <1389811654-21397-1-git-send-email-sboyd@codeaurora.org> <52F45DEE.8020400@gmail.com>
Reply-To: frowand.list@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <52F45DEE.8020400@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: frowand.list@gmail.com, Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Saravana Kannan <skannan@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On 2/6/2014 8:15 PM, Frank Rowand wrote:
> On 1/15/2014 10:47 AM, Stephen Boyd wrote:
>> The first breaks a reset-controller include ordering requirement. It got
>> an ack so I think we're ok for it to go through the clock tree.
>>
> 
> < snip >
> 
> checkpatch is whining about patches
> 

< snip >

Never mind....  I see that the patches are already in 3.14-rc1.

-Frank
