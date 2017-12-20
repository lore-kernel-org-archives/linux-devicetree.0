From: "Takiguchi, Yasunari" <Yasunari.Takiguchi@sony.com>
Subject: RE: [PATCH v4 07/12] [media] cxd2880: Add top level of the driver
Date: Wed, 20 Dec 2017 01:18:00 +0000
Message-ID: <02699364973B424C83A42A84B04FDA85440BF4@JPYOKXMS113.jp.sony.com>
References: <20171013054635.20946-1-Yasunari.Takiguchi@sony.com>
        <20171013060934.21612-1-Yasunari.Takiguchi@sony.com>
 <20171213172509.1942e951@vento.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171213172509.1942e951@vento.lan>
Content-Language: ja-JP
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@s-opensource.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "tbird20d@gmail.com" <tbird20d@gmail.com>, "frowand.list@gmail.com" <frowand.list@gmail.com>, "Yamamoto, Masayuki" <Masayuki.Yamamoto@sony.com>, "Nozawa, Hideki (STWN)" <Hideki.Nozawa@sony.com>, "Yonezawa, Kota" <Kota.Yonezawa@sony.com>, "Matsumoto, Toshihiko" <Toshihiko.Matsumoto@sony.com>, "Watanabe, Satoshi (SSS)" <Satoshi.C.Watanabe@sony.com>, "Takiguchi, Yasunari" <Yasunari.Takiguchi@sony.com>
List-Id: devicetree@vger.kernel.org

Hi, Mauro

> > +
> > +#define pr_fmt(fmt) KBUILD_MODNAME ": %s: " fmt, __func__
> 
> Same comments as on other patches: use SPDX and dev_foo() for printing
> messages.

About printing messages pr_fmt, I also replied a comment to [PATCH v4 02/12] [media] cxd2880-spi: Add support for CXD2880 SPI interface.
Please refer to the comment.

Thanks,
Takiguchi
