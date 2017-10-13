From: "Takiguchi, Yasunari" <Yasunari.Takiguchi@sony.com>
Subject: Re: [PATCH v4 02/12] [media] cxd2880-spi: Add support for CXD2880 SPI
 interface
Date: Fri, 13 Oct 2017 18:10:31 +0900
Message-ID: <eab5bd7b-d909-343d-7078-842e3d0d9ab9@sony.com>
References: <20171013054635.20946-1-Yasunari.Takiguchi@sony.com>
 <20171013055928.21132-1-Yasunari.Takiguchi@sony.com>
 <CAJbz7-0T=LUSTr59kPDk4kVkHLh5XEeNEkA2T=hG=P_fXrrU=g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJbz7-0T=LUSTr59kPDk4kVkHLh5XEeNEkA2T=hG=P_fXrrU=g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Honza_Petrou=c5=a1?= <jpetrous@gmail.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "tbird20d@gmail.com" <tbird20d@gmail.com>, "frowand.list@gmail.com" <frowand.list@gmail.com>, "Yamamoto, Masayuki" <Masayuki.Yamamoto@sony.com>, "Nozawa, Hideki (STWN)" <Hideki.Nozawa@sony.com>, "Yonezawa, Kota" <Kota.Yonezawa@sony.com>, "Matsumoto, Toshihiko" <Toshihiko.Matsumoto@sony.com>, "Watanabe, Satoshi (SSS)" <Satoshi.C.Watanabe@sony.com>, yasunari.takiguchi@sony.com
List-Id: devicetree@vger.kernel.org

Hi Honza

> If I understand it right, it uses SPI bus also for passing transport stream
> to the host system (also having some pid piltering inside!), isn't it?
> It would be interesting to know what is the max throughput of the CXD's SPI?

Yes, max clock rate of spi is written in sony-cxd2880.txt of [patch v4 01/12].

  spi-max-frequency = <55000000>; /* 55MHz */

Takiguchi 
