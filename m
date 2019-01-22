From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH] ARM: dts: bcm2835-rpi-zero-w: Drop unnecessary pinctrl
Date: Tue, 22 Jan 2019 08:59:14 +0100
Message-ID: <2c95729b-bf41-fa39-44d8-db100d2670a0@i2se.com>
References: <1548003960-4807-1-git-send-email-stefan.wahren@i2se.com>
 <87y37d3gbv.fsf@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <87y37d3gbv.fsf@anholt.net>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Eric Anholt <eric@anholt.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Cc: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am 21.01.19 um 21:29 schrieb Eric Anholt:
> Stefan Wahren <stefan.wahren@i2se.com> writes:
>
>> There is no need to specify a pinctrl for the reset GPIO. So we better
>> remove this avoid a potential conflict between pinctrl and pwrseq
>> after the pinmux driver has been changed to strict:
>>
>> pinctrl-bcm2835 20200000.gpio: pin gpio41 already requested by wifi-pwrseq;
>> cannot claim for pinctrl-bcm2835:499
>> pinctrl-bcm2835 20200000.gpio: pin-41 (pinctrl-bcm2835:499) status -22
>> pwrseq_simple: probe of wifi-pwrseq failed with error -22
>>
>> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> Reviewed-by: Eric Anholt <eric@anholt.net>

Applied to bcm2835-dt-next

Thanks
