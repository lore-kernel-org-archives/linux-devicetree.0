From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [Question] refcount of DT node
Date: Sun, 17 Apr 2016 00:02:54 +0900
Message-ID: <CAK7LNAQiw4VT5Cs1KzXg_K6r8QjiPd8o9xo_oaix0DOXYosK=g@mail.gmail.com>
References: <CAK7LNATFUW2KXUpFas6C_SJ0C7Qb1DWU0njLg-FCYciK2U6Oag@mail.gmail.com>
	<20160414084849.GT19428@n2100.arm.linux.org.uk>
	<20160414095957.GB10273@leverpostej>
	<20160414183855.GU19428@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160414183855.GU19428@n2100.arm.linux.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, rank Rowand <frowand.list@gmail.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi experts.


2016-04-15 3:38 GMT+09:00 Russell King - ARM Linux <linux@arm.linux.org.uk>:

>
> Their stance is not something I agree with - if we have something,
> it should be correct, even if it's not what we would ultimately
> desire, _or_ it should be removed.  This half-way house that we
> have today is total madness to me.

I agree with Russell here.

I am comfortable to do my best in the given API at this point
(and also happy to adjust my drivers when a new API is supported in the future).

So, the answers from DT people are really helpful for me to write correct code.

Thank you everyone!



-- 
Best Regards
Masahiro Yamada
