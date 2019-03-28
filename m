From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4.1 armsoc/drivers/bus+gpio 2/5] dt-bindings: bus:
 Document moxtet bus binding
Date: Thu, 28 Mar 2019 11:42:26 -0500
Message-ID: <20190328164226.GA8579@bogus>
References: <20190307125251.724-1-marek.behun@nic.cz>
 <20190307125251.724-3-marek.behun@nic.cz>
 <20190311225906.GA9056@bogus>
 <20190314150135.4362-1-marek.behun@nic.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190314150135.4362-1-marek.behun@nic.cz>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Tony Lindgren <tony@atomide.com>, Shawn Guo <shawnguo@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 14 Mar 2019 16:01:35 +0100, =?UTF-8?q?Marek=20Beh=C3=BAn?= wrote:
> This adds device tree binding documentation for the Moxtet bus, a bus
> via which the different modules connected to the Turris Mox router can
> be configured.
> 
> Signed-off-by: Marek Behún <marek.behun@nic.cz>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> ---
>  .../devicetree/bindings/bus/moxtet.txt        | 44 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/bus/moxtet.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
