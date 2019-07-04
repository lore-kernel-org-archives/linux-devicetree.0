From: =?UTF-8?Q?Pawe=C5=82_Dembicki?= <paweldembicki@gmail.com>
Subject: Re: [PATCH v2 4/4] net: dsa: vsc73xx: Assert reset if iCPU is enabled
Date: Thu, 4 Jul 2019 23:57:19 +0200
Message-ID: <CAJN1Kkydjopnd8tZ+RgRUNXW1k6ygFGaaFZvCzB+RDp1K6KFFg@mail.gmail.com>
References: <20190703171924.31801-1-paweldembicki@gmail.com>
 <20190703171924.31801-5-paweldembicki@gmail.com> <CACRpkdYsA5437Sb8J539AJ=cYtnO2MiD7w7V_Emrmk8dNKbaEQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYsA5437Sb8J539AJ=cYtnO2MiD7w7V_Emrmk8dNKbaEQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, netdev <netdev@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 4/7/19 09:22 Linus Walleij <linus.walleij@linaro.org> wrote:
>
> My devices do not have direct access to the reset line so I
> can't assert reset no matter how I try, if it works for you, the
> code is certainly better like this.
>

In P2020RDB, VSC7385 reset is connected to GPIO. U-boot put binary
file to iCPU and make VSC7385 unmanaged.
However reset flush internal memory and iCPU stop.
In this case bootlog looks like that:

[    2.989047] vsc73xx-platform ffb00000.switch: VSC7385 (rev: 2) switch found
[    2.996192] vsc73xx-platform ffb00000.switch: iCPU enabled boots
from PI/SI, no external memory
[    3.005057] vsc73xx-platform ffb00000.switch: Chip seems to be out
of control. Assert reset and try again.
[    3.045034] vsc73xx-platform ffb00000.switch: VSC7385 (rev: 2) switch found
[    3.052171] vsc73xx-platform ffb00000.switch: iCPU disabled, no
external memory

Best Regards,
Pawel Dembicki
