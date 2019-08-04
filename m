From: Aymeric <mulx@aplu.fr>
Subject: Re: [PATCH] ARM: dts: meson8b: add ethernet fifo sizes
Date: Sun, 4 Aug 2019 21:38:09 +0200
Message-ID: <b5ad180d-af13-cc37-87da-1aa72f10f518@aplu.fr>
References: <20190718093623.23598-1-jbrunet@baylibre.com>
 <CAFBinCBefuCvTL0E_zf=EQDLyTjE5sQD-TkHNj2vQ2UOCsmtkA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAFBinCBefuCvTL0E_zf=EQDLyTjE5sQD-TkHNj2vQ2UOCsmtkA@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
List-Id: devicetree@vger.kernel.org


Le 23/07/2019 à 21:56, Martin Blumenstingl a écrit :
> On Thu, Jul 18, 2019 at 11:36 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
>> If unspecified in DT, the fifo sizes are not automatically detected by
>> the dwmac1000 dma driver and the reported fifo sizes default to 0.
>> Because of this, flow control will be turned off on the device.
>>
>> Add the fifo sizes provided by the datasheet in the SoC in DT so
>> flow control may be enabled if necessary.
>>
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>
> I wonder if this "fixes" some of the performance issues on Odroid-C1
> testing this is now on my TODO-list for the weekend


Good! and maybe that will fix the stability issue I'm seeing when using
the board with a 1 gigabit link! (cf
http://lists.infradead.org/pipermail/linux-amlogic/2019-June/012341.html)

I'll try that asap on my board too :)

Thanks.

-- 
Aymeric
