From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V10 6/8] dt-bindings: timer: C-SKY Multi-processor timer
Date: Fri, 5 Oct 2018 15:23:04 -0500
Message-ID: <20181005202304.GA26220@bogus>
References: <cover.1538672812.git.ren_guo@c-sky.com>
 <98c73d601d7ad98993ecfe8d8ce4b5abbc07e4da.1538672812.git.ren_guo@c-sky.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <98c73d601d7ad98993ecfe8d8ce4b5abbc07e4da.1538672812.git.ren_guo@c-sky.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, robh+dt@kernel.org, mark.rutland@arm.com, daniel.lezcano@linaro.org, anurup.m@huawei.com, Jonathan.Cameron@huawei.com, will.deacon@arm.com, zhangshaokun@hisilicon.com, jhogan@kernel.org, paul.burton@mips.com, peterz@infradead.org, arnd@arndb.de, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Guo Ren <ren_guo@c-sky.com>
List-Id: devicetree@vger.kernel.org

On Fri,  5 Oct 2018 01:22:26 +0800, Guo Ren wrote:
> Dt-bingdings doc for C-SKY SMP system setting.
> 
> Changelog:
>  - Drop the interrupt-parent.
> 
> Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> ---
>  .../devicetree/bindings/timer/csky,mptimer.txt     | 42 ++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/csky,mptimer.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
