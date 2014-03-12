From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 2/6] pinctrl: st: Enhance the controller to manage
 unavailable registers
Date: Wed, 12 Mar 2014 15:16:32 +0100
Message-ID: <CACRpkdY4FJ04=jnU_7GVM_W80Lx=t2nggx9=2=cfdHAJdN2kNw@mail.gmail.com>
References: <1394614210-15698-1-git-send-email-maxime.coquelin@st.com>
	<1394614210-15698-3-git-send-email-maxime.coquelin@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1394614210-15698-3-git-send-email-maxime.coquelin-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime COQUELIN <maxime.coquelin-qxv4g6HH51o@public.gmane.org>
Cc: Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>, Stuart Menefy <stuart.menefy-qxv4g6HH51o@public.gmane.org>, Giuseppe Cavallaro <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 12, 2014 at 9:50 AM, Maxime COQUELIN <maxime.coquelin-qxv4g6HH51o@public.gmane.org> wrote:

> From: Giuseppe Cavallaro <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>
>
> This patch adds a new logic inside the st pinctrl to manage
> an unsupported scenario: some sysconfig are not available!
>
> This is the case of STiH407 where, although documented, the
> following registers from SYSCFG_FLASH have been removed from the SoC.
>
> SYSTEM_CONFIG3040
>    Output Enable pad control for all PIO Alternate Functions
> and
> SYSTEM_ CONFIG3050
>    Pull Up pad control for all PIO Alternate Functions
>
> Without managing this condition an imprecise external abort
> will be detect.
>
> To do this the patch also reviews the st_parse_syscfgs
> and other routines to manipulate the registers only if
> actually available.
> In any case, for example the st_parse_syscfgs detected
> an error condition but no action was made in the
> st_pctl_probe_dt.
>
> Acked-by: Giuseppe Cavallaro <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>
> Acked-by: Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
> Signed-off-by: Giuseppe Cavallaro <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>
> Signed-off-by: Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>

This v4 version applied to the pinctrl devel branch with
Lee's ACK.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
