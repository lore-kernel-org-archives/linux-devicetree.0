From: Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH 1/2] Documentation: dt: mailbox: Add TI Message Manager
Date: Fri, 26 Feb 2016 16:30:01 -0600
Message-ID: <CAGo_u6oUOFSpKuVyp8yKW34DUcUEnF6BGD-=NZDLMXD6BH1uEQ@mail.gmail.com>
References: <1454690044-2560-1-git-send-email-nm@ti.com>
	<1454690044-2560-2-git-send-email-nm@ti.com>
	<CABb+yY3kGq_R49Xx4fK3UMqtuFiuv-pXJWvjkEFLPL9xRu5T4A@mail.gmail.com>
	<56B9DC30.5040806@ti.com>
	<CABb+yY24XzsWaSGLMCE4_nvgWx0OhhQmcaP41g06FxdjQYFchg@mail.gmail.com>
	<CAGo_u6qGaQj9Qvjwrm7cD=cr2UjLN+62tcquXYPsQrRjYD=UCw@mail.gmail.com>
	<20160209181031.GA23603@kahuna>
	<CABb+yY3nSZCbF7G1LP_7cGkKJpdJ1fko_6d3UkrF_vNpHk4uBg@mail.gmail.com>
	<56BC1617.3090204@ti.com>
	<CABb+yY0i2kfBg0qBOdMQxZ0M4bDBh5gHX5q-wCP2b+8OE7NyzQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CABb+yY0i2kfBg0qBOdMQxZ0M4bDBh5gHX5q-wCP2b+8OE7NyzQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Devicetree List <devicetree@vger.kernel.org>, Franklin S Cooper Jr <fcooper@ti.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Santosh Shilimkar <ssantosh@kernel.org>
List-Id: devicetree@vger.kernel.org

Jassi,

On Fri, Feb 26, 2016 at 5:59 AM, Jassi Brar <jassisinghbrar@gmail.com> wrote:
> On Thu, Feb 11, 2016 at 10:33 AM, Nishanth Menon <nm@ti.com> wrote:
[...]
>> I can make it compatible for today's SoC, but based on what i explained,
>> how about just "rx_<qid>" for the interrupt names?
>> interrupt-names = "rx_005", "rx_057" (I kinda feel using "irq" for
>> interrupt-names is actually redundant information)?
>>
> Feel free to name the interrupts "rx_" instead of "irq_" ... assuming
> the interrupts correspond to only reception of data.
>

Thanks for your reviews. I have now posted a v2: hopefully these meet the needs.

https://patchwork.kernel.org/patch/8442641/
https://patchwork.kernel.org/patch/8442671/


-- 
---
Regards,
Nishanth Menon
