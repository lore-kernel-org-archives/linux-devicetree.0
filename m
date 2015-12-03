From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RESEND v4 2/6] remoteproc: debugfs: Add ability to boot remote processor using debugfs
Date: Thu, 03 Dec 2015 22:12:59 +0100
Message-ID: <2473673.tSymyNlg3h@wuerfel>
References: <1448370862-19120-1-git-send-email-lee.jones@linaro.org> <2600153.9u9Z7N2IT1@wuerfel> <20151203172830.GB26902@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151203172830.GB26902@x1>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Lee Jones <lee.jones@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, kernel@stlinux.com, Nathan_Lynch@mentor.com, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Bjorn Andersson <bjorn@kryo.se>, ludovic.barre@st.com, Maxime Coquelin <maxime.coquelin@st.com>
List-Id: devicetree@vger.kernel.org

On Thursday 03 December 2015 17:28:30 Lee Jones wrote:
> > 
> > Ah, interesting. I haven't tried myself, and just tried to read the
> > code. Maybe glibc already catches zero-length writes before it gets
> > into the kernel, or I just missed the part of the syscall that checks
> > for this.
> 
> Glibc is responsible indeed:
>   
>   http://osxr.org/glibc/source/io/write.c

Ok, so an attacker can force the stack overflow by calling
syscall(__NR_write, fd, p, 0) if that has any potential value,
but normal users won't hit this case.

	Arnd
