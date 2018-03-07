From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: watchdog: Add Nuvoton NPCM
 description
Date: Wed, 7 Mar 2018 16:29:09 -0600
Message-ID: <20180307222909.rwfvz4xjmpf2hxwa@rob-hp-laptop>
References: <20180305114541.9917-1-joel@jms.id.au>
 <20180305114541.9917-2-joel@jms.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180305114541.9917-2-joel@jms.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Joel Stanley <joel@jms.id.au>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Mark Rutland <mark.rutland@arm.com>, Marcus Folkesson <marcus.folkesson@gmail.com>, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>, Avi Fishman <avifishman70@gmail.com>, Brendan Higgins <brendanhiggins@google.com>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 05, 2018 at 10:15:40PM +1030, Joel Stanley wrote:
> These bindings describe the watchdog IP as used by the Nuvoton NPCM750
> (Poleg) BMC SoC.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> V2: Add optional timeout property
> ---
>  .../bindings/watchdog/nuvoton,npcm-wdt.txt         | 28 ++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt

Reviewed-by: Rob Herring <robh@kernel.org>
