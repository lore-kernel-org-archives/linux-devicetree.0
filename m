From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3] dt-bindings: arm: Convert Actions Semi bindings to
 jsonschema
Date: Thu, 13 Jun 2019 16:44:35 -0600
Message-ID: <20190613224435.GA32572@bogus>
References: <20190517153223.7650-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190517153223.7650-1-robh@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, May 17, 2019 at 10:32:23AM -0500, Rob Herring wrote:
> Convert Actions Semi SoC bindings to DT schema format using json-schema.
> =

> Cc: "Andreas F=E4rber" <afaerber@suse.de>
> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> v3:
> - update MAINTAINERS
> =

>  .../devicetree/bindings/arm/actions.txt       | 56 -------------------
>  .../devicetree/bindings/arm/actions.yaml      | 38 +++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 39 insertions(+), 57 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/actions.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/actions.yaml

Ping. Please apply or modify this how you'd prefer. I'm not going to =

keep respinning this.

Rob
