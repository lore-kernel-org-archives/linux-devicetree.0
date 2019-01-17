From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 2/2] arm64: dts: meson: add g12a x96 max board
Date: Thu, 17 Jan 2019 20:55:34 +0100
Message-ID: <CAFBinCDfEFH_9pa_ATm-k5OaYMQwVfiGzN6d5dF5dMDGYbqHxg@mail.gmail.com>
References: <20181219002620.12138-1-khilman@baylibre.com>
 <20181219002620.12138-2-khilman@baylibre.com>
 <CAFBinCCbPbSQZeF1mzfBfLt+cJ0P=ajHznZM2prn600NO7G3sA@mail.gmail.com>
 <CAFBinCB393w2cBacB6c_79Xt22suWWfx5omEKmzBJx02vb3fKw@mail.gmail.com>
 <CACdvmAg3=GmcLOKJ33K6aGks7DRnityd4KiU30qwCb-YWz_EPA@mail.gmail.com>
 <CAFBinCD64ttcjq-aM_PJ4eAQcVmWk2+ptHUKznniPzALgKSOEA@mail.gmail.com>
 <CACdvmAhi92uLcBfzoJeqkC94np8t7wg7ivb3dz11cTvAO5D60w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACdvmAhi92uLcBfzoJeqkC94np8t7wg7ivb3dz11cTvAO5D60w@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Da Xue <da@lessconfused.com>
Cc: Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Jan 10, 2019 at 7:54 PM Da Xue <da@lessconfused.com> wrote:
>
> Hi,
>
> To be on the safe side, I would add the PCB revision number and WiFi module name.
my PCB states: Q5X2 V3.0 18393

> Most of the WiFi modules are from Fn link so simply denoting the AP6356S may be sufficient to distinguish future PCB revisions and wireless modules.
our .dtbs mostly don't care about the WiFi chip (because it can be
auto-detected using the SDIO ID).
however, Bluetooth support on these modules is different because a
different WiFi / Bluetooth combo chip manufacturer also means
different dt-bindings

regarding the .dts name so far we have:
- meson-g12a-x96-max.dts
and your suggestions:
- meson-g12a-x96-max-ap6356s.dts
- meson-g12a-x96-max-3.0-ap6356s.dts


Regards
Martin
