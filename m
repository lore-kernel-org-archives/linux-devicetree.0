From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH 2/2] mtd: rawnand: denali: add more clocks
Date: Tue, 12 Jun 2018 20:06:45 +0900
Message-ID: <CAK7LNATr54Eo-0PcTSLZvgmdTTngpTYXte=__17X4xRtywAgEg@mail.gmail.com>
References: <1528799515-1356-1-git-send-email-yamada.masahiro@socionext.com>
 <1528799515-1356-2-git-send-email-yamada.masahiro@socionext.com>
 <CAK7LNASM53scdd-OZOj_7404Eru3a98uNLagip_GdkrSSaG3-Q@mail.gmail.com> <20180612130329.1c17311f@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180612130329.1c17311f@bbrezillon>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, Richard Weinberger <richard@sigma-star.at>, DTML <devicetree@vger.kernel.org>, Richard Weinberger <richard@nod.at>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Philipp Rosenberger <p.rosenberger@linutronix.de>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

2018-06-12 20:03 GMT+09:00 Boris Brezillon <boris.brezillon@bootlin.com>:
> On Tue, 12 Jun 2018 19:36:06 +0900
> Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>
>> Maybe, the commit title should be:
>>
>> mtd: rawnand: denali: add more clocks and improve setup_data_interface
>
> Or you split that in 2 commits, one retrieving the new clks, and the
> other one fixing/improving ->setup_data_interface().


Good idea.

I will try that in v2.




-- 
Best Regards
Masahiro Yamada
