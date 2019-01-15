From: Jianxin Pan <jianxin.pan@amlogic.com>
Subject: Re: [PATCH v8 0/2] mtd: rawnand: meson: add Amlogic NAND driver
 support
Date: Tue, 15 Jan 2019 23:44:08 +0800
Message-ID: <18ad7184-3bbe-4bd1-826a-fce5d31c215c@amlogic.com>
References: <1544973463-59523-1-git-send-email-jianxin.pan@amlogic.com>
 <20190115094911.75f4edc9@xps13>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190115094911.75f4edc9@xps13>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh@kernel.org>, Liang Yang <liang.yang@amlogic.com>, Jian Hu <jian.hu@amlogic.com>, Hanjie Lin <hanjie.lin@amlogic.com>, Victor Wan <victor.wan@amlogic.com>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.o
List-Id: devicetree@vger.kernel.org

Hi Miquel,

On 2019/1/15 16:49, Miquel Raynal wrote:
> Hi Jianxin,
> 
> Jianxin Pan <jianxin.pan@amlogic.com> wrote on Sun, 16 Dec 2018
> 23:17:41 +0800:
> 
>> These two patches try to add initial NAND driver support for Amlogic Meson
>> SoCs, current it has been tested on GXL(p212) and AXG(s400) platform.
>>
>> Changes since V6 at [8]
>>  - fix bitflips checking for blank pages
>>  - trace the latest commit with nand/next branch
>>  - checking the return of meson_nand_op_get_dma_safe_*input/output*_buf
>>  - add .detach_chip for free meson_nand.data_buf/info_buf
>>
> 
> Can you send a v9 with the build failre (object_is_on_stack pb) fixed
> and the Kconfig entry updated (the Meson common clock thing) as
> suggested by Martin?
I sent v9 just now, object_is_on_stack build fail is fixed and Kconfig is updated as Martin suggested.
Thank you for your time.
> 
> 
> Thanks,
> Miquèl
> 
> .
> 
