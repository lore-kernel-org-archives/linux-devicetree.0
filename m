From: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v1 05/12] input: matrix-keypad: update comments, diagnostics
Date: Sat, 22 Jun 2013 04:23:32 +0200
Message-ID: <201306220423.32625.marex@denx.de>
References: <1371838198-7327-1-git-send-email-gsi@denx.de> <1371838198-7327-6-git-send-email-gsi@denx.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <1371838198-7327-6-git-send-email-gsi@denx.de>
Sender: linux-input-owner@vger.kernel.org
To: Gerhard Sittig <gsi@denx.de>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Chao Xie <xiechao.mail@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>, Eric Miao <eric.y.miao@gmail.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, Anatolij Gustschin <agust@denx.de>, Detlev Zundel <dzu@denx.de>
List-Id: devicetree@vger.kernel.org

Dear Gerhard Sittig,

> - add comments about individual routines' purpose and their interaction,
>   pre-conditions and consequences
> - mark a few spots which may need some more attention or clarification
> - rephrase some diagnostics messages
> 
> Signed-off-by: Gerhard Sittig <gsi@denx.de>
> ---
>  drivers/input/keyboard/matrix_keypad.c |   81
> +++++++++++++++++++++++++++++--- drivers/input/matrix-keymap.c          | 
>   4 +-
>  include/linux/input/matrix_keypad.h    |   17 ++++---
>  3 files changed, 89 insertions(+), 13 deletions(-)
> 

You might want to use kerneldoc for this , see Documentation/kernel-doc-nano-
HOWTO.txt

Best regards,
Marek Vasut
