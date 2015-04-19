From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC PATCH 2/2] tee: add OP-TEE driver
Date: Sun, 19 Apr 2015 21:47:52 +0200
Message-ID: <7401865.1Pb83TJP0q@wuerfel>
References: <1429257057-7935-1-git-send-email-jens.wiklander@linaro.org> <4984990.7rV4p0zMYU@wuerfel> <3960750D-EAE4-4FA0-9E15-89F9CE39257E@javigon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3960750D-EAE4-4FA0-9E15-89F9CE39257E@javigon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Javier =?ISO-8859-1?Q?Gonz=E1lez?= <javier@javigon.com>, Valentin Manea <valentin.manea@huawei.com>, devicetree@vger.kernel.org, emmanuel.michel@st.com, Herbert Xu <herbert@gondor.apana.org.au>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, jean-michel.delorme@st.com, tpmdd-devel@lists.sourceforge.net, Jens Wiklander <jens.wiklander@linaro.org>
List-Id: devicetree@vger.kernel.org

On Sunday 19 April 2015 13:17:20 Javier Gonz=E1lez wrote:
>=20
> Only providing user space support would defeat one of the main purpos=
es
> of the driver. We could better organize the patches and divide them i=
nto user
> space support and in-kernel support if that is what you mean. In the =
end
> the interfaces are orthogonal, even though the functionality should b=
e very
> similar.

Splitting up the patches to separate the user interface from the in-ker=
nel
interface is certainly a good idea, but aside from that, I also agree w=
ith
Greg on this point: if you want to establish an in-kernel interface, do=
n't
add any dead code at the beginning, but add it together with the users
of that interface.

	Arnd
