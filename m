From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 1/1] mtd: rawnand: meson: set oob layout ops
Date: Thu, 21 Mar 2019 20:48:34 +0100
Message-ID: <CAFBinCD65-e2Kx3vw60FGFJvauof7ADV3e=bt6A4jUNC0K64Ng@mail.gmail.com>
References: <1553170441-23448-1-git-send-email-liang.yang@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1553170441-23448-1-git-send-email-liang.yang@amlogic.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Liang Yang <liang.yang@amlogic.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh@kernel.org>, Jian Hu <jian.hu@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>, Hanjie Lin <hanjie.lin@amlogic.com>, Victor Wan <victor.wan@amlogic.com>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 21, 2019 at 1:14 PM Liang Yang <liang.yang@amlogic.com> wrote:
>
> Specify the oob layout operation to avoid no oob scheme defined for
> some nand flash.
>
> Fixes: 8fae856c5350 ("mtd: rawnand: meson: add support for Amlogic NAND flash controller")
> Signed-off-by: Liang Yang <liang.yang@amlogic.com>
this patch solves the "No oob scheme defined for oobsize 1280" on my
Meson8m2 M8S board, so:
Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

to give a bit of context on my Tested-by:
I tested this with my work-in-progress series and a hack to make the
kzalloc() in meson_nfc_read_buf() return an aligned address (by
allocating PAGE_SIZE instead of PER_INFO_BYTE) on my Meson8m2 M8S
board.
it's now progressing to the state where Linux tries to find the BBT
which it can't (because the vendor kernel which was used to format the
NAND flash is shipping a custom BBT format).
before this patch I couldn't get past the "No oob scheme defined for
oobsize 1280" error.


Regards
Martin
