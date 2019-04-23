Return-Path: <SRS0=xtDS=SZ=gmail.com=dmitry.torokhov@kernel.org>
Date: Tue, 23 Apr 2019 03:17:05 +0000
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH 2/2] input: touch: eeti: read hardware state once after
 wakeup
Message-ID: <20190423031705.gllzrreptvphdrc3@penguin>
References: <20190422083540.8380-1-daniel@zonque.org>
 <20190422083540.8380-2-daniel@zonque.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190422083540.8380-2-daniel@zonque.org>
To: Daniel Mack <daniel@zonque.org>
Cc: robh+dt@kernel.org, linux-input@vger.kernel.org, devicetree@vger.kernel.org, Sven Neumann <Sven.Neumann@teufel.de>
List-ID: <devicetree@vger.kernel.org>

Hi Daniel,

On Mon, Apr 22, 2019 at 10:35:40AM +0200, Daniel Mack wrote:
> For systems in which the touch IRQ is acting as wakeup source, the interrupt
> controller might not latch the GPIO IRQ during sleep. In such cases, the
> interrupt will never occur again after resume, hence the touch screen
> appears dead.
> 
> To fix this, call into eeti_ts_read() once to read the hardware status and
> to arm the IRQ again.

Can you instead make the interrupt level-triggered?

Thanks.

-- 
Dmitry
