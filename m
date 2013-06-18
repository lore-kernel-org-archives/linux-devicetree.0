From: Jonas Jensen <jonas.jensen@gmail.com>
Subject: Re: [PATCH v2 1/3] ARM: mach-moxart: add MOXA ART SoC files
Date: Tue, 18 Jun 2013 11:12:41 +0200
Message-ID: <CACmBeS2Z=jYavSJqCqk5NnXhy-fq1CfNAZLp7Q3edGqtr=HNqg@mail.gmail.com>
References: <1371467283-6981-1-git-send-email-jonas.jensen@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1371467283-6981-1-git-send-email-jonas.jensen@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux@arm.linux.org.uk, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, arm@kernel.org
List-Id: devicetree@vger.kernel.org

I may have submitted this one too early. There are now a few things I
want to address:

* rename moxart_uc7112lx_defconfig moxart_defconfig
* remove MACH_UC7112LX "default y" from arch/arm/mach-moxart/Kconfig

Also, the omitted arch/arm/mach-moxart/idle.c hinges on a patch now
submitted to Russell's patch tracker:

http://www.arm.linux.org.uk/developer/patches/viewpatch.php?id=7760/1

Best regards,
Jonas
