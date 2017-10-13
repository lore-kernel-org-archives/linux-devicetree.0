From: =?UTF-8?Q?Honza_Petrou=C5=A1?= <jpetrous-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 02/12] [media] cxd2880-spi: Add support for CXD2880 SPI interface
Date: Fri, 13 Oct 2017 12:26:58 +0200
Message-ID: <CAJbz7-1Ad6L60KCmwtFDPzYH-vcBnzT5vDf-63YMRbyFQRDk+g@mail.gmail.com>
References: <20171013054635.20946-1-Yasunari.Takiguchi@sony.com>
 <20171013055928.21132-1-Yasunari.Takiguchi@sony.com> <CAJbz7-0T=LUSTr59kPDk4kVkHLh5XEeNEkA2T=hG=P_fXrrU=g@mail.gmail.com>
 <eab5bd7b-d909-343d-7078-842e3d0d9ab9@sony.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <eab5bd7b-d909-343d-7078-842e3d0d9ab9-7U/KSKJipcs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Takiguchi, Yasunari" <Yasunari.Takiguchi-7U/KSKJipcs@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "tbird20d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <tbird20d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "Yamamoto, Masayuki" <Masayuki.Yamamoto-7U/KSKJipcs@public.gmane.org>, "Nozawa, Hideki (STWN)" <Hideki.Nozawa-7U/KSKJipcs@public.gmane.org>, "Yonezawa, Kota" <Kota.Yonezawa-7U/KSKJipcs@public.gmane.org>, "Matsumoto, Toshihiko" <Toshihiko.Matsumoto-7U/KSKJipcs@public.gmane.org>, "Watanabe, Satoshi (SSS)" <Satoshi.C.Watanabe-7U/KSKJipcs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Takiguchi,

>> If I understand it right, it uses SPI bus also for passing transport stream
>> to the host system (also having some pid piltering inside!), isn't it?
>> It would be interesting to know what is the max throughput of the CXD's SPI?
>
> Yes, max clock rate of spi is written in sony-cxd2880.txt of [patch v4 01/12].
>
>   spi-max-frequency = <55000000>; /* 55MHz */

Ehh, I overlooked this! Thanks for pointing me out.

BTW, is there any device, preferable some devboard with this silicon
on the market?

/Honza
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
