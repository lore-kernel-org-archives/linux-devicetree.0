Return-Path: <SRS0=ViTF=NK=gmail.com=arndbergmann@kernel.org>
MIME-Version: 1.0
Sender: arndbergmann@gmail.com
In-Reply-To: <caa1cb6121ed7f1e0e4617811561267cb97dc2e5.1540900718.git.ren_guo@c-sky.com>
References: <d7007cad85bb06e0f4e081bc4daf6f0f79c81861.1540900718.git.ren_guo@c-sky.com>
 <caa1cb6121ed7f1e0e4617811561267cb97dc2e5.1540900718.git.ren_guo@c-sky.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 30 Oct 2018 14:35:54 +0100
Message-ID: <CAK8P3a2LK69GiAU_yyUUZ8m4Bp-V7djEmBX5hvoj=4-3OYVohw@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] csky: use common dtb build rules
Content-Type: text/plain; charset="UTF-8"
To: Guo Ren <ren_guo@c-sky.com>
Cc: robh@kernel.org, linux-arch@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 10/30/18, Guo Ren <ren_guo@c-sky.com> wrote:
> Remove the Kbuild rules in arch/csky and use common dtb build rules.
>
> This modification is based on:
>
> commit 37c8a5fafa3b ("kbuild: consolidate Devicetree dtb build rules")
>
> Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>

Acked-by:  Arnd Bergmann <arnd@arndb.de>
