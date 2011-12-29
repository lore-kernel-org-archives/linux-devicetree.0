From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PULL] Devicetree for 3.3
Date: Wed, 28 Dec 2011 21:53:08 -0700
Message-ID: <CACxGe6tM9dGGccUhhOEsah+8P=1XjYVh=KXy8J+V0pVVdoZrDA@mail.gmail.com>
References: <4EFB2B8A.9010902@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4EFB2B8A.9010902-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Merged, thanks.

g.

On Wed, Dec 28, 2011 at 7:45 AM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Grant,
>
> Please pull device tree updates for 3.3. Pretty much a random collection
> of minor changes. I'm including i2c-designware DT binding support here
> as I've gotten no response from Ben.
>
> Rob
>
> The following changes since commit 384703b8e6cd4c8ef08512e596024e028c91c3=
39:
>
> =A0Linux 3.2-rc6 (2011-12-16 18:36:26 -0800)
>
> are available in the git repository at:
> =A0git://sources.calxeda.com/kernel/linux.git for-grant
>
> Benoit Cousson (1):
> =A0 =A0 =A0of/base: Take NULL string into account for property with multi=
ple
> strings
>
> David Daney (1):
> =A0 =A0 =A0OF/device-tree: Add some entries to vendor-prefixes.txt
>
> Dong Aisheng (1):
> =A0 =A0 =A0dt: reform for_each_property to for_each_property_of_node
>
> Olof Johansson (1):
> =A0 =A0 =A0dt/i2c: Enumerate some of the known trivial i2c devices
>
> Rob Herring (3):
> =A0 =A0 =A0i2c-designware: add OF binding support
> =A0 =A0 =A0dt: add empty of_get_node/of_put_node functions
> =A0 =A0 =A0irq: check domain hwirq range for DT translate
>
> Sam Ravnborg (1):
> =A0 =A0 =A0of/pdt: fix section mismatch warning
>
> Uwe Kleine-K=F6nig (1):
> =A0 =A0 =A0ARM/of: allow *machine_desc.dt_compat to be const
>
> =A0.../devicetree/bindings/i2c/i2c-designware.txt =A0 =A0 | =A0 22 ++++++=
++
> =A0.../devicetree/bindings/i2c/trivial-devices.txt =A0 =A0| =A0 58
> ++++++++++++++++++++
> =A0.../devicetree/bindings/vendor-prefixes.txt =A0 =A0 =A0 =A0| =A0 =A03 +
> =A0arch/arm/include/asm/mach/arch.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 =A02 +-
> =A0drivers/i2c/busses/i2c-designware-platdrv.c =A0 =A0 =A0 =A0| =A0 12 ++=
++
> =A0drivers/of/base.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0| =A0 10 ++--
> =A0drivers/of/fdt.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 | =A0 =A04 +-
> =A0drivers/of/pdt.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 | =A0 =A02 +-
> =A0include/linux/of.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 | =A0 33 ++++++------
> =A0include/linux/of_fdt.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 | =A0 =A04 +-
> =A0kernel/irq/irqdomain.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 | =A0 =A03 +
> =A011 files changed, 124 insertions(+), 29 deletions(-)
> =A0create mode 100644 Documentation/devicetree/bindings/i2c/i2c-designwar=
e.txt
> =A0create mode 100644
> Documentation/devicetree/bindings/i2c/trivial-devices.txt



-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
