From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 0/3] Khadas VIM support (Amlogic Meson GXL S905X)
Date: Wed, 22 Mar 2017 09:17:27 -0700
Message-ID: <m2zigdmgko.fsf@baylibre.com>
References: <20170304215126.7020-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170304215126.7020-1-martin.blumenstingl@googlemail.com>
 (Martin Blumenstingl's message of "Sat, 4 Mar 2017 22:51:23 +0100")
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, narmstrong@baylibre.com, catalin.marinas@arm.com, will.deacon@arm.com, robh+dt@kernel.org, carlo@caione.org, linux-amlogic@lists.infradead.org, gouwa@szwesion.com, afaerber@suse.de, linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
List-Id: devicetree@vger.kernel.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> This series adds support for the Khadas VIM and Khadas VIM Pro boards
> (both are provided through a single .dts as the only two differences are
> the eMMC size and different SDIO WIFI chips - both are Broadcom brcmfmac
> based though).
> More details can be found on the official website: [0]
>
> I have tested this on a Khadas VIM Pro board. It would be nice if someone
> with a non-Pro board could give it a try as well.

Applied to v4.12/dt64

After all the discussion, I left patch 1 as is.

Kevin
