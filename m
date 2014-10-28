From: Scott Branden <sbranden@broadcom.com>
Subject: Re: [PATCH v8 8/8] ARM: multi_v7_defconfig: Enable Broadcom Cygnus
Date: Tue, 28 Oct 2014 13:06:28 -0700
Message-ID: <544FF744.5020707@broadcom.com>
References: <1414525992-3678-9-git-send-email-sbranden@broadcom.com> <5089697.D8odgNlVtY@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5089697.D8odgNlVtY@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Christian Daudt <bcm@fixthebug.org>, Matt Porter <mporter@linaro.org>, Russell King <linux@arm.linux.org.uk>, bcm-kernel-feedback-list@broadcom.com, Mike Turquette <mturquette@linaro.org>, Alex Elder <elder@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joe Perches <joe@perches.com>, Mauro Carvalho Chehab <m.chehab@samsung.com>, Antti Palosaari <crope@iki.fi>, JD Zheng <jdzheng@broadcom.com>, Ray Jui <rjui@broadcom.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 14-10-28 01:01 PM, Arnd Bergmann wrote:
> On Tuesday 28 October 2014 12:53:12 Scott Branden wrote:
>> From: Ray Jui <rjui@broadcom.com>
>>
>> Enable Broadcom Cygnus platform support in multi_v7_defconfig
>>
>> Signed-off-by: Ray Jui <rjui@broadcom.com>
>> Signed-off-by: Scott Branden <sbranden@broadcom.com>
>>
>
> Just to be sure: did you check that multi_v7_defconfig contains
> all the drivers you need that you enable in your other defconfig?
No - the other defconfig has more that have not been tested on the 
device.  The defconfig builds, but the other drivers haven't been 
tested.  I guess we can try adding them to the multi_defconfig right now 
as well or wait until we have tested them?  There will need to be 
addition dts changes in the future after we have tested the other drivers.

Can we wait to add them to multi_v7_defconfig or do you want them in 
this patchset?
>
> 	Arnd
>
