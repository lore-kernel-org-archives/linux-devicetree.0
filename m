From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/1 v3] dt: add property iteration helpers
Date: Wed, 11 Apr 2012 10:07:12 +0200
Message-ID: <CACRpkdbW52MZzRnw8VLs7ZTwHapzr7vjmN3u3TnKijbVB3=zcg@mail.gmail.com>
References: <1333968374-28451-1-git-send-email-plagnioj@jcrosoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1333968374-28451-1-git-send-email-plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Apr 9, 2012 at 12:46 PM, Jean-Christophe PLAGNIOL-VILLARD
<plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org> wrote:

> This patch adds macros of_property_for_each_u32() and
> of_property_for_each_string(), which iterate over an array of values
> within a device-tree property. Usage is for example:
>
> struct property *prop;
> const __be32 *p;
> u32 u;
> of_property_for_each_u32(np, "propname", prop, p, u)
> =A0 =A0 =A0 =A0printk("U32 value: %x\n", u);
>
> struct property *prop;
> const char *s;
> of_property_for_each_string(np, "propname", prop, s)
> =A0 =A0 =A0 =A0printk("String value: %s\n", s);
>
> Based on work by Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>
> Signed-off-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
> ---
> I need it for at91 for the interrupt controller
> and pinctrl

This is merged into the pinctrl tree now anyway, can I add your
Acked-by:?

Yours,
Linus Walleij
