From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 3/3] mailbox: sunxi-msgbox: Add a new mailbox driver
Date: Wed, 28 Feb 2018 14:46:13 +0530
Message-ID: <CABb+yY2uueAK9kzXzU9DT2a4NtV3kK2dc_wtyFWTBn8=Z6Vi7Q@mail.gmail.com>
References: <20180228022714.30068-1-samuel@sholland.org> <20180228022714.30068-4-samuel@sholland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180228022714.30068-4-samuel@sholland.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Samuel Holland <samuel@sholland.org>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ", linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, srv_heupstream" <linux-arm-kernel@lists.infradead.org>, Devicetree List <devicetree@vger.kernel.org>, Andre Przywara <andre.przywara@arm.com>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 28, 2018 at 7:57 AM, Samuel Holland <samuel@sholland.org> wrote:
....

> +/*
> + * The message box hardware provides 8 unidirectional channels. As the mailbox
> + * framework expects them to be bidirectional
>
That is incorrect. Mailbox framework does not require a channel to be
TX and RX capable.

You should expose each channel as per its physical capability, let the
client configure it for direction (if its bidirectional) and acquire
separate channels for RX and TX if it needs to.

Cheers!
