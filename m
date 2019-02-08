From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v3] dt-bindings: reset: meson: add g12a bindings
Date: Fri, 08 Feb 2019 17:33:48 +0100
Message-ID: <1549643628.3305.12.camel@pengutronix.de>
References: <20190201125003.25022-1-jbrunet@baylibre.com>
         <1549535746.4557.3.camel@pengutronix.de>
         <6bdabea0-9870-66d1-a737-9695067ba8e6@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <6bdabea0-9870-66d1-a737-9695067ba8e6@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 2019-02-07 at 14:10 +0100, Neil Armstrong wrote:
[...]
> The controller is the exact same as Meson8, GXBB, and AXG.
> 
> We had doubts since the previous datasheets were not clear, but for G12A we
> are sure it's 100% same to at least GXBB and AXG, thus using the same
> compatible as AXG since they share most of same architecture.

Ok, thank you. I've applied the patch to the reset/next branch.

regards
Philipp
