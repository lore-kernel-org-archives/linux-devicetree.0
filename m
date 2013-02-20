From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: dts: imx: replace magic number with pin function
 name
Date: Wed, 20 Feb 2013 11:46:41 -0700
Message-ID: <51251A11.2030300@wwwdotorg.org>
References: <1361344089-16804-1-git-send-email-shawn.guo@linaro.org>
 <1361344089-16804-3-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1361344089-16804-3-git-send-email-shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, =?ISO-8859-1?Q?Uwe_Kleine-K=F6?= =?ISO-8859-1?Q?nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Dong Aisheng <dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 02/20/2013 12:08 AM, Shawn Guo wrote:
> This turns the imx pin function number defined by binding document
> into #define constants in header which can be used in dts and handled
> by pre-processor to improve the readability of device tree sources.

> diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx35-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/fsl,imx35-pinctrl.txt

> -See below for available PIN_FUNC_ID for imx35:
> -0 MX35_PAD_CAPTURE__GPT_CAPIN1
...
> -951 MX35_PAD_TEST_MODE__TCU_TEST_MODE
> +Refer to arch/arm/boot/dts/imx35-pinfunc.h for all available imx35 PIN_FUNC_ID.

So that path is specific to the Linux kernel. The DT binding
documentation isn't supposed to be specific to the Linux kernel. I
wonder if we shouldn't put all the header files into
Documentation/devicetree/bindings rather than arch/*/boot/dts. That way,
you could encode relative path names into the DT binding docs. The
headers are logically part of the documentation anyway.

This all plays into whatever plans exist for removing the DT binding
docs and/or .dts files from the kernel, and how things will end up
getting laid out then though. That's something we should discuss with at
least Grant and Rob. I note that the DT maintainers weren't Cc'd on this
series though. I added them for this reply.

Perhaps I should just send a patch to the dtc and kernel include paths
which implements that, and see what people say.

> diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx6q-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/fsl,imx6q-pinctrl.txt

>  See below for available PIN_FUNC_ID for imx6q:
> -MX6Q_PAD_SD2_DAT1__USDHC2_DAT1			0

You forgot to add a reference to the header filename to this file.
