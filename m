From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PULL] Devicetree for 3.2
Date: Wed, 5 Oct 2011 10:53:23 -0600
Message-ID: <CACxGe6siwgLK0PA3Xtfkzyz4opf-ox4Vid0PQY7EUQMw_3DtMw@mail.gmail.com>
References: <4E8C88A1.4090308@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <4E8C88A1.4090308@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robherring2@gmail.com>
Cc: devicetree-discuss <devicetree-discuss@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 5, 2011 at 10:41 AM, Rob Herring <robherring2@gmail.com> wrote:
> Grant,
>
> Please pull for 3.2. These commits don't have any dependencies and are
> not dependencies for me, so they don't need to go in thru arm-soc.
>
> Rob
>
> The following changes since commit 976d167615b64e14bc1491ca51d424e2ba9a5e=
84:
>
> =A0Linux 3.1-rc9 (2011-10-04 18:11:50 -0700)
>
> are available in the git repository at:
> =A0git://git.jdl.com/software/linux-3.0.git for-grant
>
> Rob Herring (4):
> =A0 =A0 =A0MAINTAINERS: update devicetree maintainers
> =A0 =A0 =A0of/irq: of_irq_find_parent: check for parent equal to child
> =A0 =A0 =A0devicetree: Add ARM pl061 gpio controller binding doc
> =A0 =A0 =A0devicetree: Add ARM pl022 spi controller binding doc

Pulled thanks.

Nit: the of_irq_find_parent patch really should have my acked-by, and
I had hoped to get Ben's too.  (though I did only say "looks good"
without explicitly write an a-b in my reply, so did leave ambiguity).
We *might* end up having to revert that one if it causes problems in
powerpc-land.

g.

>
> =A0.../devicetree/bindings/gpio/pl061-gpio.txt =A0 =A0 =A0 =A0| =A0 10 ++=
++++++++
> =A0.../devicetree/bindings/spi/spi_pl022.txt =A0 =A0 =A0 =A0 =A0| =A0 12 =
++++++++++++
> =A0MAINTAINERS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0| =A0 =A02 ++
> =A0drivers/of/irq.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 | =A0 14 +++++++-------
> =A04 files changed, 31 insertions(+), 7 deletions(-)
> =A0create mode 100644 Documentation/devicetree/bindings/gpio/pl061-gpio.t=
xt
> =A0create mode 100644 Documentation/devicetree/bindings/spi/spi_pl022.txt
>



-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
