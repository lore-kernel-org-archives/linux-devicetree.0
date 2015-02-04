From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 2/5] ARM: shmobile: r8a7740: Migrate to generic l2c OF initialization
Date: Wed, 04 Feb 2015 17:36:09 +0100
Message-ID: <3598552.qKIyokxIlF@wuerfel>
References: <1423059315-28519-1-git-send-email-geert+renesas@glider.be> <7800327.b3sMA1XGtZ@wuerfel> <CAMuHMdVi3kq2p30cNFYW2WCM-OvMSFC1W0r5nYkaN5Np=zW4_Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdVi3kq2p30cNFYW2WCM-OvMSFC1W0r5nYkaN5Np=zW4_Q@mail.gmail.com>
Sender: linux-sh-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms+renesas@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-sh list <linux-sh@vger.kernel.org>, Russell King <rmk@arm.linux.org.uk>
List-Id: devicetree@vger.kernel.org

On Wednesday 04 February 2015 15:43:43 Geert Uytterhoeven wrote:
> 
> Indeed. Note that I only try to preserve the register value before and after
> migrating to generic l2c OF initialization. I did read (part of) the pl310
> documentation, but it's still not clear to me if we really need
> L2C_AUX_CTRL_SHARED_OVERRIDE. Perhaps this was just copied from
> somewhere else without much afterthought?

Have you checked what the hardware/bootloader actually sets in that bit?

Maybe you can remove that override completely and the initial Linux
default was just set to the same that is already set on powerup?

	Arnd
