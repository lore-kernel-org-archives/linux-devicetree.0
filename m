From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: Re: [PATCH 2/7] Serial: Samsung: Fix uart clock init order The
	clk_get API returns -ENOENT when invoked from
	s3c24xx_serial_initconsole. This happens since the
	serial_console gets registered before the platform driver is
	registered.Defer the call to clk_get to s3c24xx_serial_probe so
	that the API returns a valid clock. Signed-off-by: Shaju
	Abraham <shaju.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Date: Mon, 20 Sep 2010 09:26:11 -0500
Message-ID: <E1OxhJr-00061f-VJ@jdl.com>
References: <1284977963-30717-1-git-send-email-shaju.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <1284977963-30717-1-git-send-email-shaju.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> 
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Shaju Abraham <shaju.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

> ---
>  drivers/serial/samsung.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)


A patch Subject: line should be a concise summary of the patch.
The details are separated into a new paragraph formatted to a
maximum 80-col width.

    Subject: Re: [PATCH 2/7] Serial: Samsung: Fix uart clock init order

    The clk_get API returns -ENOENT when invoked from
    s3c24xx_serial_initconsole.  This happens since the serial_console
    gets registered before the platform driver is registered.  Defer the
    call to clk_get to s3c24xx_serial_probe so that the API returns a
    valid clock.

    Signed-off-by: Shaju Abraham <shaju.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Thanks.
jdl
