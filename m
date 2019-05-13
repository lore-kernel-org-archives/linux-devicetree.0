From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: sifive: describe sifive-blocks versioning
Date: Mon, 13 May 2019 15:47:26 -0500
Message-ID: <CAL_JsqJRdjoTo2hGrKWvcyer18wt9N6w0nkfa9xx_e2xJ6pkYg@mail.gmail.com>
References: <alpine.DEB.2.21.9999.1811211704520.16271@viisi.sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.21.9999.1811211704520.16271@viisi.sifive.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@sifive.com>
Cc: devicetree@vger.kernel.org, Megan Wachs <megan@sifive.com>, Wesley Terpstra <wesley@sifive.com>, Mark Rutland <mark.rutland@arm.com>, linux-riscv@lists.infradead.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Paul Walmsley <paul@pwsan.com>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 21, 2018 at 7:06 PM Paul Walmsley <paul.walmsley@sifive.com> wrote:
>
>
> For IP blocks that are generated from the public, open-source
> sifive-blocks repository, describe the version numbering policy
> that its maintainers intend to use, upon request from Rob
> Herring <robh@kernel.org>.
>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Palmer Dabbelt <palmer@sifive.com>
> Cc: Megan Wachs <megan@sifive.com>
> Cc: Wesley Terpstra <wesley@sifive.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> Signed-off-by: Paul Walmsley <paul@pwsan.com>
> ---
>
> Hi Rob, please let me know if this document works with your
> requirements, or if some changes are needed.  - Paul
>
>  .../sifive/sifive-blocks-ip-versioning.txt    | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sifive/sifive-blocks-ip-versioning.txt

I just noticed this was never re-spun and applied. We now have
bindings in tree referring to it though.

Rob
