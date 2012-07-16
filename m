From: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
Subject: linux-next: Tree for July 16 - Build failure
Date: Mon, 16 Jul 2012 10:29:10 -0300
Message-ID: <CAAAP30FQYPzScZiQqoYz3_Dv4+7sN+f1VBpbF=AeuwJsi-U5sA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Sender: linux-next-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, devicetree-discuss@lists.ozlabs.org, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi,

I am getting errors building lpc32xx defconfig on linux-next tree for
next-20120716 tag.

Here are the errors:
drivers/built-in.o: In function `of_clk_get':
drivers/clk/clkdev.c:42: undefined reference to `of_clk_get_from_provider'
make[1]: ** [vmlinux] Erro 1

Any suggestions?

Thanks.
