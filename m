From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 4/9] mmc: meson-mx-sdio: fix OF child-node lookup
Date: Thu, 23 Aug 2018 20:50:23 +0200
Message-ID: <CAFBinCAKNUA5_fz4bXqj-aCaDEHk--Ax5GXJt+nzVKSjbVHxLg@mail.gmail.com>
References: <20180822105547.9634-1-johan@kernel.org> <20180822105547.9634-5-johan@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180822105547.9634-5-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: johan@kernel.org
Cc: robh+dt@kernel.org, gregkh@linuxfoundation.org, frowand.list@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, carlo@endlessm.com, ulf.hansson@linaro.org
List-Id: devicetree@vger.kernel.org

Hi Johan,

On Wed, Aug 22, 2018 at 12:57 PM Johan Hovold <johan@kernel.org> wrote:
>
> Use the new of_get_compatible_child() helper to lookup the slot child
> node instead of using of_find_compatible_node(), which searches the
> entire tree and thus can return an unrelated (i.e. non-child) node.
that new helper is much appreciated, thank you!

> This also addresses a potential use-after-free (e.g. after probe
> deferral) as the tree-wide helper drops a reference to its first
> argument (i.e. the node of the device being probed).
>
> While at it, also fix up the related slot-node reference leak.
not sure why both issues went unnoticed so far - good that they're now
both fixed. thank you!

> Fixes: ed80a13bb4c4 ("mmc: meson-mx-sdio: Add a driver for the Amlogic Meson8 and Meson8b SoCs")
> Cc: stable <stable@vger.kernel.org>     # 4.15
backporting only works if the patch introducing
of_get_compatible_child is also backported
do we have to inform Greg somehow?

> Cc: Carlo Caione <carlo@endlessm.com>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Johan Hovold <johan@kernel.org>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>


Regards
Martin
