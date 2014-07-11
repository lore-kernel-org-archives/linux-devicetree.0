From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 8/8] drm/tilcdc: panel: Add support for enable GPIO
Date: Fri, 11 Jul 2014 12:08:58 -0300
Message-ID: <CAOMZO5CawR9qMbm3HLf4+S3-pcf4m=VCUqm0W9LXXYzNzv2aOQ@mail.gmail.com>
References: <1405088334-11215-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1405088334-11215-9-git-send-email-ezequiel@vanguardiasur.com.ar>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1405088334-11215-9-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Daniel Vetter <daniel.vetter@ffwll.ch>, DRI mailing list <dri-devel@lists.freedesktop.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 11, 2014 at 11:18 AM, Ezequiel Garcia
<ezequiel@vanguardiasur.com.ar> wrote:
> In order to support the "enable GPIO" available in many panel devices,
> this commit adds a proper devicetree binding.
>
> By providing an enable GPIO in the devicetree, the driver can now turn
> off and on the panel device, and/or the backlight device. Both the
> backlight and the GPIO are optional properties.
> +       panel_mod->enable_gpio = devm_gpiod_get(&pdev->dev, "enable");
> +       if (IS_ERR(panel_mod->enable_gpio)) {
> +               ret = PTR_ERR(panel_mod->enable_gpio);
> +               if (ret != -ENOENT) {

Shouldn't this be controlled by a regulator instead? What if the panel
is powered from a PMIC output?
