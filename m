From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: riscv: fix the schema compatible string for
 the HiFive Unleashed board
Date: Thu, 8 Aug 2019 16:52:56 -0600
Message-ID: <CAL_JsqK5ms_65sux=Xi=beyu-vD9Qh-ziTpvpLz-qrtwOaLoEw@mail.gmail.com>
References: <alpine.DEB.2.21.9999.1908081545190.15649@viisi.sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.21.9999.1908081545190.15649@viisi.sifive.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 8, 2019 at 4:46 PM Paul Walmsley <paul.walmsley@sifive.com> wrote:
>
>
> The YAML binding document for SiFive boards has an incorrect
> compatible string for the HiFive Unleashed board.  Change it to match
> the name of the board on the SiFive web site:
>
>    https://www.sifive.com/boards/hifive-unleashed
>
> which also matches the contents of the board DT data file:
>
>    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts#n13
>
> Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> ---
>  Documentation/devicetree/bindings/riscv/sifive.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>
