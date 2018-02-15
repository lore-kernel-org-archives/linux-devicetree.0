From: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v9 2/3] arm: dts: add Nuvoton NPCM750 device tree
Date: Thu, 15 Feb 2018 12:58:51 +1030
Message-ID: <CACPK8XeOUrrGinU_fmnmn4atYm3Bs-xSoB2MqT0Yr-LytHt78Q@mail.gmail.com>
References: <20180205235757.246758-1-brendanhiggins@google.com>
 <20180205235757.246758-3-brendanhiggins@google.com> <CACPK8XdXOaPZ5i=qKns3=V87nhfY62PNr4kwH9xwVYxY0djo0g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACPK8XdXOaPZ5i=qKns3=V87nhfY62PNr4kwH9xwVYxY0djo0g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Brendan Higgins <brendanhiggins@google.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Cc: Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Mark Rutland <mark.rutland@arm.com>, Tomer Maimon <tmaimon77@gmail.com>, Avi Fishman <avifishman70@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, julien.thierry@arm.com, Philippe Ombredanne <pombredanne@nexb.com>, devicetree <devicetree@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 13, 2018 at 4:52 PM, Joel Stanley <joel@jms.id.au> wrote:
> Hi Brendan,
>
> On Tue, Feb 6, 2018 at 10:27 AM, Brendan Higgins
> <brendanhiggins@google.com> wrote:
>> Add a common device tree for all Nuvoton NPCM750 BMCs and a board
>> specific device tree for the NPCM750 (Poleg) evaluation board.
>>
>> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
>> Reviewed-by: Tomer Maimon <tmaimon77@gmail.com>
>> Reviewed-by: Avi Fishman <avifishman70@gmail.com>
>> Reviewed-by: Joel Stanley <joel@jms.id.au>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> Tested-by: Tomer Maimon <tmaimon77@gmail.com>
>> Tested-by: Avi Fishman <avifishman70@gmail.com>
>
> This looks well acked, reviewed and tested. How do you plan to have
> the ARM SoC maintainers merge your patches?

Following up on an IRC conversation with Brendan:

The process is normally to create a git branch based on on -rc1, apply
your patches, and send them to the ARM maintainers. You then push a
signed tag to a repository somewhere, send a pull request (a git
request-pull email, not a Github PR) and Arnd, Olof or one of the
other maintainers will pull your tree some time before the next merge
window opens.

Arnd, do we have this documented somewhere for new maintainers to follow?

Cheers,

Joel
