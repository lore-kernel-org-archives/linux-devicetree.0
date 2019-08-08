From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: riscv: remove obsolete cpus.txt
Date: Thu, 8 Aug 2019 16:56:25 -0600
Message-ID: <CAL_Jsq+db+_u47yutb+H7dcMqP27PF9jjwinsB2qgi609t9zWQ@mail.gmail.com>
References: <alpine.DEB.2.21.9999.1908081520100.6414@viisi.sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.21.9999.1908081520100.6414@viisi.sifive.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Walmsley <paul.walmsley@sifive.com>
Cc: devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, linux-riscv@lists.infradead.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 8, 2019 at 4:22 PM Paul Walmsley <paul.walmsley@sifive.com> wrote:
>
>
> Remove the now-obsolete riscv/cpus.txt DT binding document, since we
> are using YAML binding documentation instead.
>
> While doing so, transfer the explanatory text about 'harts' (with some
> edits) into the YAML file, at Rob's request.
>
> Link: https://lore.kernel.org/linux-riscv/CAL_JsqJs6MtvmuyAknsUxQymbmoV=G+=JfS1PQj9kNHV7fjC9g@mail.gmail.com/
> Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/riscv/cpus.txt        | 162 ------------------
>  .../devicetree/bindings/riscv/cpus.yaml       |  12 ++
>  2 files changed, 12 insertions(+), 162 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/riscv/cpus.txt

Reviewed-by: Rob Herring <robh@kernel.org>
