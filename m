From: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v3 3/4] ARM: dts: dps650ab: add power supply
Date: Thu, 17 Jan 2019 12:57:08 +1100
Message-ID: <CACPK8Xdj1Cas8E+141f=ke99REhm-H-pgWE0GBwxXaZ996tCeQ@mail.gmail.com>
References: <cover.1546918172.git.xiaoting.liu@hxt-semitech.com> <a7b5fa54198e7fd0def33de3e7db36239a2e3da7.1546918172.git.xiaoting.liu@hxt-semitech.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a7b5fa54198e7fd0def33de3e7db36239a2e3da7.1546918172.git.xiaoting.liu@hxt-semitech.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Xiaoting Liu <xiaoting.liu@hxt-semitech.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Guenter Roeck <linux@roeck-us.net>, devicetree <devicetree@vger.kernel.org>, shunyong.yang@hxt-semitech.com, linux-aspeed@lists.ozlabs.org, dongsheng.wang@hxt-semitech.com, Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, 10 Jan 2019 at 13:29, Xiaoting Liu
<xiaoting.liu@hxt-semitech.com> wrote:
>
> Add Delta Electronics power supply DPS-650-AB.
>
> Signed-off-by: Xiaoting Liu <xiaoting.liu@hxt-semitech.com>
> ---
> v3:
>   Modify patch subject and commit message.
>   Add delta to compatible property.
> ---
> v2:
>   No change.

I tweaked the commit message to mention the board you were applying
to. Applied to the aspeed tree for 5.1.

Thanks,

Joel
