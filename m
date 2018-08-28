From: Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 0/7] ARM32/64: DT overlay build support
Date: Tue, 28 Aug 2018 15:32:05 +0300
Message-ID: <1535459532-17211-1-git-send-email-t-kristo@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: catalin.marinas@arm.com, will.deacon@arm.com, linux@armlinux.org.uk, frowand.list@gmail.com, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi,

This series introduces devicetree overlay building support for ARM
platforms. The .dtbo target is introduced globally, then makefile
changes for both arm32/64 for supporting the .dtbo target, changes
to support sub-dir makefile flags, and finally adding the DTC flags
override for TI platforms, as that is where we want to introduce
the DT overlay support initially.

The ARM makefile changes for supporting DTS sub-makefiles don't look
too clean, but that was the only way I could figure out how to
get it done.

-Tero

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
