From: Stefan Wahren <info@lategoodbye.de>
Subject: Re: [PATCH 4/4] ARM: bcm2835: Switch to using the new clock driver
 support.
Date: Mon, 21 Dec 2015 19:08:56 +0100
Message-ID: <56784038.402@lategoodbye.de>
References: <1441562263-19888-1-git-send-email-eric@anholt.net>
 <1441562263-19888-5-git-send-email-eric@anholt.net>
 <5677E7BF.3020404@martin.sperl.org> <5677F3C8.5000600@lategoodbye.de>
 <03BE10FE-D743-4CD3-8825-112D0F6B2D43@martin.sperl.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <03BE10FE-D743-4CD3-8825-112D0F6B2D43@martin.sperl.org>
Sender: linux-clk-owner@vger.kernel.org
To: Martin Sperl <kernel@martin.sperl.org>, Eric Anholt <eric@anholt.net>
Cc: linux-clk@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>, Remi Pommarel <repk@triplefau.lt>
List-Id: devicetree@vger.kernel.org

Hi,

[fix Michael's address and add Remi]

Am 21.12.2015 um 16:17 schrieb Martin Sperl:
>
> I started looking and found that drivers/clk/bcm/clk-bcm2835.c
> does not include the PWM clock either.

yes but please look at Remi's patch series first:

http://lists.infradead.org/pipermail/linux-rpi-kernel/2015-December/002672.html

Regards
Stefan
