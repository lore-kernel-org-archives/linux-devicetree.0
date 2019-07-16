From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: riscv: Limit cpus schema to only check RiscV
 'cpu' nodes
Date: Tue, 16 Jul 2019 09:08:01 -0600
Message-ID: <CAL_JsqKmovGLxZj5jOLgXLtYD1cRHjtrQZm27Nk8cRQR9tsidg@mail.gmail.com>
References: <20190626235759.3615-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190626235759.3615-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@sifive.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 26, 2019 at 6:00 PM Rob Herring <robh@kernel.org> wrote:
>
> Matching on the 'cpus' node was a bad choice because the schema is
> incorrectly applied to non-RiscV cpus nodes. As we now have a common cpus
> schema which checks the general structure, it is also redundant to do so
> in the Risc-V CPU schema.
>
> The downside is one could conceivably mix different architecture's cpu
> nodes or have typos in the compatible string. The latter problem pretty
> much exists for every schema.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/riscv/cpus.yaml       | 143 ++++++++----------
>  1 file changed, 61 insertions(+), 82 deletions(-)

Paul, do you plan to apply this? I have several fixes to send to Linus
if you want me to include this.

Rob
