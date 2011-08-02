From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] MAINTAINERS: Add keyword match for of_match_table to
	device tree section
Date: Tue, 2 Aug 2011 07:51:35 +0100
Message-ID: <CACxGe6tc5PGXxRCMQDYM-1dLgKHiNEAikuCrCcPRUhNeJpy9fw@mail.gmail.com>
References: <1312262006-7731-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1312262006-7731-1-git-send-email-broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 2, 2011 at 6:13 AM, Mark Brown
<broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org> wrote:
> If a patch is working with an of_match_table it's probably adding an OF
> binding to a driver in which case the binding ought to be reviewed by the
> device tree folks to make sure that things like the device matches are set
> up correctly.
>
> Signed-off-by: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>

Good idea.

Acked-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>

> ---
> =A0MAINTAINERS | =A0 =A01 +
> =A01 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4722b82..991e947 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4727,6 +4727,7 @@ S: =A0 =A0 =A0 =A0Maintained
> =A0F: =A0 =A0 drivers/of
> =A0F: =A0 =A0 include/linux/of*.h
> =A0K: =A0 =A0 of_get_property
> +K: =A0 =A0 of_match_table
>
> =A0OPENRISC ARCHITECTURE
> =A0M: =A0 =A0 Jonas Bonn <jonas-A9uVI2HLR7kOP4wsBPIw7w@public.gmane.org>
> --
> 1.7.5.4
>
>



-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
