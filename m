From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v6 1/3] clocksource: timer-keystone: introduce clocksource
 driver for Keystone
Date: Tue, 11 Feb 2014 13:58:01 +0100
Message-ID: <52FA1E59.1000307@linaro.org>
References: <1392027058-11680-1-git-send-email-ivan.khoronzhuk@ti.com> <1392027058-11680-2-git-send-email-ivan.khoronzhuk@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1392027058-11680-2-git-send-email-ivan.khoronzhuk@ti.com>
Sender: linux-doc-owner@vger.kernel.org
To: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>, santosh.shilimkar@ti.com, rob@landley.net, linux@arm.linux.org.uk, galak@codeaurora.org
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, tglx@linutronix.de, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, grygorii.strashko@ti.com, joshc@codeaurora.org
List-Id: devicetree@vger.kernel.org

On 02/10/2014 11:10 AM, Ivan Khoronzhuk wrote:
> Add broadcast clock-event device for the Keystone arch.
>
> The timer can be configured as a general-purpose 64-bit timer,
> dual general-purpose 32-bit timers. When configured as dual 32-bit
> timers, each half can operate in conjunction (chain mode) or
> independently (unchained mode) of each other.
>
> Reviewed-by: Stephen Boyd <sboyd@codeaurora.org>
> Acked-by: Santosh shilimkar <santosh.shilimkar@ti.com>
> Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
> ---

Applied to my tree for 3.15

--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

