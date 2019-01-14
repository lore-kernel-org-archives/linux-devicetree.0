From: Sergey Suloev <ssuloev@orpaltech.com>
Subject: Re: [PATCH V4 2/3] ARM: dts: add Raspberry Pi 3 A+
Date: Mon, 14 Jan 2019 15:16:37 +0300
Message-ID: <6c732f16-5fb2-cfd3-b3ba-bb2a79037f44@orpaltech.com>
References: <1545780008-22271-1-git-send-email-stefan.wahren@i2se.com>
 <1545780008-22271-3-git-send-email-stefan.wahren@i2se.com>
 <2da60463-f536-84f4-a176-4f8df30f6eaf@orpaltech.com>
 <458895695.364954.1547321694901@email.ionos.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <458895695.364954.1547321694901@email.ionos.de>
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
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>, Phil Elwell <phil@raspberrypi.org>, Eric Anholt <eric@anholt.net>, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Stefan

On 1/12/19 10:34 PM, Stefan Wahren wrote:
> Hi Sergey,
>
>> Sergey Suloev <ssuloev@orpaltech.com> hat am 12. Januar 2019 um 19:11 geschrieben:
>>
>>
>> Hi, Stefan,
>>
>> is this patch the only update required to run Rpi3 A+ with kernel 4.20?
> this patch depends on the "Improve VCHIQ cache line size handling" series. But you could also use the RPi 3 B+ DTB.
>
> Btw you are replying to an outdated version of this series. V5 has been applied.
yes I know
>
> Stefan
>
>> Thank you,
>> Sergey


I tested your patch with 4.20 and 5.0-rc1 and Rpi3 A+, it seems to work 
fine.

Sergey
