Return-Path: <SRS0=c+xj=WJ=public-files.de=frank-w@kernel.org>
Date: Tue, 13 Aug 2019 22:51:32 +0200
In-Reply-To: <CAL_Jsq+fW=x8MoL3GMj6+ZKC3fd6F6+8Rtx=j5R9vEuL9UHCuQ@mail.gmail.com>
References: <20190812121511.4169-1-frank-w@public-files.de> <20190812121511.4169-2-frank-w@public-files.de> <CAL_Jsq+fW=x8MoL3GMj6+ZKC3fd6F6+8Rtx=j5R9vEuL9UHCuQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 01/10] dt-bindings: add powercontroller
Reply-to: frank-w@public-files.de
Message-Id: <20190813205302.4E56020651@mail.kernel.org>
From: SRS0=c+xj=WJ=public-files.de=frank-w@kernel.org
To: linux-mediatek@lists.infradead.org, Rob Herring <robh+dt@kernel.org>
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Richard Fontana <rfontana@redhat.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Lee Jones <lee.jones@linaro.org>, "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc@vger.kernel.org>, Allison Randal <allison@lohutok.net>, Nicolas Ferre <nicolas.ferre@microchip.com>, devicetree@vger.kernel.org, "open list:THERMAL" <linux-pm@vger.kernel.org>, Sean Wang <sean.wang@mediatek.com>, "Tianping . Fang" <tianping.fang@mediatek.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Matthias Brugger <matthias.bgg@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Eddie Huang <eddie.huang@mediatek.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Alessandro
List-ID: <devicetree@vger.kernel.org>

<a.zummo@towertech.it>,Josef Friedl <josef.friedl@speed.at>,Greg Kroah-Hartman <gregkh@linuxfoundation.org>,Sebastian Reichel <sre@kernel.org>,"David S. Miller" <davem@davemloft.net>
From: Frank Wunderlich <frank-w@public-files.de>
Message-ID: <CB9E3020-413C-44CA-AE4D-7EDA8B94C8A8@public-files.de>
X-Provags-ID: V03:K1:uA6kSvGsj3SKdMEWtqkIQlmYd51Bk43Q94sXnUFEdaBr+gBwRVB
 1WQTE6xl14d0MeByGohEyiU+VF8ZqTAz1v+uOmeXFfD39CT/Mcz19brWFJ61U8nHF/sIXiI
 cz1Xz+Hglc+JdoBD8bCl36GFHJixb1BjArDLJKzwBW5rfqGhE2JMeqKrdd5gpUyhbnMIdDm
 qR3dBPe/6riX16145sAdQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:7zBJDoC1bE8=:7UVCCF8OF9pB7vNiGKRHKn
 4+Ujji+Sa/h5WkXTbobz8l+Or/NaufDCf4l4mgXIr4f69ax0jxj4jKg2CzPkMDpnReS8yzJg/
 xDToD3tplPlmkskGjeuGk3WP7/pl7UcQ0au5gAGsTiS7a3HQ0vgnNWunAhIni9nJ5Ps19de+3
 RM1uusHg2n4DDOGCKNQGhIiIV1pDDPW6PduGI7wsCNRQRc2TXFQ+8tNo5dRW05GADCkceDcxh
 RRSN80F+Fuc/5nJUtSvGiItpPvkQpeIWdkKPWL2VUfKgSMNBC754s9wQHmdhY/C1PNBoRpQRU
 nwl+T2C7cNEN9RA3sDl0fLtpEHtRNXpCL2L23+lEnDCOTyr7Ve5YIU6wDHWMk21VDu8Tfrjik
 YEPllnVRJ/dQUbycrWG2S5ZxBwh9EdlyjZUPqoCrm/y9h9L4ZzfG0W654Hi77aSTVNeutyBv6
 Uda5P3V+Uof6xTzdexVJkz+xiHVwLlqQZa0ajxp9p01vviWvYTRTY3c5kvv45LXReCIriT6uo
 Tyo3hpKjdI9p0d7y1qfpARDfmGJzj+XnnxTEdNmg6625j1eQYEDW9kv1KlmL4azI+A+cDYh8V
 7e/ecqozjp2aUjizmlZXBGbJqqvMBN/NJuIQF8t679bBXQQK37qgunVxgZZz16f1YyX+dUqLM
 dAu1WnvEW3fUyIHhC2IK7kFrhTmYgTrGxJvOSkeHv/fTdvzygOEPbBJs+aUW8iPQ9F/FJk/WS
 FQJEm11qRAwWQAEbxRrwq1DP7+ZrZi2GJ4iblo4p4QZTlK1ZrO57zdyKUnLOqLLELtzoW+szv
 Tw9iPQZCup2OF3Q2gscWOP/zQPUdKEnMI53mtZMjdWtev2Fm8q3CmYYjltnBWs+95AL0v43wf
 eT6Jv6TcGIDEaAZzLSc4a6UJiynvyvco8x4I/lTi3nfVdiVLjNGx2ibmTY85ZjVnJd+sED0gE
 ZfjgDIjneVqK7IOHsGZqgKRSI/yHpCPY4e4ej5KSE6g/7tpgN9pVdE/I99xNJWsOIGUh1PTel
 e4nEJuFhq+/romjuS83hhjurdae00fwQ+GGR5tpaOD+H2B0VJQUivyBl5fNq/ssAqDz9UOkb8
 G/qKABTZhCAkTUeRUNm2ErSX+0AcsPfV7guG871zxAOcmXjXJMSdx3WLdcYwIdjgHKZXBvdhS
 5BxWcnU8dh33tmAqCMt+F23wytcC8LcOu907Mei7m6tlymMw==

Thank you for review

Am 13=2E August 2019 17:25:47 MESZ schrieb Rob Herring <robh+dt@kernel=2Eo=
rg>:
>How does this get to v5 with such a terrible subject? At least give
>some indication this is for some Mediatek chip=2E

I try to make a better one :)

>The recipient list needs some work too=2E Don't Cc git committers that
>get_maintainers=2Epl lists=2E

I thought it should be send to all listed by this script=2E=2E=2Ewhich hav=
e to be adressed?

>Unrelated change to what the subject says=2E Clean-ups and new things in
>separate patches please=2E
=2E=2E=2E
>How is this related to 'powercontroller'?

I will split changes into separate commits=2E

Regards Frank
