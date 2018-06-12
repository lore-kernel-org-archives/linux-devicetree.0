From: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH 2/2] mtd: rawnand: denali: add more clocks
Date: Tue, 12 Jun 2018 13:05:03 +0200
Message-ID: <3063058.uoHcm7uEyX@blindfold>
References: <1528799515-1356-1-git-send-email-yamada.masahiro@socionext.com> <CAK7LNASM53scdd-OZOj_7404Eru3a98uNLagip_GdkrSSaG3-Q@mail.gmail.com> <20180612130329.1c17311f@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180612130329.1c17311f@bbrezillon>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-mtd <linux-mtd@lists.infradead.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, Brian Norris <computersforpeace@gmail.com>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Philipp Rosenberger <p.rosenberger@linutronix.de>, David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>
List-Id: devicetree@vger.kernel.org

Am Dienstag, 12. Juni 2018, 13:03:29 CEST schrieb Boris Brezillon:
> On Tue, 12 Jun 2018 19:36:06 +0900
> Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
> 
> > Maybe, the commit title should be:
> > 
> > mtd: rawnand: denali: add more clocks and improve setup_data_interface
> 
> Or you split that in 2 commits, one retrieving the new clks, and the
> other one fixing/improving ->setup_data_interface().

Yeah, please split the patch. It needs to go into -stable as well.
One patch should just unbreak the driver.

Thanks,
//richard
