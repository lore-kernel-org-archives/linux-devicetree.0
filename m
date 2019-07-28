From: Zhou Yanjie <zhouyanjie@zoho.com>
Subject: Add Ingenic JZ4760 and X1000 and X1500 irqchip support v4.
Date: Mon, 29 Jul 2019 01:34:29 +0800
Message-ID: <1564335273-22931-1-git-send-email-zhouyanjie@zoho.com>
References: <1548517123-60058-1-git-send-email-zhouyanjie@zoho.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548517123-60058-1-git-send-email-zhouyanjie@zoho.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, paul.burton@mips.com, tglx@linutronix.de, mark.rutland@arm.com, jason@lakedaemon.net, marc.zyngier@arm.com
List-Id: devicetree@vger.kernel.org

v1->v2: Replace "__fls(pending)" with "bit" in function "generic_handle_irq".
v2->v3: Add support for probing irq-ingenic driver on JZ4760 and X1500 Soc.
v3->v4: Combined with patches 5 and 7, combined with patches 4, 6 and 8.
