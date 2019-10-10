From: Jakub Kicinski <jakub.kicinski@netronome.com>
Subject: Re: [PATCH v9 0/7] nfc: pn533: add uart phy driver
Date: Wed, 9 Oct 2019 17:29:07 -0700
Message-ID: <20191009172907.2f0877f4@cakuba.netronome.com>
References: <20191008140544.17112-1-poeschel@lemonage.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20191008140544.17112-1-poeschel@lemonage.de>
Sender: netdev-owner@vger.kernel.org
To: Lars Poeschel <poeschel@lemonage.de>
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Jilayne Lovejoy <opensource@jilayne.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Steve Winslow <swinslow@gmail.com>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Kees Cook <keescook@chromium.org>, Allison Randal <allison@lohutok.net>, Johan Hovold <johan@kernel.org>, Simon Horman <horms@verge.net.au>
List-Id: devicetree@vger.kernel.org

On Tue,  8 Oct 2019 16:05:37 +0200, Lars Poeschel wrote:
> The purpose of this patch series is to add a uart phy driver to the
> pn533 nfc driver.
> It first changes the dt strings and docs. The dt compatible strings
> need to change, because I would add "pn532-uart" to the already
> existing "pn533-i2c" one. These two are now unified into just
> "pn532". Then the neccessary changes to the pn533 core driver are
> made. Then the uart phy is added.
> As the pn532 chip supports a autopoll, I wanted to use this instead
> of the software poll loop in the pn533 core driver. It is added and
> activated by the last to patches.
> The way to add the autopoll later in seperate patches is chosen, to
> show, that the uart phy driver can also work with the software poll
> loop, if someone needs that for some reason.
> This patchset is already rebased on Johans "NFC: pn533: fix
> use-after-free and memleaks" patch
> https://lore.kernel.org/netdev/20191007164059.5927-1-johan@kernel.org/
> as they would conflict.
> If for some reason Johans patch will not get merged, I can of course
> provide the patchset without depending on this patch.

The memleak patch was a fix and it's on its way to the current 5.4-rc
releases - therefore it was merged into the net tree. Your set adds
support for a new bus, and will go into the net-next tree.

It'd be best if you reposted once the net tree was merged into the
net-next tree (which usually happens every week or two). If you'd
rather not wait you need to rebase on top of the current net-next tree,
and maintainers will handle the conflicts.
