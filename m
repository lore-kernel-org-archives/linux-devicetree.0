From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: arm: Convert RDA Micro board/soc bindings
 to json-schema
Date: Tue, 9 Jul 2019 11:03:32 -0600
Message-ID: <20190709170332.GA14545@bogus>
References: <20190618212229.32302-4-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190618212229.32302-4-robh@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org
Cc: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>, linux-arm-kernel@lists.infradead.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 18, 2019 at 03:22:28PM -0600, Rob Herring wrote:
> Convert RDA Micro SoC bindings to DT schema format using json-schema.
> =

> Cc: "Andreas F=E4rber" <afaerber@suse.de>
> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Andreas, Update the license on this one too to dual licensed if you =

> want.

Ping.

> =

>  Documentation/devicetree/bindings/arm/rda.txt | 17 ----------------
>  .../devicetree/bindings/arm/rda.yaml          | 20 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 21 insertions(+), 18 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/rda.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/rda.yaml
