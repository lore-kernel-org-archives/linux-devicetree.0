From: Martin Sperl <kernel@martin.sperl.org>
Subject: Re: [PATCH 4/4] ARM: bcm2835: Switch to using the new clock driver support.
Date: Mon, 21 Dec 2015 19:32:40 +0100
Message-ID: <1C11D489-8708-4937-A1CD-338DDEFF7AAD@martin.sperl.org>
References: <1441562263-19888-1-git-send-email-eric@anholt.net> <1441562263-19888-5-git-send-email-eric@anholt.net> <5677E7BF.3020404@martin.sperl.org> <5677F3C8.5000600@lategoodbye.de> <03BE10FE-D743-4CD3-8825-112D0F6B2D43@martin.sperl.org> <56784038.402@lategoodbye.de>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8BIT
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <56784038.402@lategoodbye.de>
Sender: linux-clk-owner@vger.kernel.org
To: Stefan Wahren <info@lategoodbye.de>
Cc: Eric Anholt <eric@anholt.net>, linux-clk@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>, Remi Pommarel <repk@triplefau.lt>
List-Id: devicetree@vger.kernel.org


> On 21.12.2015, at 19:08, Stefan Wahren <info@lategoodbye.de> wrote:
> 
> Hi,
> 
> [fix Michael's address and add Remi]
> 
> Am 21.12.2015 um 16:17 schrieb Martin Sperl:
>> 
>> I started looking and found that drivers/clk/bcm/clk-bcm2835.c
>> does not include the PWM clock either.
> 
> yes but please look at Remi's patch series first:
> 
> http://lists.infradead.org/pipermail/linux-rpi-kernel/2015-December/002672.html

I guess I must have seen it, but have not realized that I could
apply these. It still leaves the i2s driver itself to get modified -
I got something working but there are still issues...

Thanks,
	Martin