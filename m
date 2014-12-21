From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH] scripts: dtc: libfdt: fdt_rw.c: Remove some unused functions
Date: Sun, 21 Dec 2014 17:22:02 -0600
Message-ID: <CAL_JsqJnR5b-xoxxVV1R6PrCSz-uziKyUOWR8QoyTizmBEUGyg@mail.gmail.com>
References: <1419183632-10349-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1419183632-10349-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
Sender: linux-kernel-owner@vger.kernel.org
To: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sun, Dec 21, 2014 at 11:40 AM, Rickard Strandqvist
<rickard_strandqvist@spectrumdigital.se> wrote:
> Removes some functions that are not used anywhere:
> fdt_delprop() fdt_add_mem_rsv()
>
> This was partially found by using a static code analysis program called cppcheck.
>
> Signed-off-by: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
> ---
>  scripts/dtc/libfdt/fdt_rw.c |   32 -----------------------------
>  scripts/dtc/libfdt/libfdt.h |   48 -------------------------------------------
>  2 files changed, 80 deletions(-)

These sources are just imported unmodified from libfdt, so we don't
want to be changing them in the kernel. Also, I think these functions
could be needed at some point. Getting -ffunction-sections to work
with the kernel would be the right way to solve this IMHO.

Rob
