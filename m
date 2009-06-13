From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] sdhci: Add support for hosts that are only capable of
	1-bit transfers
Date: Sat, 13 Jun 2009 09:40:02 -0600
Message-ID: <fa686aa40906130840lfb751a7xc9e24646c860a76d@mail.gmail.com>
References: <20090611201545.GA15942@oksana.dev.rtsoft.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <20090611201545.GA15942-wnGakbxT3iijyJ0x5qLZdcN33GVbZNy3@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Anton Vorontsov <avorontsov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org>
Cc: linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, Pierre Ossman <pierre-vCPtPcF4ZGuHXe+LvDLADg@public.gmane.org>, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, sdhci-devel-qjLDD68F18NoYZYVwN2jqg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 11, 2009 at 2:15 PM, Anton
Vorontsov<avorontsov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org> wrote:
> Some hosts (hardware configurations, or particular SD/MMC slots) may
> not support 4-bit bus. For example, on MPC8569E-MDS boards we can
> switch between serial (1-bit only) and nibble (4-bit) modes, thought
> we have to disable more peripherals to work in 4-bit mode.
>
> Along with some small core changes, this patch modifies sdhci-of
> driver, so that now it looks for "mode" property in the device-tree.
>
> Signed-off-by: Anton Vorontsov <avorontsov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org>
> ---
>
> Pierre, I'm not sure if a quirk would be appropriate here. If so,
> I can redo the patch with FORCE_1_BIT_DATA quirk.
>
> Thanks,
>
> =A0Documentation/powerpc/dts-bindings/fsl/esdhc.txt | =A0 =A02 ++
> =A0drivers/mmc/host/sdhci-of.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 =A07 +++++++
> =A0drivers/mmc/host/sdhci-pci.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 =A01 +
> =A0drivers/mmc/host/sdhci.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | =A0 =A02 +-
> =A04 files changed, 11 insertions(+), 1 deletions(-)
>
> diff --git a/Documentation/powerpc/dts-bindings/fsl/esdhc.txt b/Documenta=
tion/powerpc/dts-bindings/fsl/esdhc.txt
> index 5093ddf..298b865 100644
> --- a/Documentation/powerpc/dts-bindings/fsl/esdhc.txt
> +++ b/Documentation/powerpc/dts-bindings/fsl/esdhc.txt
> @@ -10,6 +10,8 @@ Required properties:
> =A0 - interrupts : should contain eSDHC interrupt.
> =A0 - interrupt-parent : interrupt source phandle.
> =A0 - clock-frequency : specifies eSDHC base clock frequency.
> + =A0- mode : specifies eSDHC mode, valid values are: "1-bit" and "4-bit".
> + =A0 =A0If mode is unspecified, then 4-bit mode is assumed.

In light of Pierre's comment that 4-bit is mandatory and this is a
deviation, perhaps it would be better to define an empty property to
indicate that only 1-bit transfers work.  Maybe something along the
lines of "sdhc-1-bit-only"?

g.

-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
