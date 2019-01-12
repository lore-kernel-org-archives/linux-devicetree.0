From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH V4 2/3] ARM: dts: add Raspberry Pi 3 A+
Date: Sat, 12 Jan 2019 20:34:54 +0100 (CET)
Message-ID: <458895695.364954.1547321694901@email.ionos.de>
References: <1545780008-22271-1-git-send-email-stefan.wahren@i2se.com>
 <1545780008-22271-3-git-send-email-stefan.wahren@i2se.com>
 <2da60463-f536-84f4-a176-4f8df30f6eaf@orpaltech.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <2da60463-f536-84f4-a176-4f8df30f6eaf@orpaltech.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sergey Suloev <ssuloev@orpaltech.com>
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>, Phil Elwell <phil@raspberrypi.org>, Eric Anholt <eric@anholt.net>, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Sergey,

> Sergey Suloev <ssuloev@orpaltech.com> hat am 12. Januar 2019 um 19:11 geschrieben:
> 
> 
> Hi, Stefan,
> 
> is this patch the only update required to run Rpi3 A+ with kernel 4.20?

this patch depends on the "Improve VCHIQ cache line size handling" series. But you could also use the RPi 3 B+ DTB.

Btw you are replying to an outdated version of this series. V5 has been applied.

Stefan

> 
> Thank you,
> Sergey
