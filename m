From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: [PATCH 2/3] misc: eeprom: add Cypress FM33256B FRAM driver
Date: Fri, 22 Apr 2016 01:54:29 +0200
Message-ID: <20160421235429.GA6086@piout.net>
References: <1461150471-23163-1-git-send-email-jlp@gomspace.com>
 <1461150471-23163-3-git-send-email-jlp@gomspace.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1461150471-23163-3-git-send-email-jlp@gomspace.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jeppe Ledet-Pedersen <jlp@gomspace.com>
Cc: lee.jones@linaro.org, arnd@arndb.de, gregkh@linuxfoundation.org, a.zummo@towertech.it, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rtc-linux@googlegroups.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

On 20/04/2016 at 13:07:50 +0200, Jeppe Ledet-Pedersen wrote :
> Signed-off-by: Jeppe Ledet-Pedersen <jlp@gomspace.com>
> ---
>  MAINTAINERS                         |   1 +
>  drivers/misc/eeprom/Kconfig         |  12 ++++
>  drivers/misc/eeprom/Makefile        |   1 +
>  drivers/misc/eeprom/fm33256b-fram.c | 110 ++++++++++++++++++++++++++++++++++++
>  4 files changed, 124 insertions(+)
>  create mode 100644 drivers/misc/eeprom/fm33256b-fram.c
> 

There is now an nvmem framework that will allow you to easily have both
an in-kernel and a userspace interface.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
