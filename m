From: Sangbeom Kim <sbkim73@samsung.com>
Subject: RE: [PATCH 21/24] MAINTAINERS: fix drivers/rtc/rtc-sec.c
Date: Sat, 24 Nov 2012 11:13:28 +0900
Message-ID: <000101cdc9e9$4e521ea0$eaf65be0$@com>
References: <1353716808-16375-1-git-send-email-cesarb@cesarb.net>
 <1353716808-16375-22-git-send-email-cesarb@cesarb.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1353716808-16375-22-git-send-email-cesarb@cesarb.net>
Content-language: ko
Sender: linux-kernel-owner@vger.kernel.org
To: 'Cesar Eduardo Barros' <cesarb@cesarb.net>, linux-kernel@vger.kernel.org
Cc: 'Alessandro Zummo' <a.zummo@towertech.it>, 'Grant Likely' <grant.likely@secretlab.ca>, 'Rob Herring' <rob.herring@calxeda.com>, rtc-linux@googlegroups.com, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Sat, Nov 24, 2012 at 9:27 AM , Cesar Eduardo Barros wrote:

> I am guessing that this was a typo for rtc-s3c. Please NACK this patch
> if I am wrong.

rtc-sec and rtc-s3c is different one.
rtc-sec is driver of Samsung mfd.
Rtc-s3c is driver of Samsung SoC.

Currently, We had just done rtc-sec coding.
It just keep on my repo.
Sooner or later, I will post rtc-sec.

Thanks,
Sangbeom.
