From: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH v3 0/2] Add support of Temperature sensor Clock for G12
 SoC
Date: Tue, 11 Jun 2019 14:32:17 +0200
Message-ID: <c216003f9622d022d55ed9eb13458a10189797f2.camel@baylibre.com>
References: <20190412100221.26740-1-glaroque@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190412100221.26740-1-glaroque@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Guillaume La Roque <glaroque@baylibre.com>, narmstrong@baylibre.com, khilman@baylibre.com, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 2019-04-12 at 12:02 +0200, Guillaume La Roque wrote:
> This patch series add support of Clock for temperature sensor
> on Amlogic G12a SoC.
> 
> Guillaume
> 
> cahnges sinve v2:
> - rebase on good branch
> 
> changes since v1:
> - fix .width value
> 
> Guillaume La Roque (2):
>   dt-bindings: clk: g12a-clkc: add Temperature Sensor clock ID
>   clk: meson-g12a: Add Temperature Sensor clock
> 
>  drivers/clk/meson/g12a.c              | 31 +++++++++++++++++++++++++++
>  drivers/clk/meson/g12a.h              |  3 ++-
>  include/dt-bindings/clock/g12a-clkc.h |  1 +
>  3 files changed, 34 insertions(+), 1 deletion(-)
> 

Fixed the commit messages as suggested by Martin and applied
Thx
