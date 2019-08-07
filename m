From: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH v3 3/5] RISC-V: Fix unsupported isa string info.
Date: Wed, 07 Aug 2019 08:37:48 -0700 (PDT)
Message-ID: <mhng-6a70927a-4b6a-452f-910c-0639d5f47dff@palmer-si-x1e>
References: <alpine.DEB.2.21.9999.1908061818360.13971@viisi.sifive.com>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
In-Reply-To: <alpine.DEB.2.21.9999.1908061818360.13971@viisi.sifive.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
To: Paul Walmsley <paul.walmsley@sifive.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, aou@eecs.berkeley.edu, tiny.windzz@gmail.com, Greg KH <gregkh@linuxfoundation.org>, daniel.lezcano@linaro.org, linux-kernel@vger.kernel.org, johan@kernel.org, Atish Patra <Atish.Patra@wdc.com>, Anup Patel <Anup.Patel@wdc.com>, robh+dt@kernel.org, gary@garyguo.net, tglx@linutronix.de, info@metux.net, linux-riscv@lists.infradead.org, allison@lohutok.net
List-Id: devicetree@vger.kernel.org

On Tue, 06 Aug 2019 18:26:08 PDT (-0700), Paul Walmsley wrote:
> On Wed, 7 Aug 2019, Atish Patra wrote:
>
>> On Tue, 2019-08-06 at 16:27 -0700, Paul Walmsley wrote:
>>
>> > Seems like the "su" should be dropped from mandatory_ext.  What do you
>> > think?
>> >
>>
>> Yup. As DT binding only mention imafdc, mandatory extensions should
>> contain only that and just consider "su" extensions are considered as
>> implicit as we are running Linux.
>
> Discussing this with Andrew and Palmer, it looks like "su" is currently
> non-compliant.  Section 22.6 of the user-level specification states that
> the "s" character indicates that a longer standard supervisor extension
> name will follow.  So far I don't think any of these have been defined.
>
>> Do you think QEMU DT should be updated to reflect that ?
>
> Yes.

https://lists.nongnu.org/archive/html/qemu-riscv/2019-08/msg00141.html

>
>> > There's no Kconfig option by this name, and we're requiring
>> > compressed
>>
>> Sorry. This was a typo. It should have been CONFIG_RISCV_ISA_C.
>>
>> > instruction support as part of the RISC-V Linux baseline.  Could you
>> > share the rationale behind this?
>>
>> I think I added this check at the config file. Looking at the Kconfig,
>> RISCV_ISA_C is always enabled. So we can drop this.
>
> OK great.  Do you want to resend an updated patch, or would you like me to
> fix it up here?
>
> I'll also send a patch to drop CONFIG_RISCV_ISA_C.
>
>
> - Paul
