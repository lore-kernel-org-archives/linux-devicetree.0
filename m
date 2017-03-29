From: Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH v6 1/5] irqchip/aspeed-i2c-ic: binding docs for Aspeed I2C
 Interrupt Controller
Date: Wed, 29 Mar 2017 03:34:02 -0700
Message-ID: <CAFd5g47Pij6TxkmS6akWoAL0FZ2WLh+FWUrr099RiabWn+pneQ@mail.gmail.com>
References: <20170328051226.21677-1-brendanhiggins@google.com>
 <20170328051226.21677-2-brendanhiggins@google.com> <1490690980.3177.108.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-i2c-owner@vger.kernel.org>
In-Reply-To: <1490690980.3177.108.camel@kernel.crashing.org>
Sender: linux-i2c-owner@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Wolfram Sang <wsa@the-dreams.de>, robh+dt@kernel.org, mark.rutland@arm.com, tglx@linutronix.de, jason@lakedaemon.net, Marc Zyngier <marc.zyngier@arm.com>, Joel Stanley <joel@jms.id.au>, Vladimir Zapolskiy <vz@mleia.com>, Kachalov Anton <mouse@mayc.ru>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

I think I addressed this on the other email with the actual driver.
Anyway, I thought that this is pretty much the dummy irqchip code is
for; I have seen some other drivers do the same thing. It is true that
this is a really basic "interrupt controller;" it cannot mask on its
own, etc; nevertheless, I think you will pretty much end up with the
same code for an "I2C controller;" it just won't use an irq_domain.
