From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 2/2] arm64: dts: meson: add g12a x96 max board
Date: Wed, 19 Dec 2018 15:31:56 -0800
Message-ID: <7himzpt7o3.fsf@baylibre.com>
References: <20181219002620.12138-1-khilman@baylibre.com>
 <20181219002620.12138-2-khilman@baylibre.com>
 <877eg51olo.fsf@dell.be.48ers.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <877eg51olo.fsf@dell.be.48ers.dk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Peter Korsgaard <peter@korsgaard.com> writes:

>>>>>> "Kevin" == Kevin Hilman <khilman@baylibre.com> writes:
>
>  > Add the G12a (S905X2) based X96 Max board[1].
>  > There is no branding for the manufacturer anywhere on the product, so it
>  > took some digging to find the manufacturer.  But since there's nothing
>  > about the maker on the product I've left it out of the DT name because
>  > 1) nobody will no that name and 2) keeps the DT filename shorter.
>
> s/no/know/

Thanks.

>  > [1] https://www.cnx-software.com/2018/09/25/x96-max-amlogic-s905x2-tv-box/
>
>  > Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>  > Signed-off-by: Kevin Hilman <khilman@baylibre.com>
>  > ---
>  > Special thanks to Martin Blumenstingl for extra digging for the manufacturer
>
>  >  .../boot/dts/amlogic/meson-g12a-x96-max.dts   | 28 +++++++++++++++++++
>  >  1 file changed, 28 insertions(+)
>  >  create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
>
>  > diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
>  > b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
>  > new file mode 100644
>  > index 000000000000..fe94765b671e
>  > --- /dev/null
>  > +++ b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
>  > @@ -0,0 +1,28 @@
>  > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>  > +/*
>  > + * Copyright (c) 2018 Amlogic, Inc. All rights reserved.
>
> Amlogic? Shouldn't that be Baylibre?

Yes.

Thanks for the review,

Kevin
