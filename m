From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 2/2] arm64: dts: meson: add g12a x96 max board
Date: Tue, 8 Jan 2019 23:32:01 +0100
Message-ID: <CAFBinCB393w2cBacB6c_79Xt22suWWfx5omEKmzBJx02vb3fKw@mail.gmail.com>
References: <20181219002620.12138-1-khilman@baylibre.com>
 <20181219002620.12138-2-khilman@baylibre.com>
 <CAFBinCCbPbSQZeF1mzfBfLt+cJ0P=ajHznZM2prn600NO7G3sA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAFBinCCbPbSQZeF1mzfBfLt+cJ0P=ajHznZM2prn600NO7G3sA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Kevin,

On Sat, Dec 22, 2018 at 5:57 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Kevin,
>
> On Wed, Dec 19, 2018 at 1:26 AM Kevin Hilman <khilman@baylibre.com> wrote:
> >
> > Add the G12a (S905X2) based X96 Max board[1].
> >
> > There is no branding for the manufacturer anywhere on the product, so it
> > took some digging to find the manufacturer.  But since there's nothing
> > about the maker on the product I've left it out of the DT name because
> > 1) nobody will no that name and 2) keeps the DT filename shorter.
> based on the cnx-soft article and my own board I would add the
> following section:
> -----
> There are three variants of this device:
I had a chat with Chris Moore (who replied on the dt-bindings patch).

> - 2GB LPDDR4, 16GB flash, 2.4G WiFi, 100M Ethernet
> - 4GB LPDDR4, 32GB flash, dual band AC WiFi, Bluetooth 4.x, Gigabit Ethernet
I have the 4GB LPDDR4, 32G flash variant which uses:
RAM: SpecTek LPDDR4 (chip markings: PS082-062 BT / on the side it says R5JH)
eMMC: Micron (chip markings: 8FAI8 SJJML / on the side it says JXML ->
this might be "MTFC32GAKAECN-AIT")
WiFi: Ampak AP6356S

> - 4GB LPDDR4, 64GB flash, dual band  AC WiFi, Bluetooth 4.x, Gigabit Ethernet
Chris has the 4GB LPDDR4, 64GB flash variant.
RAM: same as on mine
eMMC: Samsung KLMCG4JENB-B041
WiFi: same as on mine


Regards
Martin
