From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v3 3/3] ARM64: dts: meson-gx: add dmcbus and canvas nodes.
Date: Wed, 12 Sep 2018 21:40:35 -0700
Message-ID: <7hworqvwl8.fsf@baylibre.com>
References: <20180823114954.30704-1-mjourdan@baylibre.com>
 <20180823114954.30704-4-mjourdan@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180823114954.30704-4-mjourdan@baylibre.com> (Maxime Jourdan's
 message of "Thu, 23 Aug 2018 13:49:54 +0200")
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Jourdan <mjourdan@baylibre.com>
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
List-Id: devicetree@vger.kernel.org

Maxime Jourdan <mjourdan@baylibre.com> writes:

> DMC is a small memory region with various registers,
> including the ones needed for the canvas module.
>
> Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
> Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>

Applied to v4.20/dt64 with s/ARM64/arm64/ as requested.

Thanks,

Kevin
