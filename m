From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH v2 1/5] ARM: berlin: add SMP support
Date: Wed, 25 Jun 2014 17:00:02 +0200
Message-ID: <53AAE3F2.9060809@gmail.com>
References: <1401897826-11711-1-git-send-email-antoine.tenart@free-electrons.com> <1401897826-11711-2-git-send-email-antoine.tenart@free-electrons.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1401897826-11711-2-git-send-email-antoine.tenart@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?QW50b2luZSBUw6luYXJ0?= <antoine.tenart@free-electrons.com>
Cc: alexandre.belloni@free-electrons.com, thomas.petazzoni@free-electrons.com, zmxu@marvell.com, jszhang@marvell.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 06/04/2014 06:03 PM, Antoine T=C3=A9nart wrote:
> Adds SMP support for Berlin SoCs. Secondary CPUs are reset, then
> execute the instruction we put in the reset exception register, setti=
ng
> the pc at the address contained in the software reset address registe=
r,
> which is the physical address of the Berlin secondary startup.
>
> This implementation avoid using the pen lock mechanism.
>
> Signed-off-by: Antoine T=C3=A9nart <antoine.tenart@free-electrons.com=
>

Applied to berlin/soc with Andrew's Reviewed-by.

Thanks!
