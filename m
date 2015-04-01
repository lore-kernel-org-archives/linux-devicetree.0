From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: imx6: Add Embest MarS Board
Date: Wed, 1 Apr 2015 08:39:12 -0300
Message-ID: <CAOMZO5DM66sUX-YojCyY5BC3Pdk4p4bkEqQ+W3tyDeNEL6nU5w@mail.gmail.com>
References: <1427875809-10444-1-git-send-email-vianney.leclement@essensium.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1427875809-10444-1-git-send-email-vianney.leclement-buIOx9BAs4sybS5Ee8rs3A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Vianney_le_Cl=C3=A9ment_de_Saint=2DMarcq?= <vianney.leclement-buIOx9BAs4sybS5Ee8rs3A@public.gmane.org>
Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Iain Paton <ipaton0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 1, 2015 at 5:10 AM, Vianney le Cl=C3=A9ment de Saint-Marcq
<vianney.leclement-buIOx9BAs4sybS5Ee8rs3A@public.gmane.org> wrote:
> Add device tree for the Embest/Element 14 MarS Board [1], an i.MX6 Du=
al
> based development board.
>
> The e-MMC chip is disabled because initialization fails (error -110).
> A possible cause is described in [2].
>
> [1] http://www.embest-tech.com/shop/star/marsboard.html
> [2] https://community.freescale.com/message/442168#442168
>
> Signed-off-by: Vianney le Cl=C3=A9ment de Saint-Marcq <vianney.leclem=
ent-buIOx9BAs4sybS5Ee8rs3A@public.gmane.org>

Couldn't this be combined with the existing
arch/arm/boot/dts/imx6dl-riotboard.dts?

Regards,

=46abio Estevam
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
