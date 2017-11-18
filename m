From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH 2/2] kbuild: remove all dummy assignments to obj-
Date: Sat, 18 Nov 2017 13:08:27 +0900
Message-ID: <CAK7LNATMJMr-DSP=aukpbuOffBFwY-hP6a4NJenrCcivt5HmMw@mail.gmail.com>
References: <1510072307-16819-1-git-send-email-yamada.masahiro@socionext.com> <1510072307-16819-3-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kbuild-owner@vger.kernel.org>
In-Reply-To: <1510072307-16819-3-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Linux-MIPS <linux-mips@linux-mips.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, Ralf Baechle <ralf@linux-mips.org>, Alexei Starovoitov <ast@kernel.org>, netdev@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Daniel Borkmann <daniel@iogearbox.net>, Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

2017-11-08 1:31 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> Now kbuild core scripts create empty built-in.o where necessary.
> Remove "obj- := dummy.o" tricks.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>

Applied to linux-kbuild/kbuild.

-- 
Best Regards
Masahiro Yamada
