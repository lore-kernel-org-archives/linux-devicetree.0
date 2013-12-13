From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH v6 08/15] usb: phy-mxs: Add implementation of
 nofity_suspend and notify_resume
Date: Fri, 13 Dec 2013 14:09:24 -0600
Message-ID: <20131213200924.GI5292@saruman.home>
References: <1386897825-6130-1-git-send-email-peter.chen@freescale.com>
 <1386897825-6130-9-git-send-email-peter.chen@freescale.com>
 <20131213043236.GH867@saruman.home>
 <CAL411-rEJN_AkmJEooVB+45qDE8n8CGNq-ODUKMhfPyuQ5fPwA@mail.gmail.com>
Reply-To: balbi@ti.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5038738977080246005=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAL411-rEJN_AkmJEooVB+45qDE8n8CGNq-ODUKMhfPyuQ5fPwA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Peter Chen <hzpeterchen@gmail.com>
Cc: Marek =?utf-8?B?VmHFoXV0?= <marex@denx.de>, devicetree@vger.kernel.org, m.grzeschik@pengutronix.de, frank.li@freescale.com, linux-doc@vger.kernel.org, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "balbi@ti.com" <balbi@ti.com>, Fabio Estevam <festevam@gmail.com>, Peter Chen <peter.chen@freescale.com>, kernel@pengutronix.de, grant.likely@linaro.org, Shawn Guo <shawn.guo@linaro.org>, rob.herring@calxeda.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============5038738977080246005==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EdRE1UL8d3mMOE6m"
Content-Disposition: inline

--EdRE1UL8d3mMOE6m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2013 at 02:31:42PM +0800, Peter Chen wrote:
> On Fri, Dec 13, 2013 at 12:32 PM, Felipe Balbi <balbi@ti.com> wrote:
> > On Fri, Dec 13, 2013 at 09:23:38AM +0800, Peter Chen wrote:
> >> Implementation of notify_suspend and notify_resume will be different
> >> according to mxs_phy_data->flags.
> >>
> >> Signed-off-by: Peter Chen <peter.chen@freescale.com>
> >> ---
> >>  drivers/usb/phy/phy-mxs-usb.c |   55 ++++++++++++++++++++++++++++++++=
++++++---
> >>  1 files changed, 51 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-u=
sb.c
> >> index 0ef930a..e3df53f 100644
> >> --- a/drivers/usb/phy/phy-mxs-usb.c
> >> +++ b/drivers/usb/phy/phy-mxs-usb.c
> >> @@ -166,8 +166,8 @@ static int mxs_phy_suspend(struct usb_phy *x, int =
suspend)
> >>  static int mxs_phy_on_connect(struct usb_phy *phy,
> >>               enum usb_device_speed speed)
> >>  {
> >> -     dev_dbg(phy->dev, "%s speed device has connected\n",
> >> -             (speed =3D=3D USB_SPEED_HIGH) ? "high" : "non-high");
> >> +     dev_dbg(phy->dev, "%s device has connected\n",
> >> +             (speed =3D=3D USB_SPEED_HIGH) ? "HS" : "FS/LS");
> >
> > unrelated.
> >
> >> @@ -179,8 +179,8 @@ static int mxs_phy_on_connect(struct usb_phy *phy,
> >>  static int mxs_phy_on_disconnect(struct usb_phy *phy,
> >>               enum usb_device_speed speed)
> >>  {
> >> -     dev_dbg(phy->dev, "%s speed device has disconnected\n",
> >> -             (speed =3D=3D USB_SPEED_HIGH) ? "high" : "non-high");
> >> +     dev_dbg(phy->dev, "%s device has disconnected\n",
> >> +             (speed =3D=3D USB_SPEED_HIGH) ? "HS" : "FS/LS");
> >
> > unrelated.
> >
>=20
> Marek suggested using that string, I will added it at another patch.
>=20
> >> @@ -189,6 +189,48 @@ static int mxs_phy_on_disconnect(struct usb_phy *=
phy,
> >>       return 0;
> >>  }
> >>
> >> +static int mxs_phy_on_suspend(struct usb_phy *phy,
> >> +             enum usb_device_speed speed)
> >> +{
> >> +     struct mxs_phy *mxs_phy =3D to_mxs_phy(phy);
> >> +
> >> +     dev_dbg(phy->dev, "%s device has suspended\n",
> >> +             (speed =3D=3D USB_SPEED_HIGH) ? "HS" : "FS/LS");
> >> +
> >> +     /* delay 4ms to wait bus entering idle */
> >> +     usleep_range(4000, 5000);
> >> +
> >> +     if (mxs_phy->data->flags & MXS_PHY_ABNORMAL_IN_SUSPEND) {
> >> +             writel_relaxed(0xffffffff, phy->io_priv + HW_USBPHY_PWD);
> >> +             writel_relaxed(0, phy->io_priv + HW_USBPHY_PWD);
> >> +     }
> >> +
> >> +     if (speed =3D=3D USB_SPEED_HIGH)
> >> +             writel_relaxed(BM_USBPHY_CTRL_ENHOSTDISCONDETECT,
> >> +                             phy->io_priv + HW_USBPHY_CTRL_CLR);
> >
> > why only on HS ? So if !HS and !ABNORMAL, this is no-op.
> >
> >> +static int mxs_phy_on_resume(struct usb_phy *phy,
> >> +             enum usb_device_speed speed)
> >> +{
> >> +     dev_dbg(phy->dev, "%s device has resumed\n",
> >> +             (speed =3D=3D USB_SPEED_HIGH) ? "HS" : "FS/LS");
> >> +
> >> +     if (speed =3D=3D USB_SPEED_HIGH) {
> >> +             /* Make sure the device has switched to High-Speed mode =
*/
> >> +             udelay(500);
> >> +             writel_relaxed(BM_USBPHY_CTRL_ENHOSTDISCONDETECT,
> >> +                             phy->io_priv + HW_USBPHY_CTRL_SET);
> >> +     }
> >
> > likewise, if !HS it's a no-op.
> >
>=20
> Correct,  this operation is only needed for HS.
>=20
> >> @@ -235,6 +277,11 @@ static int mxs_phy_probe(struct platform_device *=
pdev)
> >>
> >>       platform_set_drvdata(pdev, mxs_phy);
> >>
> >> +     if (mxs_phy->data->flags & MXS_PHY_SENDING_SOF_TOO_FAST) {
> >> +             mxs_phy->phy.notify_suspend =3D mxs_phy_on_suspend;
> >> +             mxs_phy->phy.notify_resume =3D mxs_phy_on_resume;
> >> +     }
> >
> > hmm, and seems like you only need notify_* on a buggy device. Sorry
> > Peter but you don't have enough arguments to make me agree with this
> > (and previous) patch.
> >
> > You gotta find a better way to handle this using normal phy
> > suspend/resume calls.
> >
>=20
> Like I explained at previous patch, it needs to be notified during
> ehci suspend/resume.
> I admit it is a SoC bug, but all SoCs have bugs, hmm.
> Software needs the solution to workaround it which breaks the standard US=
B spec.

Then I think what you need is a real notification mechanism. usbcore
already notifies about buses and devices being added and removed,
perhaps you can convince Greg to accept suspend/resume notifications.

With that, you can (conditionally) make this driver listen to usbcore
notifications. That'll be more work, but I guess it's best in the long
run as we won't need to keep on adding callbacks to the USB PHY
structure just because another buggy device showed up on the market.

--=20
balbi

--EdRE1UL8d3mMOE6m
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)

iQIcBAEBAgAGBQJSq2l0AAoJEIaOsuA1yqRE8h8P/0OIj+9XTonE6OCwGpbNkk3z
6mMtBNdmhpSpQ6/SUaRiR8i2B2UulSKbcOtMDBz9jgcEanL0/n5DH+FGgGTHks2N
VhqpjD/y7yhAOSylusOosxUoegjTC2Q4387kd1ifzusBOIqlCbjcpKe/mhxjMNx1
i78QZxJft85lK2WTWfyih8Sl3B/7vAKm0SeRfeoCWqQVZkYKsGSMVhB9c1gc6wra
45g5bgOS67/WtD27XeXDwSxGbaW8SskFdoBYl26DlpycLEAc+QCSJ4Dijl8xXdEG
eYAuNYPhkvGVjn5LTDmCaxw1iGouoIZva/+IiauwnWOtGcwkxad8zQkjTdLyqYtz
EOoT1ILLRuZnVaMhOqKexK3A+f7DL7wl6xaShGRPS1De4m37IO/4BIr3vS/yGyLB
OC8zkYuqZjCOcINnMk/ofqziE2F0oT2ZPyxRo74G1b+0L2n215HE0YVuRFGYdLXw
LqVo6SnpGcDCFkFZN/QVLnhy7FcyIjjod6vlBrh+GEvUlLqzvzq32jiPDlLrqmpj
aSn8w6KtSdsEYlTQdAgJvuly83H/KBLmb2X4tajeLViRWRtlGDlDAxEw7QVkjzul
9WKYw3mV8ouMc95GdAsMf3FGkWJzGowmhRRwJ+T5zDM7lrfMf/2hVaU6gITrq9+T
or9uvEQetl894keP35Co
=botE
-----END PGP SIGNATURE-----

--EdRE1UL8d3mMOE6m--


--===============5038738977080246005==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5038738977080246005==--
