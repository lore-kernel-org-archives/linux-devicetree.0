From: Jeppe Ledet-Pedersen <jlp@gomspace.com>
Subject: Re: [PATCH 2/3] misc: eeprom: add Cypress FM33256B FRAM driver
Date: Tue, 26 Apr 2016 14:08:37 +0200
Message-ID: <571F5A45.2050405@gomspace.com>
References: <1461150471-23163-1-git-send-email-jlp@gomspace.com>
 <1461150471-23163-3-git-send-email-jlp@gomspace.com>
 <20160421235429.GA6086@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160421235429.GA6086@piout.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: lee.jones@linaro.org, arnd@arndb.de, gregkh@linuxfoundation.org, a.zummo@towertech.it, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rtc-linux@googlegroups.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 22/04/16 01:54, Alexandre Belloni wrote:
> Hi,

Hi Alexandre,

> On 20/04/2016 at 13:07:50 +0200, Jeppe Ledet-Pedersen wrote :
>> Signed-off-by: Jeppe Ledet-Pedersen <jlp@gomspace.com>
>> ---
>>  MAINTAINERS                         |   1 +
>>  drivers/misc/eeprom/Kconfig         |  12 ++++
>>  drivers/misc/eeprom/Makefile        |   1 +
>>  drivers/misc/eeprom/fm33256b-fram.c | 110 ++++++++++++++++++++++++++++++++++++
>>  4 files changed, 124 insertions(+)
>>  create mode 100644 drivers/misc/eeprom/fm33256b-fram.c
>>
> 
> There is now an nvmem framework that will allow you to easily have both
> an in-kernel and a userspace interface.

Thanks, I'll take a look at nvmem. It does look like a much better fit.

-Jeppe
