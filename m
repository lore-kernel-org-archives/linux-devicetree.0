From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V2 04/14] OF: pinctrl: MIPS: lantiq: implement lantiq/xway
 pinctrl support
Date: Thu, 10 May 2012 15:24:04 +0200
Message-ID: <CACRpkdZ7YHQ0yhUOM=FB0MqbrT+QT7Zb9YP=JSADJB52qr68Yw@mail.gmail.com>
References: <1336652846-31871-1-git-send-email-blogic@openwrt.org>
 <1336652846-31871-2-git-send-email-blogic@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1336652846-31871-2-git-send-email-blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 10, 2012 at 2:27 PM, John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org> wrote:

> Implement support for pinctrl on lantiq/xway socs. The IO core found on t=
hese
> socs has the registers for pinctrl, pinconf and gpio mixed up in the same
> register range. As the gpio_chip handling is only a few lines, the driver=
 also
> implements the gpio functionality. This obseletes the old gpio driver tha=
t was
> located in the arch/ folder.
>
> Signed-off-by: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
> Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> ---
> This patch is part of a series moving the mips/lantiq target to OF and cl=
kdev
> support. The patch, once Acked, should go upstream via Ralf's MIPS tree.
>
> Changes in V2
> * cleanup select/depends of the relevant Kconfig symbols
> * dont assume that the arry with out MFPs is linearly mapped
> * sane return code checks inside ltq_pinctrl_dt_node_to_map
> * remove 2 calls to pr_err and replace them with calls to dev_err
> * propagate gpio_chips base addr to the gpio_range
> * define the pin count inside the of_device_id.data
> * minor changes to accomodate the pinctrl-falcon driver (more virt pointe=
rs
> =A0and clocks)
> * change from core_initcall_sync to arch_initcall
> * several typos, codestyle and whitespace cleanups
> * use BIT(x) in favour of (1 << x)

Acked-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Yours,
Linus Walleij
