From: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH v2 2/4] nvmem: meson-efuse: bindings: Add secure-monitor
 phandle
Date: Tue, 06 Aug 2019 10:25:20 +0200
Message-ID: <1j8ss6wvin.fsf@starbuckisacylon.baylibre.com>
References: <20190731082339.20163-1-ccaione@baylibre.com>
 <20190731082339.20163-3-ccaione@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190731082339.20163-3-ccaione@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: srinivas.kandagatla@linaro.org, khilman@baylibre.com, narmstrong@baylibre.com, robh+dt@kernel.org, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Cc: Carlo Caione <ccaione@baylibre.com>
List-Id: devicetree@vger.kernel.org

On Wed 31 Jul 2019 at 09:23, Carlo Caione <ccaione@baylibre.com> wrote:

> Add a new property to link the nvmem driver to the secure-monitor. The
> nvmem driver needs to access the secure-monitor to be able to access the
> fuses.
>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
