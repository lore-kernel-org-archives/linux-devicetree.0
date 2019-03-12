From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 armsoc/drivers/bus+gpio 5/5] dt-bindings: gpio:
 Document GPIOs via Moxtet bus
Date: Tue, 12 Mar 2019 07:47:14 -0500
Message-ID: <20190312124714.GA14530@bogus>
References: <20190307125251.724-1-marek.behun@nic.cz>
 <20190307125251.724-6-marek.behun@nic.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190307125251.724-6-marek.behun@nic.cz>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Tony Lindgren <tony@atomide.com>, Shawn Guo <shawnguo@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu,  7 Mar 2019 13:52:51 +0100, =?UTF-8?q?Marek=20Beh=C3=BAn?= wrote:
> This patch adds documentation of the device tree bindings for GPIOs
> on the devices connected via Moxtet bus.
> 
> Signed-off-by: Marek Behún <marek.behun@nic.cz>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> ---
>  .../devicetree/bindings/gpio/gpio-moxtet.txt   | 18 ++++++++++++++++++
>  MAINTAINERS                                    |  1 +
>  2 files changed, 19 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-moxtet.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
