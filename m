From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [RFC PATCH 2/2] tee: add OP-TEE driver
Date: Sat, 18 Apr 2015 20:49:03 +0200
Message-ID: <20150418184903.GB30508@kroah.com>
References: <1429257057-7935-1-git-send-email-jens.wiklander@linaro.org>
 <1429257057-7935-3-git-send-email-jens.wiklander@linaro.org>
 <20150418085747.GC29858@kroah.com>
 <FCFF5E10-0DDC-4ED1-A8B8-D649ADD5E506@javigon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <FCFF5E10-0DDC-4ED1-A8B8-D649ADD5E506@javigon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier =?iso-8859-1?Q?Gonz=E1lez?= <javier@javigon.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Herbert Xu <herbert@gondor.apana.org.au>, tpmdd-devel@lists.sourceforge.net, Valentin Manea <valentin.manea@huawei.com>, jean-michel.delorme@st.com, emmanuel.michel@st.com
List-Id: devicetree@vger.kernel.org

On Sat, Apr 18, 2015 at 11:36:53AM +0200, Javier Gonz=E1lez wrote:
> Hi,

A: No.
Q: Should I include quotations after my reply?

http://daringfireball.net/2007/07/on_top

> We have discussed and implemented an in-kernel interface for the driv=
er.
> However, we need to agree on that interface with the kernel submodule=
s that
> can be interested in using it (e.g., IMA, keyring). We though it was =
easier
> to have a framework in place before taking this space. This makes sen=
se
> since a TEE driver will be, as for today, mostly used by user space.
> applications.

No, please provide a "real" solution, just providing a framework that n=
o
one uses means that I get to delete it from the kernel tree the next
release, and I doubt you want that :)

Please do all of the work here, as odds are, what you need in the end
will be different from what you have proposed here.

thanks,

greg k-h
