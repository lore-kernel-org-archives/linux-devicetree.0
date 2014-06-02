From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 0/3] Qualcomm Resource Power Manager driver
Date: Mon, 2 Jun 2014 11:01:01 +0100
Message-ID: <20140602100101.GW5099@sirena.org.uk>
References: <1401211721-19712-1-git-send-email-bjorn.andersson@sonymobile.com>
 <F773CDFB-2957-49C0-99D3-E9CDCE33C378@codeaurora.org>
 <CAJAp7Ojb7PvuNYJkPyKx+iehi0bF6rdYvYmfrDz21mebxMN1qg@mail.gmail.com>
 <538C329C.8060009@mm-sol.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BxNWZcw0TMazIwHZ"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <538C329C.8060009@mm-sol.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stanimir Varbanov <svarbanov@mm-sol.com>
Cc: Bjorn Andersson <bjorn@kryo.se>, Kumar Gala <galak@codeaurora.org>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Josh Cartwright <joshc@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Jassi Brar <jaswinder.singh@linaro.org>
List-Id: devicetree@vger.kernel.org


--BxNWZcw0TMazIwHZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 02, 2014 at 11:15:24AM +0300, Stanimir Varbanov wrote:

> > Lately I've been working on rpm, rpm-smd, smem, smd, smsm, smp2p
> > patches for mainline.
> > It could be argued that smd is a bus and should go in drivers/bus, but
> > for the rest I fear that we just created drivers/soc/qcom as another
> > dumping ground for things; a "Qualcomm specific drivers/mfd".

> Do we have some obstacles to not use a "common mailbox framework" for
> this IPC (shared memory) communication. It looks that it fits very well
> with our needs for this rpm-regulator and future submitting of smd driver?

Jassi (CCed) has been working on just such a thing.

--BxNWZcw0TMazIwHZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTjEtaAAoJELSic+t+oim9HhgQAIXhDbMgOyUQm2sJGGoCDL+l
ET91x9w0swFNkNfyNo59eLfekMRmGvJZ1eQ7IfDDUCTASIA5caYXL1uoFJ4zJlvF
87Pfx1qORk7h3zsh5ozCo++jsm9Ac/U945lrSniOomezVVeFYf31gbXORV+NRAIX
YVNNiKpyJU0t/sylgIoaOuaX+yhwxQR0L7j1vCOc5smROQZt81sBAbHnZK2iwAwT
B7pKOPNTqOmp/wR5x6ukvV4BVKrLDLfh7cxfjEXB5iJjSWHYdSe4Fc6zmCsX0oM1
pUDz2G+1PRJe3QUZB+Dm27T/72e4uFxBK9XTkmKjE6Ai9DIaR9TTkoYLDk44awfD
BqIK6GNsnaXR4KH0O6/p/09dMJqamm+t6YeSVTeNoIvFHKL69VHBjO0yCUvMHAFe
lKPojFazne+JFgEaXAwTzgEvukWRRqizv+T5c2ZLj/uSqJnrDVMzPpwizvWYTr0x
gYlGPRYFjH+SagB8d1hKBJy/o8Ue/l8XsRengQwBR7JJkeROSjCHMdMqm+9T/SHn
xGeUT+Lai1kmi7LmpFxzSxKzuI4L4hLWTRwAENABIx/DQrpPily9b5hjHNftKjwo
eArzqLarFpdgY5cWlju6ydk63Np7pfvQZjJ99QhN3ksoiuWL/LPuH+oG3qr5ELu/
0G5UrDkTOeNrVcXWp7hs
=zHKl
-----END PGP SIGNATURE-----

--BxNWZcw0TMazIwHZ--
