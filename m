From: Grant Likely <grant.likely@linaro.org>
Subject: Re: [PATCH v2 2/2] of: support passing console options with stdout-path
Date: Wed, 26 Nov 2014 21:07:33 +0000
Message-ID: <CACxGe6tYZ8aE_TKw1cYMY5DDjpSXPSnhhAam-rG5NgdjpKJe+A@mail.gmail.com>
References: <1417023640-23464-1-git-send-email-leif.lindholm@linaro.org>
 <1417023640-23464-3-git-send-email-leif.lindholm@linaro.org> <20141126183052.GH3443@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20141126183052.GH3443@lunn.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Leif Lindholm <leif.lindholm@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Ian Campbell <ijc@debian.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 26, 2014 at 6:30 PM, Andrew Lunn <andrew@lunn.ch> wrote:
> On Wed, Nov 26, 2014 at 05:40:40PM +0000, Leif Lindholm wrote:
>> Support specifying console options (like with console=ttyXN,<options>)
>> by appending them to the stdout-path property after a separating ':'.
>>
>> Example:
>>         stdout-path = "uart0:115200";
>
> Hi Leif
>
> This should be documented somewhere under
> Documentation/devicetree/bindings/
>
> Not sure where thought. Maybe a top level chosen.txt?

Actually, this one doesn't. It is already documented in ePAPR

g.
