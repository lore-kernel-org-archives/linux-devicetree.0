From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 3/5] dt-bindings: riscv: convert cpu binding to json-schema
Date: Mon, 10 Jun 2019 15:46:59 -0600
Message-ID: <CAL_JsqJd6s6ta==AoxmNXdpzWL1RytSwR2P4MOfAFSEJavbt+w@mail.gmail.com>
References: <20190602080126.31075-1-paul.walmsley@sifive.com>
 <20190602080126.31075-4-paul.walmsley@sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190602080126.31075-4-paul.walmsley@sifive.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Paul Walmsley <paul@pwsan.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-riscv@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sun, Jun 2, 2019 at 2:01 AM Paul Walmsley <paul.walmsley@sifive.com> wrote:
>
> At Rob's request, we're starting to migrate our DT binding
> documentation to json-schema YAML format.  Start by converting our cpu
> binding documentation.  While doing so, document more properties and
> nodes.  This includes adding binding documentation support for the E51
> and U54 CPU cores ("harts") that are present on this SoC.  These cores
> are described in:
>
>     https://static.dev.sifive.com/FU540-C000-v1.0.pdf
>
> This cpus.yaml file is intended to be a starting point and to
> evolve over time.  It passes dt-doc-validate as of the yaml-bindings
> commit 4c79d42e9216.
>
> This patch was originally based on the ARM json-schema binding
> documentation as added by commit 672951cbd1b7 ("dt-bindings: arm: Convert
> cpu binding to json-schema").
>
> Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> Signed-off-by: Paul Walmsley <paul@pwsan.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org
> ---
>  .../devicetree/bindings/riscv/cpus.yaml       | 168 ++++++++++++++++++
>  1 file changed, 168 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/riscv/cpus.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
