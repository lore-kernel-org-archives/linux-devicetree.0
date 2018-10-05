From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V10 2/8] dt-bindings: interrupt-controller: C-SKY SMP intc
Date: Fri, 5 Oct 2018 15:22:30 -0500
Message-ID: <20181005202230.GA25493@bogus>
References: <cover.1538672812.git.ren_guo@c-sky.com>
 <22b6f2800b7f0d6ad1ac5b845b34fc9c924f019f.1538672812.git.ren_guo@c-sky.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <22b6f2800b7f0d6ad1ac5b845b34fc9c924f019f.1538672812.git.ren_guo@c-sky.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, robh+dt@kernel.org, mark.rutland@arm.com, daniel.lezcano@linaro.org, anurup.m@huawei.com, Jonathan.Cameron@huawei.com, will.deacon@arm.com, zhangshaokun@hisilicon.com, jhogan@kernel.org, paul.burton@mips.com, peterz@infradead.org, arnd@arndb.de, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Guo Ren <ren_guo@c-sky.com>
List-Id: devicetree@vger.kernel.org

On Fri,  5 Oct 2018 01:22:22 +0800, Guo Ren wrote:
> Dt-bindings doc about C-SKY Multi-processors interrupt controller.
> 
> Changelog:
>  - Should be: '#interrupt-cells' not 'interrupt-cells'
> 
> Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> ---
>  .../bindings/interrupt-controller/csky,mpintc.txt  | 40 ++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/csky,mpintc.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
