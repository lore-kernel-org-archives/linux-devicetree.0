From: Zhou Yanjie <zhouyanjie@zoho.com>
Subject: Add Ingenic X1000 irqchip support v2.
Date: Sun, 27 Jan 2019 23:50:28 +0800
Message-ID: <1548604232-19159-1-git-send-email-zhouyanjie@zoho.com>
References: <1548517123-60058-2-git-send-email-zhouyanjie@zoho.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548517123-60058-2-git-send-email-zhouyanjie@zoho.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, paul.burton@mips.com, mark.rutland@arm.com, marc.zyngier@arm.com, jason@lakedaemon.net, tglx@linutronix.de, syq@debian.org, jiaxun.yang@flygoat.com, 772753199@qq.com
List-Id: devicetree@vger.kernel.org

vi->v2: Replace "__fls(pending)" with "bit" in function "generic_handle_irq".
