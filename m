From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 1/3] reset: Add shared
 reset_control_[de]assert variants
Date: Mon, 14 Dec 2015 10:36:07 +0100
Message-ID: <20151214093607.GF19456@lukather>
References: <1449848520-27379-1-git-send-email-hdegoede@redhat.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Zi0sgQQBxRFxMTsj"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBCE3XKZQKGQE4SND3HY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1449848520-27379-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Josh Triplett <josh-iaAMLnmF4UmaiuxdJuQwMA@public.gmane.org>, Rashika Kheria <rashika.kheria-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--Zi0sgQQBxRFxMTsj
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi,

On Fri, Dec 11, 2015 at 04:41:58PM +0100, Hans de Goede wrote:
> diff --git a/include/linux/reset.h b/include/linux/reset.h
> index c4c097d..1cca8ce 100644
> --- a/include/linux/reset.h
> +++ b/include/linux/reset.h
> @@ -11,6 +11,8 @@ int reset_control_reset(struct reset_control *rstc);
>  int reset_control_assert(struct reset_control *rstc);
>  int reset_control_deassert(struct reset_control *rstc);
>  int reset_control_status(struct reset_control *rstc);
> +int reset_control_assert_shared(struct reset_control *rstc);
> +int reset_control_deassert_shared(struct reset_control *rstc);

Shouldn't that be handled in reset_control_get directly?

That would allow to share more code between the implementations, since
it would just be a flag to test in the get and not duplicate the
function definitions, and we could simply rely on the refcount to know
if we have to actually assert / deassert the device, in all the cases
(shared or not).

That would also allow us to catch easily if we're going to be able a
shared reset line or not, with the regular reset_control_get being
exclusive, and reset_control_get_shared or reset_control_get(..,
RESET_SHARED) being shared.

It would also avoid ending up with the shared variant used in every
generic driver eventually. We could just use the variant to see if we
have to use the shared get or not, and the rest of the driver is left
untouched, which is way less intrusive.

Moreover, it's also pretty much the pattern used everywhere else
(irqs, regulator, clocks, etc.), so it's going to be easier to review
as well.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--Zi0sgQQBxRFxMTsj--
