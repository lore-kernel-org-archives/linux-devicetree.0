From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH v2 2/2] MIPS: PowerTV: Add device tree support
Date: Wed, 28 Jul 2010 12:57:21 -0600
Message-ID: <AANLkTi=dRVrXdvF3e8h7kbF0AruBLpqRYbBLJcg2wMpg@mail.gmail.com>
References: <20100727215337.GA29365@dediao-lnx2.corp.sa.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20100727215337.GA29365-xfMjgo8mR/VtOC46+g3osbQa8qPdvLwY@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Dezhong Diao <dediao-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Dezhong,

I can't comment too much on this patch since I don't know the platform
or MIPS very well, but it seems to be good.  Can you post a sample of
your device tree, and your binding documentation?

Thanks,
g.

On Tue, Jul 27, 2010 at 3:53 PM, Dezhong Diao <dediao-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org> wrote:
> V2:
> =A0 =A0Synchronize with test-devicetree branch of device tree.
>
> V1:
> =A0 =A0Add device tree support for PowerTV.
> =A0 =A0Customize user-defined memory scan function.
>
> Signed-off-by: Dezhong Diao <dediao-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
> ---
> =A0arch/mips/configs/powertv_defconfig =A0 =A0 =A0 =A0| =A0293 ++++++++++=
+++++++++++-------
> =A0arch/mips/include/asm/mach-powertv/asic.h =A0| =A0 =A08 +-
> =A0arch/mips/include/asm/mach-powertv/mdesc.h | =A0 51 +++++
> =A0arch/mips/powertv/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A02 =
+-
> =A0arch/mips/powertv/asic/asic_devices.c =A0 =A0 =A0| =A0 22 --
> =A0arch/mips/powertv/mdesc.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0224 =
+++++++++++++++++++++
> =A0arch/mips/powertv/memory.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0242 ++=
++++++++++++---------
> =A07 files changed, 649 insertions(+), 193 deletions(-)
> =A0create mode 100644 arch/mips/include/asm/mach-powertv/mdesc.h
> =A0create mode 100644 arch/mips/powertv/mdesc.c
