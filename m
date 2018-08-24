From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 4/9] mmc: meson-mx-sdio: fix OF child-node lookup
Date: Fri, 24 Aug 2018 08:41:01 +0200
Message-ID: <20180824064101.GT14967@localhost>
References: <20180822105547.9634-1-johan@kernel.org>
 <20180822105547.9634-5-johan@kernel.org>
 <CAFBinCAKNUA5_fz4bXqj-aCaDEHk--Ax5GXJt+nzVKSjbVHxLg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAFBinCAKNUA5_fz4bXqj-aCaDEHk--Ax5GXJt+nzVKSjbVHxLg@mail.gmail.com>
Sender: stable-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: johan@kernel.org, robh+dt@kernel.org, gregkh@linuxfoundation.org, frowand.list@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, carlo@endlessm.com, ulf.hansson@linaro.org
List-Id: devicetree@vger.kernel.org

On Thu, Aug 23, 2018 at 08:50:23PM +0200, Martin Blumenstingl wrote:
> On Wed, Aug 22, 2018 at 12:57 PM Johan Hovold <johan@kernel.org> wrote:

> > Fixes: ed80a13bb4c4 ("mmc: meson-mx-sdio: Add a driver for the Amlogic Meson8 and Meson8b SoCs")
> > Cc: stable <stable@vger.kernel.org>     # 4.15
>
> backporting only works if the patch introducing
> of_get_compatible_child is also backported
> do we have to inform Greg somehow?

Greg is on CC, but he also sends out a notice in case a stable patch
fails to apply or compile.

Note that if the helper had gone in before the rest of the series, I
could have referenced it in the stable tags using its commit id in order
to facilitate the process:

	Cc: stable <stable@vger.kernel.org>     # 4.15: <commit id>

> > Cc: Carlo Caione <carlo@endlessm.com>
> > Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > Cc: Ulf Hansson <ulf.hansson@linaro.org>
> > Signed-off-by: Johan Hovold <johan@kernel.org>
> Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Thanks for the ack.

Johan
