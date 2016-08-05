From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v4 3/3] ARM: davinci_all_defconfig: enable SMSC ethernet
 PHY
Date: Fri, 05 Aug 2016 16:46:17 -0700
Message-ID: <m2a8gqkcdy.fsf@baylibre.com>
References: <20160804144332.4841-1-kbeldan@baylibre.com>
 <20160805202951.2848-1-kbeldan@baylibre.com>
 <20160805202951.2848-4-kbeldan@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160805202951.2848-4-kbeldan@baylibre.com> (Karl Beldan's
 message of "Fri, 5 Aug 2016 20:29:51 +0000")
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Karl Beldan <kbeldan@baylibre.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, karl.beldan+oss@gmail.com, Sekhar Nori <nsekhar@ti.com>, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Karl Beldan <kbeldan@baylibre.com> writes:

> The LCDK embeds a LAN8710.
>
> Cc: Sekhar Nori <nsekhar@ti.com>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Signed-off-by: Karl Beldan <kbeldan@baylibre.com>

Acked-by: Kevin Hilman <khilman@baylibre.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>

Tested on da850-lcdk with an NFS root filesystem.

Kevin
