From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH v3 3/6] usb: dwc3: dwc3-st: Update the incorrect DT dwc3
 example.
Date: Thu, 7 May 2015 11:15:55 -0500
Message-ID: <20150507161555.GA29183@saruman.tx.rr.com>
References: <1430400652-3366-1-git-send-email-peter.griffin@linaro.org>
 <1430400652-3366-4-git-send-email-peter.griffin@linaro.org>
 <20150507151358.GA14123@griffinp-ThinkPad-X1-Carbon-2nd>
Reply-To: <balbi@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="r5Pyd7+fXNt84Ff3"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150507151358.GA14123@griffinp-ThinkPad-X1-Carbon-2nd>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, maxime.coquelin@st.com, patrice.chotard@st.com, balbi@ti.com, srinivas.kandagatla@gmail.com, lee.jones@linaro.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

--r5Pyd7+fXNt84Ff3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 07, 2015 at 04:13:58PM +0100, Peter Griffin wrote:
> Hi Felipe,
>=20
> On Thu, 30 Apr 2015, Peter Griffin wrote:
>=20
> > There is a subtle typo phys-names should be phy-names. Using the
> > current example means you don't have working usb (as you fail to
> > obtain the phys). Also update the example to use the generic phy
> > type constants which are now used for miphy28.
> >=20
> > Additionally also remove the unnecessary new line in the example.
> >=20
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > Acked-by: Rob Herring <robh@kernel.org>
> > Acked-by: Maxime Coquelin <maxime.coquelin@st.com>
>=20
> Can you take this dwc3 DT doc update patch via your tree?

only this patch ? Sure. Just post on linux-usb and I'll fetch it from
there.

--=20
balbi

--r5Pyd7+fXNt84Ff3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVS4+7AAoJEIaOsuA1yqRE8a0QAI3u2PIaAOgLnRnPz0zVExax
gwMDZZqSKH4ty6Fh6XySbIP5FiMquyLL5DNLEnKBqgiiE0fLYOuuAj0UCrk9czmK
VDpKs1AaoBlMcK3e+dihZpsVh9dWyqmY6LzU/mX1SE9r5x64GreuS8R8FW1Riwzm
v3Q/jbDa7LYQPKDJARMbrstsPo3QW969amSwHnBmuNdrxBlSFF6rnLcI+lct6YOB
9sHAidnSF1/9YLqOsMttm0ZMibRktr8meEpXJkWy8QqC9NySTnyVjXMWF4x1DASd
Hpp5pOS3CI4Uv/y1XZgjaovISmNNxTzNOvvwuHkhvqa6Co+TU9BvQ72iuSlMQC+h
pR0M6uPvRW3BDjcDCuOa4OH2ygusbOlsJXAaLK2Yp9WiMkcY3xu5kMlX+VGrbtDE
yRqqzu7I9RVh2BECXiRBuR2TdS//lrTVAJPsMy5ARD9qKMwiVrf2b2yt4mZlOrUU
CkpLWeWZ8NUKM/yxlrMd1lWOzR9H39jOCj9F3Aw4jTuIHrSqldOvexE+a0iWrKrb
CWfSqvaHNKbiijhTFSli4fXegNaucI4Saelk05M0ZF9hbGpwLCGtov+uOQuuzjT+
Vxp+V06ak/nGxwRFlz5R8GK0HMoHCFXUn7FXuR+ozOyIsssaxd6hIl6R7jMfMoma
2NlUndBK+G1OobRlphNL
=PfdX
-----END PGP SIGNATURE-----

--r5Pyd7+fXNt84Ff3--
