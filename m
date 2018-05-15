From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v1 1/1] clk: npcm750: fix base address and of_clk_get_by_name
 error handling. Also update error messages to be more informative
Date: Tue, 15 May 2018 15:15:11 -0700
Message-ID: <152642251190.237094.2880285895652897578@swboyd.mtv.corp.google.com>
References: <1525159407-31708-1-git-send-email-tali.perry1@gmail.com>
 <1525159407-31708-2-git-send-email-tali.perry1@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1525159407-31708-2-git-send-email-tali.perry1@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: avifishman70@gmail.com, brendanhiggins@google.com, linux@armlinux.org.uk, mark.rutland@arm.com, raltherr@google.com, robh+dt@kernel.org, tmaimon77@gmail.com, weiyongjunl@huawei.com
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>, Wei Yongjun <weiyongjun1@huawei.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Quoting Tali Perry (2018-05-01 00:23:27)
> =

> Nuvoton NPCM7XX Clock Controller
> fix base address and of_clk_get_by_name error handling.
>     Also update error messages to be more informative.
>     =

>     In case clk_base allocation is erronoeous the return value is null.
>     Also fix handling of of_clk_get_by_name returns an error. =

>     Print a better error message pointing to the dt-binding documention.
> =

> =

> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> =

> Tali Perry (2):
>  =


This doesn't apply to clk-next so I'm not sure what's going on. Please
resend if something needs to be fixed.
