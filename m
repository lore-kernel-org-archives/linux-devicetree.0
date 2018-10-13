From: Yasha Cherikovsky <yasha.che3@gmail.com>
Subject: Re: [RFC v2 2/7] dt-binding: interrupt-controller: Document RTL8186
 SoC DT bindings
Date: Sat, 13 Oct 2018 22:42:04 +0300
Message-ID: <a6e3c6c059a4a593d7c9228ed260ea24f993a3f6.camel@gmail.com>
References: <20181001102952.7913-1-yasha.che3@gmail.com>
         <20181001102952.7913-3-yasha.che3@gmail.com> <20181012201346.GA17471@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181012201346.GA17471@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Mark Rutland <mark.rutland@arm.com>, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 2018-10-12 at 15:13 -0500, Rob Herring wrote:
> On Mon, Oct 01, 2018 at 01:29:47PM +0300, Yasha Cherikovsky wrote:
> > This patch adds device tree binding doc for the
> > Realtek RTL8186 SoC interrupt controller.
> > 
> > Signed-off-by: Yasha Cherikovsky <yasha.che3@gmail.com>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Jason Cooper <jason@lakedaemon.net>
> > Cc: Marc Zyngier <marc.zyngier@arm.com>
> > Cc: Ralf Baechle <ralf@linux-mips.org>
> > Cc: Paul Burton <paul.burton@mips.com>
> > Cc: James Hogan <jhogan@kernel.org>
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-mips@linux-mips.org
> > Cc: linux-kernel@vger.kernel.org
> > ---
> >  .../interrupt-controller/realtek,rtl8186-intc  | 18 ++++++++++++++++++
> 
> .txt
> 
> With that,
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

Thanks, will fix for v3.
