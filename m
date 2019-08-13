Return-Path: <SRS0=c+xj=WJ=public-files.de=frank-w@kernel.org>
Date: Wed, 14 Aug 2019 00:02:47 +0200
In-Reply-To: <CAL_Jsq+fW=x8MoL3GMj6+ZKC3fd6F6+8Rtx=j5R9vEuL9UHCuQ@mail.gmail.com>
References: <20190812121511.4169-1-frank-w@public-files.de> <20190812121511.4169-2-frank-w@public-files.de> <CAL_Jsq+fW=x8MoL3GMj6+ZKC3fd6F6+8Rtx=j5R9vEuL9UHCuQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 01/10] dt-bindings: add powercontroller
Reply-to: frank-w@public-files.de
Message-Id: <20190813220359.C43812067D@mail.kernel.org>
From: SRS0=c+xj=WJ=public-files.de=frank-w@kernel.org
To: linux-mediatek@lists.infradead.org, Rob Herring <robh+dt@kernel.org>
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Richard Fontana <rfontana@redhat.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Lee Jones <lee.jones@linaro.org>, "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc@vger.kernel.org>, Allison Randal <allison@lohutok.net>, Nicolas Ferre <nicolas.ferre@microchip.com>, devicetree@vger.kernel.org, "open list:THERMAL" <linux-pm@vger.kernel.org>, Sean Wang <sean.wang@mediatek.com>, "Tianping . Fang" <tianping.fang@mediatek.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Matthias Brugger <matthias.bgg@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Eddie Huang <eddie.huang@mediatek.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Alessandro
List-ID: <devicetree@vger.kernel.org>

<a.zummo@towertech.it>,Josef Friedl <josef.friedl@speed.at>,Greg Kroah-Hartman <gregkh@linuxfoundation.org>,Sebastian Reichel <sre@kernel.org>,"David S. Miller" <davem@davemloft.net>
From: Frank Wunderlich <frank-w@public-files.de>
Message-ID: <71AE16DE-2AA6-4368-8CC1-CEF7E2BDDE49@public-files.de>
X-Provags-ID: V03:K1:P0aY3EQbJ8H17loheXxAeUqp3MGji/jW1Tw/YktyjjMNCxeTauI
 /XalCJ/JacMjfQ9909IDyl+yTGMr0qE+/7dQHob8JEpuFIg2JvA8ouh7c+y0RREvho+msjj
 QBrfaULEIAlMOClppH8wYRRCG7+F01iUn4IDczTtf5GirApdSSnfLJRdm5sihZKYjaOg5LL
 iQaoSSgPtt7axpGa3DHLQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:0Ma87If5zzo=:tB+f2aaRWqNTJAtqDI94EP
 2EfhL4Ah2SOkQFVvt14MU60nR48hynhWJzpRnCR29YiEpZlM7RqhrhTl0TorVg1m6r/NYCl5T
 9pBIkJdIYIDzfGAIMgcJ0fSKk3WFDKcB+c9c0TE+vgXdGk0fAC6TrMP8UWtnqm/SgLlUL0cTQ
 BLsXI/+C2D5DZkNNcYYSn7GaIgGaLAw9vtWVo3nZeGCKELjXHWkMzOqcXdEIGSSILlAh4RoSe
 VphfjShVfhZXEFsIcKcHMxYj3DpPIAuXT206sP09K8aYeKVBXcywEGJOfr9JhiJkY8DdOvtaw
 8ya+NiPa04VQwQV89Z/t0unGOoUBmNlzWVnKQVfaWB3f+Oc7Hm4z+OPV5QIkviFzhCcxnh4bs
 lBjh+tcyN8mnd/urTYj6MAjwsJ5BmcF/SZFnsazQRHnnG7n+WIgTnd3sq7MtngpVUckpvUOT/
 0TKs79h58Su5cAAq0Gn7RFQdCEgi+qjpWn7WZtqYXTn9J4rMkbASp0dK56KOglFvCldhO++Pj
 SOO66V1agiFqealeAqFzvAfPDHWpI17x1pMBtY58p6EyWhqzV8E9Au6fcSZKfRDug1BtDRsga
 qG1cCErwWLYiUhIlPV14FpZOe++BfjaOXyG5Oxs8Jde4DSPvIJNHbsm2shrGBVnWNae3nuPiH
 vfmNfupc8feICGeusq+m6Nnd835UBI+4KidtWbU7Kn2qrytDhtWEBwApUJAFsmnK8LWY1Iy1p
 A/sSYYmJmmB0lBnPqmlhSM0Scd/5xMFfXOORQBNfVUtbaCCtlIdeYXMpmkqLf03F0OtE+rp3O
 voRSyfx2M4cosVCIOj+uUggRF+2ed6kHtKXartSmh43X7QiV0vpBp6uyHMPZKX3rXGEaZ2ead
 /veekJUS9kuN9nQfHKl/189L1ukZnNrX/JCRPMl0DtwhBZDRG8MOVsLRl9eFWyZEQ5V9lTQTd
 gQf+Ga/mJHUcB1ATZwhnWiUXF+9Bw4mkNvniprz4/7Ya1dQx9Zfo2ZwMQwHovKuiZPl3BQgGA
 hWu6zYVWuUyhti4DTuhTsdTTq7YFBdvZ0hkT4+yoGZozn/tQKafVsRzNSZU5MlnaS1QI8b+Se
 I0abvvgEgHZD4gsGulKdneIfw3mKzlALweNdNmYaCHj0dSJy1So1QFMuEzvLWmy4WDB1QnHuq
 SJA5k=

Thank you for review

Am 13=2E August 2019 17:25:47 MESZ schrieb Rob Herring <robh+dt@kernel=2Eo=
rg>:

> How does this get to v5 with such a terrible subject? At least give
some indication this is for some Mediatek chip=2E


I try to make a better one :)

> The recipient list needs some work too=2E Don't Cc git committers that
get_maintainers=2Epl lists=2E


I thought it should be send to all listed by this script=2E=2E=2Ewhich hav=
e to be adressed?

> Unrelated change to what the subject says=2E Clean-ups and new things in
separate patches please=2E

=2E=2E=2E

> How is this related to 'powercontroller'?


I will split changes into separate commits=2E

Regards Frank
