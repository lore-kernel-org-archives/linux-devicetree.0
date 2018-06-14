From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] arm64: dts: hikey960: Define wl1837 power capabilities
Date: Thu, 14 Jun 2018 09:20:18 +0300
Message-ID: <874li5c2jh.fsf@purkki.adurom.net>
References: <20180613180321.16745-1-ryan@edited.us>
 <CALAqxLWuUJYfXszaO01KODbom8WykKQKm0X3fzPTwSRK+G3zqw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CALAqxLWuUJYfXszaO01KODbom8WykKQKm0X3fzPTwSRK+G3zqw@mail.gmail.com>
 (John Stultz's message of "Wed, 13 Jun 2018 12:36:40 -0700")
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: John Stultz <john.stultz@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Ryan Grachek <ryan@edited.us>, Tony Lindgren <tony@atomide.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, lkml <linux-kernel@vger.kernel.org>, Wei Xu <xuwei5@hisilicon.com>, Eyal Reizer <eyalr@ti.com>, Rob Herring <robh+dt@kernel.org>, linux-wireless@vger.kernel.org, Valentin Schneider <valentin.schneider@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

John Stultz <john.stultz@linaro.org> writes:

> On Wed, Jun 13, 2018 at 11:03 AM, Ryan Grachek <ryan@edited.us> wrote:
>> These properties are required for compatibility with runtime PM.
>> Without these properties, MMC host controller will not be aware
>> of power capabilities. When the wlcore driver attempts to power
>> on the device, it will erroneously fail with -EACCES. This fixes
>> a regression found here: https://lkml.org/lkml/2018/6/12/930
>>
>> Signed-off-by: Ryan Grachek <ryan@edited.us>
>
> Fixes: 60f36637bbbd ("wlcore: sdio: allow pm to handle sdio power")
> Tested-by: John Stultz <john.stultz@linaro.org>
> Acked-by: John Stultz <john.stultz@linaro.org>
>
> Wei Xu: This also fixes a functional regression with wifi on the
> HiKey960 board that was introduced in 4.18-rc with commit 60f36637bbbd
> ("wlcore: sdio: allow pm to handle sdio power").
>
> Could you please be sure to queue this for the 4.18-rc too?

CCing wireless folks as well.

-- 
Kalle Valo
