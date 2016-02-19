From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v7 3/3] arm64: dts: Update X-Gene standby GPIO controller
 DTS entries
Date: Fri, 19 Feb 2016 10:14:01 +0100
Message-ID: <CACRpkdav6UXn41UnWvWR4zjYN=QtkNJknihr+YnHu3rXbkPBBw@mail.gmail.com>
References: <1455714909-3027-1-git-send-email-qnguyen@apm.com>
	<1455714909-3027-4-git-send-email-qnguyen@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1455714909-3027-4-git-send-email-qnguyen@apm.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Quan Nguyen <qnguyen@apm.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Y Vo <yvo@apm.com>, Phong Vo <pvo@apm.com>, Loc Ho <lho@apm.com>, Feng Kan <fkan@apm.com>, Duc Dang <dhdang@apm.com>, Iyappan Subramanian <isubramanian@apm.com>, patches <patches@apm.com>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 17, 2016 at 2:15 PM, Quan Nguyen <qnguyen@apm.com> wrote:

> Update APM X-Gene standby GPIO controller DTS entries to enable it
> as interrupt controller.
>
> Signed-off-by: Y Vo <yvo@apm.com>
> Signed-off-by: Quan Nguyen <qnguyen@apm.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Please funnel this patch through the ARM SoC tree with all other
DTS files.

Yours,
Linus Walleij
