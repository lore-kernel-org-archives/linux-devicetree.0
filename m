From: jacopo mondi <jacopo@jmondi.org>
Subject: Re: [PATCH 00/16] R-Car D3/E3 display support (with LVDS PLL)
Date: Wed, 5 Sep 2018 18:22:29 +0200
Message-ID: <20180905162229.GI28160@w540>
References: <20180904121027.24031-1-laurent.pinchart+renesas@ideasonboard.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1380535282=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180904121027.24031-1-laurent.pinchart+renesas@ideasonboard.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: devicetree@vger.kernel.org, Ulrich Hecht <uli@fpond.eu>, dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--===============1380535282==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QxN5xOWGsmh5a4wb"
Content-Disposition: inline


--QxN5xOWGsmh5a4wb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Laurent,

On Tue, Sep 04, 2018 at 03:10:11PM +0300, Laurent Pinchart wrote:
> Hello everybody,
>
> This patch series adds display support for the D3 and E3 SoCs, and in
> particular the Draak and Ebisu boards.
>
> The code is based on Ulrich's "[PROTO][PATCH 00/10] R-Car D3 LVDS/HDMI support
> (with PLL)" series previously posted to the dri-devel and linux-renesas-soc
> mailing lists. It has been extensively reworked and partly rewritten, and
> support for E3 and Ebisu has been added.
>
> The DU in the D3 and E3 SoCs has no internal PLL. In order to achieve precise
> pixel clock rates (required, among other use cases, for HDMI operation), the
> PLL from the internal LVDS encoder must be programmed and its output clock
> routed back to the DU.
>
> The series starts with update to the DU and LVDS encoder DT bindings to add E3
> (R8A77990) support (patches 01/16 and 02/16) and new clock sources for the
> LVDS encoder (patch 03/16).
>
> The next patch (04/16) adds a .mode_valid() operation to the thc63lvd1024
> driver, to reject modes outside of the LVDS decoder's pixel clock operating
> range (8 MHz to 135 MHz). The patch can be merged on its own separately from
> this series.
>
> Patch (05/16) adds support for D3 and E3 to the LVDS encoder driver. Compared
> to the already supported SoCs, D3 and E3 use a different initialization
> sequence and have a different PLL architecture, with more options for the
> input clock.
>
> The next five patches (06/16 to 10/16) perform small reworks or add support
> for miscellaneous missing features and limitations of the DU, to be followed
> by patch 11/16 that adds support for the D3 and E3 to the DU driver.
>
> Finally patches 12/16 to 16/16 enable display for the D3 and E3 boards in DT.
> Patch 12/16 adds support for the I2C controllers in the E3 DT, and will likely
> be merged separately from this series. Patch 13/16 adds all the display IP
> cores (FCP, VSP, DU and LVDS encoders) to the E3 DT, while patch 14/16 adds
> (and wires up) the missing LVDS encoders to the D3 DT. Patches 15/16 and 16/16
> then enable display output for the Ebisu and Draak boards respectively.
>
> I believe the patch series to be ready for upstreaming (after fixing the
> issues found during review of course). There is no big hack in the code, and I
> haven't noticed any regression. A few issues are still unsolved, such as how
> to disable display outputs independently on D3 and E3, and usage of the LVDS
> PLL for the RGB output, but those are not regressions and shouldn't in my
> opinion be considered as show stoppers.
>
> The patches are available from
>
> 	git://linuxtv.org/pinchartl/media.git drm/du/lvds-pll
>
> with an additional patch for E3 pinctrl that is required for testing and has
> been queued by Geert for v4.20 already.
>
> I have successfully tested the series with the HDMI output of the Ebisu board.
> Ulrich, Jacopo, could you test it on D3 if you have time ? You only need to
> run kmstest or modetest to display an image on the HDMI output.

HDMI output works fine with several modes I have tested:
1920x1080, 1280x720, 1024x768 and 1366x768

You can add my:
Tested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

If you need more testing please let me know.

Thanks
  j

>
> Kieran Bingham (1):
>   arm64: dts: renesas: r8a77995: Add LVDS support
>
> Laurent Pinchart (12):
>   dt-bindings: display: renesas: du: Document r8a77990 bindings
>   dt-bindings: display: renesas: lvds: Document r8a77990 bindings
>   dt-bindings: display: renesas: lvds: Add EXTAL and DU_DOTCLKIN clocks
>   drm: bridge: thc63: Restrict modes based on hardware operating
>     frequency
>   drm: rcar-du: lvds: D3/E3 support
>   drm: rcar-du: Perform the initial CRTC setup from rcar_du_crtc_get()
>   drm: rcar-du: Use LVDS PLL clock as dot clock when possible
>   drm: rcar-du: Enable configurable DPAD0 routing on Gen3
>   drm: rcar-du: Cache DSYSR value to ensure known initial value
>   drm: rcar-du: Don't use TV sync mode when not supported by the
>     hardware
>   arm64: dts: renesas: r8a77990: Add display output support
>   arm64: dts: renesas: r8a77990: ebisu: Enable VGA and HDMI outputs
>
> Takeshi Kihara (1):
>   arm64: dts: renesas: r8a77990: Add I2C device nodes
>
> Ulrich Hecht (2):
>   drm: rcar-du: Add r8a77990 and r8a77995 device support
>   arm64: dts: renesas: r8a77995: draak: Enable HDMI display output
>
>  .../bindings/display/bridge/renesas,lvds.txt       |  13 +-
>  .../devicetree/bindings/display/renesas,du.txt     |   2 +
>  arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts     | 166 ++++++++++
>  arch/arm64/boot/dts/renesas/r8a77990.dtsi          | 290 ++++++++++++++++
>  arch/arm64/boot/dts/renesas/r8a77995-draak.dts     |  98 +++++-
>  arch/arm64/boot/dts/renesas/r8a77995.dtsi          |  56 ++++
>  drivers/gpu/drm/bridge/thc63lvd1024.c              |  18 +
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c             | 136 ++++----
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.h             |   5 +
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c              |  63 +++-
>  drivers/gpu/drm/rcar-du/rcar_du_drv.h              |   3 +
>  drivers/gpu/drm/rcar-du/rcar_du_group.c            |  88 +++--
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c              |  12 +
>  drivers/gpu/drm/rcar-du/rcar_lvds.c                | 365 ++++++++++++++++++---
>  drivers/gpu/drm/rcar-du/rcar_lvds_regs.h           |  43 ++-
>  15 files changed, 1210 insertions(+), 148 deletions(-)
>
> --
> Regards,
>
> Laurent Pinchart
>

--QxN5xOWGsmh5a4wb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJbkALFAAoJEHI0Bo8WoVY8orAP+gNZWXbi4rZEAMbb9OhpWGWF
bxez4E8P53vl8/naav39RoniYSxKlnsDRffr8zuqq0atft6gl3+C/PT/q8mJQtVh
pleVy1mpWrlBYY0XNytzgTPPISImHw+PqZzdEiYVF/g0CQdSU+XGb46dfi84dScR
ZixgJ75RxfrngZswVF6B4pwaMs66CP8PLs8cREDLYLZ3cW9iWQorqsyRVNLlImrh
UO6suVVlb1zudaAINC05q+OGviZqxS8jTktRaw2M51cT3ldQYe/diF2L0c1Jn6hh
6QMdSZ+z3RTLhfgzm9O75f20uhBk3fS16aOtTcl3D5uQdMYKkkldSKG8enqyVpGh
BbGhE8RdCy20iPfOshnlrA9R46q1kf36xLxz42ZUT1H5frTQV4AP4B8VHcti2q3K
fj43i4/zawhvHBcNC7KknEp6gb9eQopD3EUH2orSvM6937w8i5Y30JzvR72oEbVb
57d8rs2jJvml+3sjWCXdxLpxFONkwrrTISDL0gaL5TkkS2t01aHe67uONeCkDOHz
mWomrkH+T0T67Tk58Zn6dpJLvUjed6GYOTO6d8YJQjWtBBp59MXP6SpiU+NVQdwT
BkFaVJStsr1dnqcuKvyLNxglXyIXU3s5ek60f3fTLy3kEJ2h0GcCoLFFCO3b9cpp
8jPQCX/ObbW8zxdln+Mu
=D+W8
-----END PGP SIGNATURE-----

--QxN5xOWGsmh5a4wb--

--===============1380535282==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1380535282==--
