From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v3 00/37] mtd: nand: denali: 2nd round of Denali NAND IP
 patch bomb
Date: Fri, 31 Mar 2017 10:27:03 +0200
Message-ID: <20170331102703.00d8ca83@bbrezillon>
References: <1490856383-31560-1-git-send-email-yamada.masahiro@socionext.com>
        <20170330183805.1c29504f@bbrezillon>
        <CAK7LNATUyc821uQTECkkQj2SDKkbrioFfHVsttnsnc8QuT1P-A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK7LNATUyc821uQTECkkQj2SDKkbrioFfHVsttnsnc8QuT1P-A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Enrico Jorns <ejo@pengutronix.de>, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, Dinh Nguyen <dinguyen@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Graham Moore <grmoore@opensource.altera.com>, David Woodhouse <dwmw2@infradead.org>, Masami Hiramatsu <mhiramat@kernel.org>, Chuanxiao Dong <chuanxiao.dong@intel.com>, Jassi Brar <jaswinder.singh@linaro.org>, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Brian Norris <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Fri, 31 Mar 2017 13:05:20 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> Hi Boris,
> 
> 
> 2017-03-31 1:38 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> 
> > The rest looks almost good, except for a few comments I had on patch
> > 14, 18, 25, 26 and 32.
> >
> > I'll probably apply 33 and 34 soon.
> >  
> 
> Thank you!
> Please note I left a minor comment on 34.
> (Accidental addition of braces.)

Yep, I noticed. Applied both after fixing the alignment and removing
unneeded braces in patch 34.

Thanks,

Boris
