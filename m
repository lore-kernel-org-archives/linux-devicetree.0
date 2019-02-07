From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v2] arm64: dts: meson: fix g12a buses
Date: Wed, 06 Feb 2019 19:23:31 -0800
Message-ID: <7h5ztwi8ng.fsf@baylibre.com>
References: <20190201133732.32169-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190201133732.32169-1-jbrunet@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
Cc: devicetree@vger.kernel.org, Jianxin Pan <jianxin.pan@amlogic.com>, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
List-Id: devicetree@vger.kernel.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> Fix apb, cbus, hiu and periph regions which are not aligned
> with the documentation and the information provided by Amlogic
>
> Fixes: 9c8c52f7cb4f ("arm64: dts: meson-g12a: add initial g12a s905d2 SoC DT support")
> Cc: Jianxin Pan <jianxin.pan@amlogic.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Queued for v5.1 (branch: v5.1/dt64)

Kevin
