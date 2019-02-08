From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 00/11] mtd: rawnand: denali: exec_op(), controller/chip
 separation, and cleanups
Date: Fri, 8 Feb 2019 22:55:20 +0100
Message-ID: <20190208225520.2f19d2de@xps13>
References: <1549613335-30319-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1549613335-30319-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Boris Brezillon <bbrezillon@kernel.org>, devicetree@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>, linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Hi Masahiro,

Masahiro Yamada <yamada.masahiro@socionext.com> wrote on Fri,  8 Feb
2019 17:08:44 +0900:

> I took time for the Denali driver to catch up with the latest framework.
> 
>  - switch over to exec_op() and remove legacy hooks
> 
>  - separate controller/chips
> 
>  - various cleanups
> 

What you do is very much appreciated. Thanks for keeping this driver
up-to-date! A few reviews are coming, I'll do another pass for the most
complex patches later.


Thanks,
Miquèl
