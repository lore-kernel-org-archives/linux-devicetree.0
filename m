From: Jianxin Pan <jianxin.pan@amlogic.com>
Subject: Re: [PATCH v9 0/2] mtd: rawnand: meson: add Amlogic NAND driver
 support
Date: Sat, 19 Jan 2019 02:11:38 +0800
Message-ID: <487cf528-fe4a-ec9c-754a-9e9188f16495@amlogic.com>
References: <1547566684-57472-1-git-send-email-jianxin.pan@amlogic.com>
 <20190115175232.3d82d4a9@xps13>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190115175232.3d82d4a9@xps13>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh@kernel.org>, Liang Yang <liang.yang@amlogic.com>, Jian Hu <jian.hu@amlogic.com>, Hanjie Lin <hanjie.lin@amlogic.com>, Victor Wan <victor.wan@amlogic.com>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.o
List-Id: devicetree@vger.kernel.org

Hi Miquel,

On 2019/1/16 0:52, Miquel Raynal wrote:
> Hi Jianxin,
> 
> Jianxin Pan <jianxin.pan@amlogic.com> wrote on Tue, 15 Jan 2019
> 23:38:02 +0800:
> 
>> These two patches try to add initial NAND driver support for Amlogic Meson
>> SoCs, current it has been tested on GXL(p212) and AXG(s400) platform.
>>
>> Changes since V8 at [9]
>>  - fix build failre at object_is_on_stack
>>  - update Kconfig as Martin's suggested
> 
> Thanks for this last version, looks good to me. Could you please send a
> patch to add a MAINTAINERS entry?
>
OK.
> Also, can we face any deadly failure if someone compiles this driver
> without the MMC clock driver updated?
>
Without the MMC clock driver
1) This driver can be built successfully.
2) The probe will fail when get clocks defined in MMC clock driver. 

> Thanks,
> Miquèl
> 
> .
> 
