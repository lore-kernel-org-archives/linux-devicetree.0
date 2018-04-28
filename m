Return-Path: <SRS0=xn/B=HR=vger.kernel.org=devicetree-owner@kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.131]:57419 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759374AbeD1BLk (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 27 Apr 2018 21:11:40 -0400
Subject: Re: [PATCH v2 1/2] Documentation: mmc: add description for
 power-delay-ms
References: <1524471030-3527-1-git-send-email-shawn.lin@rock-chips.com>
 <20180427185458.6o5tlfic75gy2vqr@rob-hp-laptop>
From: Shawn Lin <shawn.lin@rock-chips.com>
Message-ID: <979a598a-9b8f-0bcc-0de0-f1d02496515d@rock-chips.com>
Date: Sat, 28 Apr 2018 09:11:35 +0800
MIME-Version: 1.0
In-Reply-To: <20180427185458.6o5tlfic75gy2vqr@rob-hp-laptop>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: shawn.lin@rock-chips.com, Jaehoon Chung <jh80.chung@samsung.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Adrian Hunter <adrian.hunter@intel.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Rob and Ulf,

On 2018/4/28 2:54, Rob Herring wrote:
> On Mon, Apr 23, 2018 at 04:10:29PM +0800, Shawn Lin wrote:

...

>> +- power-delay-ms: Tunable delay waiting for I/O signalling and card power supply
>> +  to be stable. Default to 10ms if no available.
> 
> How long do you need? Would changing the default to say 20ms work and
> still be short enough others don't care?

It varies from board-2-board, but my boards only need 2ms or less. The
hard-coded 10ms was increased from 2ms since 2009, just for fixing one
board. And nobody complained 10ms is too short(including me), so it's
fine for everybody probably. However, nobody complained it's toooo long
as well, expect me, so my best guess is either others don't care it at
all, or haven't noticed it. So the intention for this patch, is to save
the unnecessary waste for the boot-time sensitive environment, by
reducing the delay but don't break anything else.


> 
> Can we use the same property as the mmc pwrseq binding defines:
> post-power-on-delay-ms

I'm fine with using post-power-on-delay-ms, but it depends on whether
using pwrseq_simple. So I need add parsing it in two places for
different prupose. Is it ok, or better idea?


> 
> Rob
> 
> 
> 

