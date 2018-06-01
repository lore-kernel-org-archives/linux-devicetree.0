From: jacopo mondi <jacopo@jmondi.org>
Subject: Re: [PATCH v3 2/8] dt-bindings: media: Document data-enable-active
 property
Date: Fri, 1 Jun 2018 16:58:27 +0200
Message-ID: <20180601145827.GG10472@w540>
References: <1527606359-19261-1-git-send-email-jacopo+renesas@jmondi.org>
 <1527606359-19261-3-git-send-email-jacopo+renesas@jmondi.org>
 <20180601102910.3qhe6bhg3w263chq@paasikivi.fi.intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3504235763235026476=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180601102910.3qhe6bhg3w263chq@paasikivi.fi.intel.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, linux-renesas-soc@vger.kernel.org, horms@verge.net.au, geert@glider.be, laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se, Jacopo Mondi <jacopo+renesas@jmondi.org>, mchehab@kernel.org, hans.verkuil@cisco.com, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--===============3504235763235026476==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/Zw+/jwnNHcBRYYu"
Content-Disposition: inline


--/Zw+/jwnNHcBRYYu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Sakari,

On Fri, Jun 01, 2018 at 01:29:10PM +0300, Sakari Ailus wrote:
> Hi Jacopo,
>
> Thanks for the patch.
>
> On Tue, May 29, 2018 at 05:05:53PM +0200, Jacopo Mondi wrote:
> > Add 'data-enable-active' property to endpoint node properties list.
> >
> > The property allows to specify the polarity of the data-enable signal, which
> > when in active state determinates when data lanes have to sampled for valid
> > pixel data.
>
> Lanes or lines? I understand this is forthe parallel interface.
>

Now I'm confused. Are the parallel data 'lines' and the CSI-2 one
'lanes'? I thought 'lanes' applies to both.. am I wrong?

Thanks
   j

> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> > v3:
> > - new patch
> > ---
> >  Documentation/devicetree/bindings/media/video-interfaces.txt | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt b/Documentation/devicetree/bindings/media/video-interfaces.txt
> > index 258b8df..9839d26 100644
> > --- a/Documentation/devicetree/bindings/media/video-interfaces.txt
> > +++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
> > @@ -109,6 +109,8 @@ Optional endpoint properties
> >    Note, that if HSYNC and VSYNC polarities are not specified, embedded
> >    synchronization may be required, where supported.
> >  - data-active: similar to HSYNC and VSYNC, specifies data line polarity.
> > +- data-enable-active: similar to HSYNC and VSYNC, specifies the data enable
> > +  signal polarity.
> >  - field-even-active: field signal level during the even field data transmission.
> >  - pclk-sample: sample data on rising (1) or falling (0) edge of the pixel clock
> >    signal.
>
> --
> Sakari Ailus
> sakari.ailus@linux.intel.com

--/Zw+/jwnNHcBRYYu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJbEV8TAAoJEHI0Bo8WoVY85bcQALq9QCXDqB94Jyxv6MRl2o8z
O3sXzppQ7wYp3eNswDFsSOhlXLunaXhJTvgXAeg60wKbeLVRqcxJXxdf9VTfLxoW
kLo/rmrwy0VDuf38FeujZYMc7u2oYlgGYIsnlSg8g/Jhmjj8AgEOuhUQCzSmuTxV
BfksqYqyrey2n8G3G3INS51pKIm/IzSeOSucHbzp/s2QiHJNRXqetVMCZejMHT3f
WV5BE6UmBklUwBL/1dlOzWCzFSAHPV/rPyPhiSjB+QNURBQmszdDXBGmFzu14E8Z
lOvpq0NUInTmqj9g011MAI7AuJSQrPhXS6v9BbzGxLtZKRjqXvCAyrKS8LOpajXP
fx23Bt2CS9ZuvBKxFQ/8XwgyGkxjhM8/6gyiJrBzh3UlqdUTsA+yUPvHnKjAn4V7
YzUT3j2USWumE3rZRxchmp3vj+a5w49rWWOLMbT8e22FLo28k/OPk7muLAYA8NrF
GRArj8madmoVRe2Ijsj25Sfypf3C07qOzvgLu5jurRgwZXfNOpszvDQwera17uRt
3goUe0El/pqQt+mkf5UG3UZcaLoJ0pAYOhirrCik/2qZT5CpNT3tTsMoV7BBfTnh
BtfOwL8BNp0eDtWYvPD+nHyjc6571zVn0F8XzCOu2plP70CxwmtPyd3+PVOYYt+i
WO8gyTlmVA/LAq7TecCt
=Ttaf
-----END PGP SIGNATURE-----

--/Zw+/jwnNHcBRYYu--


--===============3504235763235026476==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============3504235763235026476==--
