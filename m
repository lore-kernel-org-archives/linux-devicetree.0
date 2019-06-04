From: Li Yang <leoyang.li@nxp.com>
Subject: Re: [PATCH v3 0/6] soc/fsl/qe: cleanups and new DT binding
Date: Tue, 4 Jun 2019 15:29:22 -0500
Message-ID: <CADRPPNRfAk2ZWJQt=Wx5SEqvw4iSpzkj8_XvHa_CZYHDAxFgxg@mail.gmail.com>
References: <20190501092841.9026-1-rasmus.villemoes@prevas.dk>
 <20190513111442.25724-1-rasmus.villemoes@prevas.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190513111442.25724-1-rasmus.villemoes@prevas.dk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Scott Wood <oss@buserror.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rasmus Villemoes <Rasmus.Villemoes@prevas.se>, Rob Herring <robh+dt@kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Qiang Zhao <qiang.zhao@nxp.com>
List-Id: devicetree@vger.kernel.org

On Mon, May 13, 2019 at 6:17 AM Rasmus Villemoes
<rasmus.villemoes@prevas.dk> wrote:
>
> This small series consists of some small cleanups and simplifications
> of the QUICC engine driver, and introduces a new DT binding that makes
> it much easier to support other variants of the QUICC engine IP block
> that appears in the wild: There's no reason to expect in general that
> the number of valid SNUMs uniquely determines the set of such, so it's
> better to simply let the device tree specify the values (and,
> implicitly via the array length, also the count).
>
> Which tree should this go through?
>
> v3:
> - Move example from commit log into binding document (adapting to
>   MPC8360 which the existing example pertains to).
> - Add more review tags.
> - Fix minor style issue.
>
> v2:
> - Address comments from Christophe Leroy
> - Add his Reviewed-by to 1/6 and 3/6
> - Split DT binding update to separate patch as per
>   Documentation/devicetree/bindings/submitting-patches.txt
>
> Rasmus Villemoes (6):
>   soc/fsl/qe: qe.c: drop useless static qualifier
>   soc/fsl/qe: qe.c: reduce static memory footprint by 1.7K
>   soc/fsl/qe: qe.c: introduce qe_get_device_node helper
>   dt-bindings: soc/fsl: qe: document new fsl,qe-snums binding
>   soc/fsl/qe: qe.c: support fsl,qe-snums property
>   soc/fsl/qe: qe.c: fold qe_get_num_of_snums into qe_snums_init

Series applied to soc/fsl for-next.  Thanks!

Regards,
Leo

>
>  .../devicetree/bindings/soc/fsl/cpm_qe/qe.txt |  13 +-
>  drivers/soc/fsl/qe/qe.c                       | 163 +++++++-----------
>  2 files changed, 77 insertions(+), 99 deletions(-)
>
> --
> 2.20.1
>
