From: Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH 5/8] ARM: dts: aspeed-palmetto: Add I2C devices
Date: Thu, 28 Sep 2017 11:36:56 -0700
Message-ID: <CAFd5g47p06pj59EcU0xJMAG_F=gf4RRNvab32GrB9ZocaOzxEw@mail.gmail.com>
References: <20170928075149.8154-1-joel@jms.id.au> <20170928075149.8154-6-joel@jms.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170928075149.8154-6-joel@jms.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Joel Stanley <joel@jms.id.au>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrew Jeffery <andrew@aj.id.au>, Rick Altherr <raltherr@google.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, linux-aspeed@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 28, 2017 at 12:51 AM, Joel Stanley <joel@jms.id.au> wrote:
> Enable the buses that are in use and the devices that are attached.
> Currently that includes the battery backed RTC, temperature measurement
> and EEPROM.
>
> Some of these buses are for hotplugged cards, such as PCIe cards.
> Others do not yet have upstream drivers, so there are no devices
> attached.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
