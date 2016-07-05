From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] Fix spelling errors in Documentation/devicetree
Date: Tue, 5 Jul 2016 15:47:02 -0500
Message-ID: <20160705204702.GA28168@rob-hp-laptop>
References: <1467708506-18010-1-git-send-email-otto@seravo.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1467708506-18010-1-git-send-email-otto-Gh1NM5ZPXYb1KXRcyAk9cg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Otto =?iso-8859-1?Q?Kek=E4l=E4inen?= <otto-Gh1NM5ZPXYb1KXRcyAk9cg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 05, 2016 at 11:48:26AM +0300, Otto Kek=E4l=E4inen wrote:
> Signed-off-by: Otto Kek=E4l=E4inen <otto-Gh1NM5ZPXYb1KXRcyAk9cg@public.gmane.org>
> ---
>=20
> I sent this originally to trivial@, but they adviced to submit this d=
irectly to you.
> Please apply. Thank you!

I would, but...

>=20
>  Documentation/device-mapper/dm-crypt.txt           |    2 +-
>  Documentation/device-mapper/verity.txt             |    2 +-

These 2 are not part of DT. Otherwise, looks fine.

>  Documentation/devicetree/bindings/arm/l2c2x0.txt   |    4 ++--
>  Documentation/devicetree/bindings/net/dsa/dsa.txt  |    2 +-
>  .../devicetree/bindings/powerpc/fsl/fman.txt       |    4 ++--
>  .../devicetree/bindings/regmap/regmap.txt          |    2 +-
>  .../devicetree/bindings/serial/qcom,msm-uartdm.txt |    4 ++--
>  .../devicetree/bindings/sound/simple-card.txt      |    2 +-
>  Documentation/devicetree/bindings/spi/ti_qspi.txt  |    2 +-
>  .../bindings/timer/allwinner,sun5i-a13-hstimer.txt |    2 +-
>  10 files changed, 13 insertions(+), 13 deletions(-)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
