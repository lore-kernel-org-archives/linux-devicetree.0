From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 2/3] mailbox: Avoid NULL dereference in mbox_chan_received_data
Date: Thu, 1 Mar 2018 19:02:34 +0530
Message-ID: <CABb+yY04Fdv16RKAOZ=Tr7KnEOCJnXpGF0pEgy8DjREqEixiqA@mail.gmail.com>
References: <20180228022714.30068-1-samuel@sholland.org> <20180228022714.30068-3-samuel@sholland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180228022714.30068-3-samuel@sholland.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Samuel Holland <samuel@sholland.org>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ", linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, srv_heupstream" <linux-arm-kernel@lists.infradead.org>, Devicetree List <devicetree@vger.kernel.org>, Andre Przywara <andre.przywara@arm.com>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 28, 2018 at 7:57 AM, Samuel Holland <samuel@sholland.org> wrote:
> If a reception IRQ is pending when a mailbox channel is shut down (for
> example, if the controller uses threaded interrupts), it is possible for
> mbox_chan_received_data to be called while chan->cl is NULL.
>
We can add a check in mailbox.c, but that is like shoving it under the carpet.
How does your code look like?  mbox_chan_received_data() is meant to
be called from interrupt context as its documentation says.
Also the controller driver is responsible for ceasing any transient
xfer before returning from shutdown() callback.

Cheers!
