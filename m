From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v4 1/1] ARM: dts: imx53: Add GE Healthcare PPD
Date: Wed, 12 Jul 2017 09:34:19 -0300
Message-ID: <CAOMZO5APZNVFNz2ZHnWo15mzkZ7XpP-HyPgJKs1jootN3WM=HQ@mail.gmail.com>
References: <cffaa6f22474ff2ba4ca46d4252d35fc75cb0dd7.1499779628.git.martyn.welch@collabora.co.uk>
 <CAOMZO5D6xw4hVCOWfM0+++PQ87xBwihGSCJZsW8qBdn==vrLvA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOMZO5D6xw4hVCOWfM0+++PQ87xBwihGSCJZsW8qBdn==vrLvA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Martyn Welch <martyn.welch@collabora.co.uk>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>, Sebastian Reichel <sebastian.reichel@collabora.co.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 12, 2017 at 9:32 AM, Fabio Estevam <festevam@gmail.com> wrote:
> On Tue, Jul 11, 2017 at 10:42 AM, Martyn Welch
> <martyn.welch@collabora.co.uk> wrote:
>
>> Changes since PATCHv3: https://patchwork.kernel.org/patch/9819017/
>>  - licensing modified
>>  - manufacturer changed to GE
>>  - regulator nodes corrected
>>  - backlight node corrected
>>  - flags rather than magic numbers used
>>  - registers for usbphys added
>>  - set up IOMUX configuration correctly
>>  - various whitespace corrections
>>  - removed unused fsl,mode node
>
> Actually I still see 'fsl,mode' under the ssi2 node. Please remove it.
>
>> +#define I2C_PAD_CTL 0xc0000000
>
> This still sets bits 31, which means the kernel will rely on the IOMUX
> configuration from the bootloader.
>
> It is better if you could just pass the real IOMUX values here instead.

And please also fix the typo on the
linux-arm-kernel@lists.infradead.org address next time :-)
