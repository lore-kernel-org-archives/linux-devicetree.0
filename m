From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v1 2/2] soc: nuvoton: add NPCM LPC BPC driver
Date: Tue, 11 Jun 2019 15:11:48 +0200
Message-ID: <CAK8P3a0s1fdt2yHVjOXffeKPKkwUyJ7DKCZHHMKjx+3j300ZAQ@mail.gmail.com>
References: <20190610133245.306812-1-tmaimon77@gmail.com> <20190610133245.306812-3-tmaimon77@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190610133245.306812-3-tmaimon77@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: Olof Johansson <olof@lixom.net>, gregkh <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, benjaminfair@google.com, Joel Stanley <joel@jms.id.au>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>, linux-aspeed@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Mon, Jun 10, 2019 at 4:19 PM Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> Add Nuvoton BMC NPCM BIOS post code (BPC) driver.
>
> The NPCM BPC monitoring two I/O address written by
> the host on the Low Pin Count (LPC) bus, the capure
> data stored in 128-word FIFO.
>
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>

We've run into this situation before, but don't have a good solution yet:

The driver seems useful and well implemented, but I keep having a bad
feeling about adding a chardev driver into drivers/soc for something that
is clearly specific to a particular implementation on the hardware side
but generic on the user interface. The same user interface might be
used on an Aspeed BMC or any other one, so please coordinate at
least between Novoton and Aspeed developers on creating a common
user interface, and review each other's patches.

Maybe we can introduce a drivers/bmc/ (or even drivers/openbmc)
that collects all those user interfaces with a thin abstraction layer
and one or two hardware specific back-ends?

        Arnd
