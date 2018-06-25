From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: Add system timer driver for Mediatek SoCs
Date: Mon, 25 Jun 2018 09:34:08 +0200
Message-ID: <dd36b094-b11c-e6ef-a0fc-b039785e74f2@linaro.org>
References: <1529910601-15005-1-git-send-email-stanley.chu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1529910601-15005-1-git-send-email-stanley.chu@mediatek.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stanley Chu <stanley.chu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, wsd_upstream@mediatek.com
List-Id: devicetree@vger.kernel.org

On 25/06/2018 09:09, Stanley Chu wrote:
> This patch adds a new driver for system timer on the Mediatek SoCs.

Please elaborate why we need yet another timer.

Is this timer present on all Mediatek platform ? Does it always co-exist
with the existing one ?




-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
