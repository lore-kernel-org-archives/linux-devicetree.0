From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH V2 1/4] cpufreq: add arm soc generic cpufreq driver
Date: Fri, 16 Dec 2011 12:26:03 +0100
Message-ID: <201112161226.04092.heiko@sntech.de>
References: <1324031462-24961-1-git-send-email-richard.zhao@linaro.org> <1324031462-24961-2-git-send-email-richard.zhao@linaro.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1324031462-24961-2-git-send-email-richard.zhao@linaro.org>
Sender: cpufreq-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Richard Zhao <richard.zhao@linaro.org>, cpufreq@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux@arm.linux.org.uk, mark.langsdorf@calxeda.com, patches@linaro.org, eric.miao@linaro.org, kernel@pengutronix.de, davej@redhat.com, linaro-dev@lists.linaro.org, shawn.guo@linaro.org
List-Id: devicetree@vger.kernel.org

Am Freitag, 16. Dezember 2011, 11:30:59 schrieb Richard Zhao:
> It support single core and multi-core ARM SoCs. But it assume
> all cores share the same frequency and voltage.
> 
> Signed-off-by: Richard Zhao <richard.zhao@linaro.org>
> ---
>  drivers/cpufreq/Kconfig.arm   |    8 ++
>  drivers/cpufreq/Makefile      |    1 +
>  drivers/cpufreq/arm-cpufreq.c |  269
> +++++++++++++++++++++++++++++++++++++++++ 3 files changed, 278
> insertions(+), 0 deletions(-)
>  create mode 100644 drivers/cpufreq/arm-cpufreq.c

looks quite cool, but should also provide a description of the devicetree 
bindings (i.e. like the rest in Documentation/devicetree/bindings/...) for 
future reference.

Heiko

