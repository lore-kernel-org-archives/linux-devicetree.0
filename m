From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH v3 2/2] dt/bindings: Add bindings for Layerscape external
 irqs
Date: Wed, 24 Jan 2018 15:28:19 +0000
Message-ID: <d1484602-f9ea-caab-593f-73628612cf8b@arm.com>
References: <1513758631-19909-1-git-send-email-rasmus.villemoes@prevas.dk>
 <20180122092133.23177-1-rasmus.villemoes@prevas.dk>
 <20180122092133.23177-2-rasmus.villemoes@prevas.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180122092133.23177-2-rasmus.villemoes@prevas.dk>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Mark Rutland <mark.rutland@arm.com>
Cc: Andy Tang <andy.tang@nxp.com>, Alexander Stein <alexander.stein@systec-electronic.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 22/01/18 09:21, Rasmus Villemoes wrote:
> Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
> ---
>  .../interrupt-controller/fsl,ls-extirq.txt         | 44 ++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/fsl,ls-extirq.txt

Please write a sensible commit log.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
