From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 2/2] arm64: dts: meson: add g12a x96 max board
Date: Wed, 9 Jan 2019 23:22:21 +0100
Message-ID: <CAFBinCD64ttcjq-aM_PJ4eAQcVmWk2+ptHUKznniPzALgKSOEA@mail.gmail.com>
References: <20181219002620.12138-1-khilman@baylibre.com>
 <20181219002620.12138-2-khilman@baylibre.com>
 <CAFBinCCbPbSQZeF1mzfBfLt+cJ0P=ajHznZM2prn600NO7G3sA@mail.gmail.com>
 <CAFBinCB393w2cBacB6c_79Xt22suWWfx5omEKmzBJx02vb3fKw@mail.gmail.com>
 <CACdvmAg3=GmcLOKJ33K6aGks7DRnityd4KiU30qwCb-YWz_EPA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACdvmAg3=GmcLOKJ33K6aGks7DRnityd4KiU30qwCb-YWz_EPA@mail.gmail.com>
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

Hi,

On Wed, Jan 9, 2019 at 1:11 AM Da Xue <da@lessconfused.com> wrote:
>
> I would be careful about adding TV boxes from unknown manufacturers in China. The manufacturer can and will change part numbers willy nilly and cause a ton of confusion. They are assembled with the cheapest part at the time so the DDR, WiFi module, eMMC, and even PCB will change without warning.
this is why I sent an update with the actual hardware which was
available for testing at the time this patch written / tested.

do you have any suggestion how to add support for this device while
being prepare for future changes?


Regards
Martin
