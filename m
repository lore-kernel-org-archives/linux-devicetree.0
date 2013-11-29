From: Tien Hock Loh <thloh.linux@gmail.com>
Subject: Re: [PATCH V5 1/1] drivers/gpio: Altera soft IP GPIO driver
Date: Fri, 29 Nov 2013 09:56:10 +0800
Message-ID: <CAOLUe6ZkuMce1TU9U3pF4+yG-1E+sJUSbVX+HmYC2mEtKh1iFg@mail.gmail.com>
References: <1385608557-22354-1-git-send-email-thloh@altera.com>
	<20131128205059.GD2982@book.gsilab.sittig.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20131128205059.GD2982@book.gsilab.sittig.org>
Sender: linux-doc-owner@vger.kernel.org
To: Tien Hock Loh <thloh@altera.com>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Tien Hock Loh <thloh.linux@gmail.com>, dinguyen@altera.com, "lftan@altera.com" <lftan@altera.com>
List-Id: devicetree@vger.kernel.org

Noted. I'll wait for a while before sending out new patches going forward.

On Fri, Nov 29, 2013 at 4:50 AM, Gerhard Sittig <gsi@denx.de> wrote:
> On Thu, Nov 28, 2013 at 11:15 +0800, thloh@altera.com wrote:
>>
>> From: Tien Hock Loh <thloh@altera.com>
>>
>> Add driver support for Altera GPIO soft IP, including interrupts and I/O.
>> Tested on Altera CV SoC board using dipsw and LED using LED framework.
>>
>> Signed-off-by: Tien Hock Loh <thloh@altera.com>
>> ---
>>  .../devicetree/bindings/gpio/gpio-altera.txt       |  42 +++
>>  drivers/gpio/Kconfig                               |   7 +
>>  drivers/gpio/Makefile                              |   1 +
>>  drivers/gpio/gpio-altera.c                         | 394 +++++++++++++++++++++
>>  4 files changed, 444 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-altera.txt
>>  create mode 100644 drivers/gpio/gpio-altera.c
>
> Oh, I only now noticed that you sent v5 while I just replied to
> v4 (they were a mere 24 hours apart).  Allow people to see and
> read a submission before you emit updates.  And provide a
> description of what has changed so one need not guess.
>
>
> virtually yours
> Gerhard Sittig
> --
> DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
> HRB 165235 Munich, Office: Kirchenstr. 5, D-82194 Groebenzell, Germany
> Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office@denx.de
