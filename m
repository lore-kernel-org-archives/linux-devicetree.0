From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RESEND PATCH 4/4] ARM: dts: socfpga: Add generic compatible
 string for I2C EEPROM
Date: Thu, 21 Dec 2017 16:08:52 +0100
Message-ID: <CAK8P3a3FjsOaDniD9vqW6wnBbRCsVMety2xV2yfK7g4HG4GC-g@mail.gmail.com>
References: <20171124162750.18756-1-javierm@redhat.com> <20171124162750.18756-4-javierm@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171124162750.18756-4-javierm@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Olof Johansson <olof@lixom.net>, arm-soc <arm@kernel.org>, DTML <devicetree@vger.kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 24, 2017 at 5:27 PM, Javier Martinez Canillas
<javierm@redhat.com> wrote:
> The at24 driver allows to register I2C EEPROM chips using different vendor
> and devices, but the I2C subsystem does not take the vendor into account
> when matching using the I2C table since it only has device entries.
>
> But when matching using an OF table, both the vendor and device has to be
> taken into account so the driver defines only a set of compatible strings
> using the "atmel" vendor as a generic fallback for compatible I2C devices.
>
> So add this generic fallback to the device node compatible string to make
> the device to match the driver using the OF device ID table.
>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

Applied, thanks!

      Arnd
