From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH] ARM: dts: pxa: change serial node names
Date: Thu, 30 Aug 2018 21:52:23 +0200
Message-ID: <87k1o77hu0.fsf@belgarion.home>
References: <20180715202153.7233-1-robert.jarzmik@free.fr>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180715202153.7233-1-robert.jarzmik@free.fr> (Robert Jarzmik's
        message of "Sun, 15 Jul 2018 22:21:53 +0200")
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Mack <daniel@zonque.org>
Cc: Haojian Zhuang <haojian.zhuang@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Robert Jarzmik <robert.jarzmik@free.fr> writes:

> Change from xxuart to serial to normalize the devicetree pxa serial
> support.
>
> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
> ---
>  arch/arm/boot/dts/pxa2xx.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
Queued to pxa/dt.

--
Robert
