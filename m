From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [RESEND v4 2/6] remoteproc: debugfs: Add ability to boot remote
 processor using debugfs
Date: Fri, 4 Dec 2015 08:24:27 +0000
Message-ID: <20151204082427.GC26902@x1>
References: <1448370862-19120-1-git-send-email-lee.jones@linaro.org>
 <2600153.9u9Z7N2IT1@wuerfel>
 <20151203172830.GB26902@x1>
 <2473673.tSymyNlg3h@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2473673.tSymyNlg3h@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, Ohad Ben-Cohen <ohad@wizery.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, kernel@stlinux.com, Nathan_Lynch@mentor.com, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Bjorn Andersson <bjorn@kryo.se>, ludovic.barre@st.com, Maxime Coquelin <maxime.coquelin@st.com>
List-Id: devicetree@vger.kernel.org

On Thu, 03 Dec 2015, Arnd Bergmann wrote:

> On Thursday 03 December 2015 17:28:30 Lee Jones wrote:
> > >=20
> > > Ah, interesting. I haven't tried myself, and just tried to read t=
he
> > > code. Maybe glibc already catches zero-length writes before it ge=
ts
> > > into the kernel, or I just missed the part of the syscall that ch=
ecks
> > > for this.
> >=20
> > Glibc is responsible indeed:
> >  =20
> >   http://osxr.org/glibc/source/io/write.c
>=20
> Ok, so an attacker can force the stack overflow by calling
> syscall(__NR_write, fd, p, 0) if that has any potential value,
> but normal users won't hit this case.

Right.  I have fixed the issue (and another one I found) anyway, if
only to rid the GCC warning.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
