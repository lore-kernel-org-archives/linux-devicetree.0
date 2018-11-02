From: Sven Van Asbroeck <thesven73@gmail.com>
Subject: Re: [PATCH anybus v2 1/5] misc: support the Arcx anybus bridge.
Date: Fri, 2 Nov 2018 10:16:14 -0400
Message-ID: <CAGngYiXBQkJ6NkZmz=QMDJq-jTdvbZxh=dBa_6pNSqWDye8S_w@mail.gmail.com>
References: <20181031194425.32132-1-TheSven73@googlemail.com>
 <20181031194425.32132-2-TheSven73@googlemail.com> <CACRpkdai-6iNbz4EGuHNHkQYyR+yhTEJdRXP4G6fUKpA+XApjQ@mail.gmail.com>
 <CAGngYiVorxYY+8e75068i4=PJi1gEvnGkgvBfi0+9H+c1qD-oQ@mail.gmail.com> <CACRpkdZkv6ikrFmJptBTwftj7TkR5Bce9e2R1ceTw_pLqH1LcA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZkv6ikrFmJptBTwftj7TkR5Bce9e2R1ceTw_pLqH1LcA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Sven Van Asbroeck <svendev@arcx.com>, Lee Jones <lee.jones@linaro.org>, robh+dt@kernel.org, mark.rutland@arm.com, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, treding@nvidia.com, David Lechner <david@lechnology.com>, noralf@tronnes.org, johan@kernel.org, Michal Simek <monstr@monstr.eu>, michal.vokac@ysoft.com, gregkh@linuxfoundation.org, john.garry@huawei.com, geert+renesas@glider.be, robin.murphy@arm.com, paul.gortmaker@windriver.com, sebastien.bourdelin@savoirfairelinux.com, icenowy@aosc.io, Stuart Yoder <stuyoder@gmail.com>, maxime.ripard@bootlin.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 1, 2018 at 5:53 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Thu, Nov 1, 2018 at 6:17 PM Sven Van Asbroeck <thesven73@gmail.com> wrote:
> > Perhaps there is another kernel abstraction I could use?
>
> Maybe the properties should be on the bus though? I don't know :/

Let's keep the version associated with the bridge. After all, the bus
has its own version associated with it. And the app developers have
separate data structures for the bridge and the bus.

Cheers,
Sven
