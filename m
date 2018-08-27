From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH 2/2] ARM: dts: add Raspberry Pi Compute Module 3 and IO
 board
Date: Mon, 27 Aug 2018 19:42:49 +0200 (CEST)
Message-ID: <1901621884.322332.1535391770006@email.1und1.de>
References: <1533381003-13367-1-git-send-email-stefan.wahren@i2se.com>
 <1533381003-13367-3-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1533381003-13367-3-git-send-email-stefan.wahren@i2se.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Scott Branden <sbranden@broadcom.com>, Arnd Bergmann <arnd@arndb.de>, Ray Jui <rjui@broadcom.com>, Phil Elwell <phil@raspberrypi.org>, Alexander Graf <agraf@suse.de>, Eric Anholt <eric@anholt.net>, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Florian,

> Stefan Wahren <stefan.wahren@i2se.com> hat am 4. August 2018 um 13:10 geschrieben:
>  
> 
> The Raspberry Pi Compute Module 3 (CM3) and the Raspberry Pi
> Compute Module 3 Lite (CM3L) are SoMs which contains a BCM2837 processor,
> 1 GB RAM and a GPIO expander. The CM3 has a 4 GB eMMC, but on the CM3L
> the eMMC is unpopulated and it's up to the user to connect their
> own SD/MMC device. The dtsi file is designed to work for both modules.
> There is also a matching carrier board which is called
> Compute Module IO Board V3.
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---
>  arch/arm/boot/dts/Makefile                         |  1 +
>  arch/arm/boot/dts/bcm2837-rpi-cm3-io3.dts          | 87 ++++++++++++++++++++++
>  arch/arm/boot/dts/bcm2837-rpi-cm3.dtsi             | 52 +++++++++++++
>  arch/arm64/boot/dts/broadcom/Makefile              |  3 +-
>  .../boot/dts/broadcom/bcm2837-rpi-cm3-io3.dts      |  2 +

oops, i mixed arm and arm64 within this patch. I will send a new version.

Stefan
