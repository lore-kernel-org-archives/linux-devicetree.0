From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH] Revert "ARM: dts: bcm283x: Fix DTC warnings about missing
 phy-cells"
Date: Mon, 8 Jan 2018 10:15:08 +0100
Message-ID: <df3db2e7-5d0f-9c1c-b005-41cf00e7d851@i2se.com>
References: <1515332212-23593-1-git-send-email-stefan.wahren@i2se.com>
 <87incdjp9k.fsf@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87incdjp9k.fsf@anholt.net>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Eric Anholt <eric@anholt.net>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Florian Fainelli <f.fainelli@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, arm@kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Eric,


Am 07.01.2018 um 23:08 schrieb Eric Anholt:
> Stefan Wahren <stefan.wahren@i2se.com> writes:
>
>> This reverts commit 014d6da6cb2525d7f48fb08c705cb130cc7b5f4a.
>>
>> The DT clean up could trigger an endless deferred probe of DWC2 USB driver
>> on the Raspberry Pi 2/3. So revert the change until we fixed the probing
>> issue.
> Why's that?  I found that I needed to enable the generic no-op phy
> driver, but other than that it was fine.

in order to avoid this regression. Changing the configuration is not a 
solution for the kernelci guys.

Btw

CONFIG_NOP_USB_XCEIV=y

is already enabled in arm64/defconfig and the issue still occured. Do 
you mean a different option?

Stefan
