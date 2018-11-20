From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 0/2] add SAMA5D2 PIOBU GPIO driver
Date: Tue, 20 Nov 2018 11:02:03 +0100
Message-ID: <CACRpkdZj4g9Ht-4sHjFMCmaeZnwmM3AcMaN2rQ65O1Ykgp2eWg@mail.gmail.com>
References: <1542701330-23466-1-git-send-email-andrei.stefanescu@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1542701330-23466-1-git-send-email-andrei.stefanescu@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrei.Stefanescu@microchip.com
Cc: Greg KH <gregkh@linuxfoundation.org>, Nicolas Ferre <Nicolas.Ferre@microchip.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ludovic Desroches <Ludovic.Desroches@microchip.com>, Cristian.Birsan@microchip.com, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Andrei,

On Tue, Nov 20, 2018 at 9:08 AM <Andrei.Stefanescu@microchip.com> wrote:

> On SAMA5D2 SoC the PIOBU pins do not lose their
> voltage during Backup/Self-refresh mode. This can
> be useful, for example, when the voltage must remain
> positive for a peripheral during Backup/Self-refresh
> mode (suspend-to ram is the Linux equivalent state).
>
> v2:

This version looks good to me, I'm just waiting for a DT
binding review.

Yours,
Linus Walleij
