From: Rob Herring <robh@kernel.org>
Subject: Re: [RFC v2 4/7] dt-binding: timer: Document RTL8186 SoC DT bindings
Date: Fri, 12 Oct 2018 15:14:38 -0500
Message-ID: <20181012201438.GA21356@bogus>
References: <20181001102952.7913-1-yasha.che3@gmail.com>
 <20181001102952.7913-5-yasha.che3@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181001102952.7913-5-yasha.che3@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Mark Rutland <mark.rutland@arm.com>, linux-mips@linux-mips.org, devicetree@vger.kernel.org, Yasha Cherikovsky <yasha.che3@gmail.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon,  1 Oct 2018 13:29:49 +0300, Yasha Cherikovsky wrote:
> This patch adds device tree binding doc for the
> Realtek RTL8186 SoC timer controller.
> 
> Signed-off-by: Yasha Cherikovsky <yasha.che3@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Paul Burton <paul.burton@mips.com>
> Cc: James Hogan <jhogan@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-mips@linux-mips.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  .../bindings/timer/realtek,rtl8186-timer.txt    | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/realtek,rtl8186-timer.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
