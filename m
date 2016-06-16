From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 08/10] ARM: dts: sun9i: cubieboard4: Order
 nodes by alphabetical order
Date: Thu, 16 Jun 2016 10:14:41 +0200
Message-ID: <20160616081441.GH5144@lukather>
References: <1465986467-14802-1-git-send-email-wens@csie.org>
 <1465986467-14802-9-git-send-email-wens@csie.org>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ik0NlRzMGhMnxrMX"
Return-path: <rtc-linux+bncBDSJBYGBRIMBB4V7RG5QKGQEDJJP3GA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <1465986467-14802-9-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--ik0NlRzMGhMnxrMX
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Wed, Jun 15, 2016 at 06:27:45PM +0800, Chen-Yu Tsai wrote:
> Move the &pio node below the mmc nodes for proper ordering by name.
> 
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>

Applied, thanks!

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

-- 
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
--- 
You received this message because you are subscribed to the Google Groups "rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--ik0NlRzMGhMnxrMX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXYl/xAAoJEBx+YmzsjxAg+rIQAIJic/Ica37/xWQ52n0hfxdm
NCMUa0uLNknxve8+zrFkLymH8HgebpWC7VJHM9uuycXXcyNOboVjAUzsrO1IHZxq
SXxROc6fYuEUXVFY0ZO58vDwaK/m5Oo1D3oe+6HRgMbB5c4DVmMy99sxRh5/m93U
gWWfyHSsLrHuAJBuUgW0y0p26kPcsnstOSO+njZSBOCbzZtty1gSogh5kbVmcGNi
IburNSZ5k9J7VSFb6hMbQV3L9hwBv+n1jyEWQf/F/cPfZsBAVwlxbMLnI6snrjVm
si8xwfuqsF7gm7l39qME6P9gtGDGI0a+ffKOT1SQ9ks0qblPGq4+QIJFp8DEJwLp
oPBa+LkuiOFcJrZdB7fufE/TFQsewpfST5E/G76R6yDM53PBINgfb+zM+J5hs3pa
StcMjiQ4A6Xy1GJyLr6miqwt/69Re3Ba6ubZnVcWGxeMSkw8cMWbmb2o+Ok1PDmv
njDqNhBn5zjR1X+Eq9WIVY25eDtX8tL8rTK20kQwoa0Y+7gh3XccjCG0dzUOy6UP
pOiYDk1CNuFGWjTJtosFxKONUDlQ+6xdyiCVdSy/uMSxZ9czQDKvImXZ19CmyPMb
2jYHQzb3+prcVHmazcz3iksoqwEqKqepB7F3McjFVXKmmPtHx1W2fIkEqv0hOCHW
baGgBDXIkZNeyyNfdM6G
=fciQ
-----END PGP SIGNATURE-----

--ik0NlRzMGhMnxrMX--
