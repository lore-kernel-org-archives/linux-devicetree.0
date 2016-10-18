From: Paul Burton <paul.burton@imgtec.com>
Subject: Re: [PATCH v2] console: Don't prefer first registered if DT specifies stdout-path
Date: Tue, 18 Oct 2016 10:21:36 +0100
Message-ID: <2401691.yKn6kY81q4@np-p-burton>
References: <20160809125010.14150-1-paul.burton@imgtec.com> <4033254.tBrl4yKcsP@np-p-burton> <87oa2ij2mq.fsf@linux-m68k.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1491817.ehho7IUxQd";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87oa2ij2mq.fsf@linux-m68k.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, Tejun Heo <tj@kernel.org>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, Jiri Slaby <jslaby@suse.cz>, Daniel Vetter <daniel.vetter@ffwll.ch>, Ivan Delalande <colona@arista.com>, Thierry Reding <treding@nvidia.com>, Borislav Petkov <bp@suse.de>, Jan Kara <jack@suse.com>, Petr Mladek <pmladek@suse.com>, linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Frank Rowand <frowand.list@gmail.com>, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

--nextPart1491817.ehho7IUxQd
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, 17 October 2016 19:39:57 BST Andreas Schwab wrote:
> On Okt 17 2016, Paul Burton <paul.burton@imgtec.com> wrote:
> > Could you share the device tree from your system?
> 
> This is the contents of chosen/linux,stdout-path on the systems I have:
> 
> chosen/linux,stdout-path
>                  "/pci@f0000000/ATY,SnowyParent@10/ATY,Snowy_A@0"
> 
> chosen/linux,stdout-path
>                  "/pci@0,f0000000/NVDA,Parent@10/NVDA,Display-B@1"
> 
> Is that what you need?  There is also chosen/stdout, but no
> aliases/stdout.
> 
> Andreas.

Hi Andreas,

I think I see the problem & I'm hoping this patch will fix it:

https://lkml.org/lkml/2016/10/18/142

Could you give it a try & let me know?

Thanks,
    Paul
--nextPart1491817.ehho7IUxQd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYBemgAAoJEIIg2fppPBxl/ocP/RsSGhUJsbbXOzHH0zhvW5/0
lmP447zgfYfSB63uNeLJ/uZwmyYVy5/6by9+88bPp+pnw5IvbH2oWOcClRXBopP2
a03Yn/sGYx1nybguqE0CIMql9keWdudPQB2W3008pg7jMRx7DeOnWLLJqgDK2eRH
/0dqLH8ISm7olbbfbJOmSZhKI/cip2mB3utR0/wln/f89bXbFKDkyf/S9m2p0+/o
agKLZNbxlT8ApQIgTdy2wYYJej3DIwNe7jofxKVlQ/hjvVBq4T80kbEuLeBYVn9L
7bUoIplFzLHidsNYCXUm+uuaC8ogtu0kV9akIHzx1yTtwsEiKP59I/N7IjvcvNDU
AygRucuIiYL6OzXFwktChzqLmG07deHNPSxBS+Tsx82Gt5IO984nFLuOZwYmQFSY
yWCsTZS/R74GQBth1vhH1hBtMViHPqW6UFvQ5xhUGV/dLsevO+azgSlcYnDFr2GE
TfZJ/laYn3mh2zSlGmJX5KU8eiqIUuF47eAx29twD3W/6XSMWDj/mJe4LnW9/zqb
G3WSOoLrv2gYvNaaCGGyAfJMshQqlod9QCCifsXPAnB3jge2VW3AJT47KeBeNzJV
WtQR5w5PK2iPE05lbcOoLICopg0Utlb005M6UYGzzVSaKD4xkNrDWaOAaTlCfkn8
SNxS0sVuI8lxwzZNdr3V
=dSrA
-----END PGP SIGNATURE-----

--nextPart1491817.ehho7IUxQd--
