From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 3/6] dt-bindings: soc: Add a binding for the Broadcom
 VCHIQ services. (v3)
Date: Sun, 18 Mar 2018 07:48:23 -0500
Message-ID: <20180318124823.jfvoy3xraogsxpdi@rob-hp-laptop>
References: <20180309184417.23368-1-eric@anholt.net>
 <20180309184417.23368-3-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180309184417.23368-3-eric@anholt.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Eric Anholt <eric@anholt.net>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Phil Elwell <phil@raspberrypi.org>, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

On Fri, Mar 09, 2018 at 10:44:14AM -0800, Eric Anholt wrote:
> The VCHIQ communication channel can be provided by BCM283x and Capri
> SoCs, to communicate with the VPU-side OS services.
> 
> Signed-off-by: Eric Anholt <eric@anholt.net>
> ---
> 
> v2: VCHI->VCHIQ, dropped firmware property, added cache-line-size
> v3: Dropped cache-line-size, s/vchi@/mailbox@/
> 
>  .../devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.txt   | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.txt

Reviewed-by: Rob Herring <robh@kernel.org>
