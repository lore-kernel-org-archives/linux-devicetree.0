From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [RFT/RFC PATCH v3 2/5] dt-binding: cpu-topology: Move cpu-map to
 a common binding.
Date: Sun, 24 Mar 2019 16:16:32 -0500
Message-ID: <CAL_JsqJCJOioe63oAJVS_=jBuwxTtE79xBnOzqscV4yY_6WfOA@mail.gmail.com>
References: <20190320234806.19748-1-atish.patra@wdc.com> <20190320234806.19748-3-atish.patra@wdc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190320234806.19748-3-atish.patra@wdc.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Atish Patra <atish.patra@wdc.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, devicetree@vger.kernel.org, Dmitriy Cherkasov <dmitriy@oss-tech.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ingo Molnar <mingo@kernel.org>, Jeremy Linton <jeremy.linton@arm.com>, Johan Hovold <johan@kernel.org>, linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, Morten Rasmussen <morten.rasmussen@arm.com>, Otto Sabart <ottosabart@seberm.com>, Palmer Dabbelt <palmer@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, "Peter Zijlstra (Intel)" <peterz@infradead.>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 20, 2019 at 6:48 PM Atish Patra <atish.patra@wdc.com> wrote:
>
> cpu-map binding can be used to described cpu topology for both
> RISC-V & ARM. It makes more sense to move the binding to document
> to a common place.
>
> The relevant discussion can be found here.
> https://lkml.org/lkml/2018/11/6/19
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>  .../topology.txt => cpu/cpu-topology.txt}     | 82 +++++++++++++++----
>  1 file changed, 66 insertions(+), 16 deletions(-)
>  rename Documentation/devicetree/bindings/{arm/topology.txt => cpu/cpu-topology.txt} (86%)

Reviewed-by: Rob Herring <robh@kernel.org>
