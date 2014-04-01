From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [git pull] Devicetree changes for v3.15
Date: Tue, 01 Apr 2014 21:42:37 +0200
Message-ID: <1396381357.23763.16.camel@x220>
References: <CACxGe6vCrkHPL6UNy1p8AO4+z5VFRY6w4_2grQEZQwp_3jJ7Yw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACxGe6vCrkHPL6UNy1p8AO4+z5VFRY6w4_2grQEZQwp_3jJ7Yw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <rob.herring@linaro.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2014-04-01 at 11:15 +0100, Grant Likely wrote:
> Grant Likely (13):
>       [...]
>       of: remove /proc/device-tree

That commit leaves a select for PROC_DEVICETREE dangling. See "config
ARCH_OMAP2PLUS" in arch/arm/mach-omap2/Kconfig. Can that select
statement just be dropped now or is something more elaborate needed?


Paul Bolle
