From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v2 0/5] Meson8b: add support for the Endless Mini EC-100
Date: Wed, 26 Sep 2018 10:50:55 +0200
Message-ID: <7hd0t063rk.fsf@baylibre.com>
References: <20180922151003.4736-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180922151003.4736-1-martin.blumenstingl@googlemail.com>
 (Martin Blumenstingl's message of "Sat, 22 Sep 2018 17:09:58 +0200")
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, drake@endlessm.com, robh+dt@kernel.org, carlo@caione.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> This series adds support for the "Endless Mini" grapefruit-sized mini PC
> from Endless Mobile, Inc. The internal name of this device is EC-100
> (this can be found for example in the GPL kernel tree which is based on
> Amlogic's 3.10 kernel: [0]).
>
> The board is using a Meson8b (S805) SoC with various peripherals.
> The biggest difference compared to boards which are based on Amlogic's
> reference designs is that this board comes with an embedded micro-
> controller called "EC" which makes the system LED pulse during boot
> and allows powering off the board. It also comes with a 10/100 Mbit/s
> Ethernet port and one USB host port.
> There are two variants:
> - 2GB RAM, 32GB storage, 802.11bgn and Bluetooth 4.0
> - 1GB RAM, 24GB storage, neither wifi nor Bluetooth
>
> This series contains support for the new board as well as supporting
> patches for the new vendor prefix and the pin definitions in
> meson8b.dtsi so various peripherals can be enabled.

Applied to v4.20/dt,

Thanks,

Kevin
