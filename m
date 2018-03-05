From: Marcel Holtmann <marcel@holtmann.org>
Subject: Re: [PATCH 3/4] ARM: dts: bcm2835-rpi-zero-w: Add bcm43438 serial
 slave
Date: Mon, 5 Mar 2018 11:04:00 +0100
Message-ID: <19717EF2-FC8D-4F2B-B198-4D582FD743E8@holtmann.org>
References: <1519567855-26105-1-git-send-email-stefan.wahren@i2se.com>
 <1519567855-26105-4-git-send-email-stefan.wahren@i2se.com>
 <84F7E645-59B4-4618-8C91-A5CD654E16A6@holtmann.org>
 <648118289.71086.1519593373795@email.1und1.de>
 <9D6209F2-5389-4F4E-844D-6A8683044F88@holtmann.org>
 <395166283.280598.1520200683559@email.1und1.de>
 <423BE2B6-2209-4390-B420-FA7267318A09@holtmann.org>
 <1219888621.198216.1520231304685@email.1und1.de>
 <524739BF-BD94-4276-BDAB-31B4944D24C3@holtmann.org>
 <CAMZdPi8ab7n0B9qYyZaJAGf4qRH8eYXcUJ=B8pyvyLWyaNVX+Q@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 11.2 \(3445.5.20\))
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAMZdPi8ab7n0B9qYyZaJAGf4qRH8eYXcUJ=B8pyvyLWyaNVX+Q@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Loic Poulain <loic.poulain@linaro.org>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, devicetree <devicetree@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Johan Hedberg <johan.hedberg@gmail.com>, =?utf-8?Q?Fr=C3=A9d=C3=A9ric_Danis?= <frederic.danis.oss@gmail.com>, Phil Elwell <phil@raspberrypi.org>, Linux Bluetooth mailing list <linux-bluetooth@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Eric Anholt <eric@anholt.net>, Lukas Wunner <lukas@wunner.de>, linux-rpi-kernel@lists.infradead.org, Loic Poulain <loic.poulain@gmail.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Loic,

> > >>
> > >> that is weird since we should be either in a probe context or in hdev->open context and both can sleep as far as I know.
> 
> Yes but this is an explicit warning in gpiolib based on gpio controller capabilities,
> not on current context (WARN_ON(desc->gdev->chip->can_sleep)).
> 
> So, since we are always in process/thread context here, it seems safe to use the _cansleep version.

can someone whip up a patch for it and quickly test it.

Regards

Marcel
