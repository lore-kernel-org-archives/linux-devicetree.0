From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 2/2] powerpc: Use of_machine_compatible_match()
Date: Mon, 30 Jul 2018 08:14:51 -0600
Message-ID: <CAL_JsqLX+NFXRMQXOT352Er5vG_iVSg8dKoouJ5uR0KymW1EdA@mail.gmail.com>
References: <20180730131516.18406-1-mpe@ellerman.id.au>
 <20180730131516.18406-2-mpe@ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <20180730131516.18406-2-mpe@ellerman.id.au>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, linuxppc-dev <linuxppc-dev@ozlabs.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 30, 2018 at 7:15 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Use of_machine_compatible_match() in platform code rather than open
> coding.

This is good because I want to get rid of of_root being used outside
of drivers/of/. Can you also convert this one:

drivers/clk/clk-qoriq.c:            of_device_is_compatible(of_root,
"fsl,ls1021a")) {

>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  arch/powerpc/platforms/40x/ppc40x_simple.c    | 2 +-
>  arch/powerpc/platforms/512x/mpc512x_generic.c | 2 +-
>  arch/powerpc/platforms/52xx/lite5200.c        | 2 +-
>  arch/powerpc/platforms/52xx/media5200.c       | 2 +-
>  arch/powerpc/platforms/52xx/mpc5200_simple.c  | 2 +-
>  arch/powerpc/platforms/83xx/mpc830x_rdb.c     | 2 +-
>  arch/powerpc/platforms/83xx/mpc831x_rdb.c     | 2 +-
>  arch/powerpc/platforms/83xx/mpc837x_rdb.c     | 2 +-
>  arch/powerpc/platforms/85xx/corenet_generic.c | 2 +-
>  arch/powerpc/platforms/85xx/tqm85xx.c         | 2 +-
>  10 files changed, 10 insertions(+), 10 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>

Rob
