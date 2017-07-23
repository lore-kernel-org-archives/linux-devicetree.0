From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 4/7] ARM: meson: Add SMP bringup code for Meson8 and Meson8b
Date: Sun, 23 Jul 2017 09:33:40 -0700
Message-ID: <7B0CB90C-DFC3-4ECD-B342-A26BEEE52852@gmail.com>
References: <20170722191946.22938-1-martin.blumenstingl@googlemail.com> <20170722191946.22938-5-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170722191946.22938-5-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On July 22, 2017 12:19:43 PM PDT, Martin Blumenstingl <martin=2Eblumensting=
l@googlemail=2Ecom> wrote:
>This adds the necessary SMP-operations and startup code to use the
>additional cores on the Amlogic Meson8/Meson8m2 (both are using the
>same
>sequence) and Meson8b (using a slightly difference sequence) SoCs=2E
>
>Signed-off-by: Carlo Caione <carlo@endlessm=2Ecom>
>[add Meson8/Meson8m2 support and allow taking CPU cores offline as
>well]
>Signed-off-by: Martin Blumenstingl <martin=2Eblumenstingl@googlemail=2Eco=
m>
>---

>+static void meson_smp_begin_secondary_boot(unsigned int cpu)
>+{
>+	/*
>+	 * Set the entry point before powering on the CPU through the SCU=2E
>This
>+	 * is needed if the CPU is in "warm" state (=3D after rebooting the
>+	 * system without power-cycling, or when taking the CPU offline and
>+	 * then taking it online again=2E
>+	 */
>+	writel(virt_to_phys(secondary_startup),
>+	       sram_base + MESON_SMP_SRAM_CPU_CTRL_ADDR_REG(cpu));

Please use __pa_symbol() since secondary startup is a kernel image symbol=
=2E

>+
>+	/*
>+	 * SCU Power on CPU (needs to be done before starting the CPU,
>+	 * otherwise the secondary CPU will not start)=2E
>+	 */
>+	scu_cpu_power_enable(scu_base, cpu);
>+}
>+
>+static int meson_smp_finalize_secondary_boot(unsigned int cpu)
>+{
>+	unsigned long timeout;
>+
>+	timeout =3D jiffies + (10 * HZ);
>+	while (readl(sram_base + MESON_SMP_SRAM_CPU_CTRL_ADDR_REG(cpu))) {
>+		if (!time_before(jiffies, timeout)) {
>+			pr_err("Timeout while waiting for CPU%d status\n",
>+			       cpu);
>+			return -ETIMEDOUT;
>+		}
>+	}
>+
>+	writel(virt_to_phys(secondary_startup),
>+	       sram_base + MESON_SMP_SRAM_CPU_CTRL_ADDR_REG(cpu));

Same here=2E

Thanks!

--=20
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
