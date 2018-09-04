From: Tero Kristo <t-kristo@ti.com>
Subject: [RESEND PATCHv2 0/2] ARM: dts: TI: add support for TI SoC overlays
Date: Tue, 4 Sep 2018 11:27:29 +0300
Message-ID: <1536049651-10206-1-git-send-email-t-kristo@ti.com>
References: <1535722107-13767-1-git-send-email-t-kristo@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1535722107-13767-1-git-send-email-t-kristo@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: catalin.marinas@arm.com, will.deacon@arm.com, linux@armlinux.org.uk, robh+dt@kernel.org, frowand.list@gmail.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, tony@atomide.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi,

This series is the final piece of the code to get build support for
Texas Instruments SoC DT overlays in place. Basically we just modify
the makefiles to add DTC_FLAGS for symbols, which are needed to actually
apply the overlays properly. This series depends on [1].

v2 of the series is just a split of the v1 which had the whole support
included in one series.

Resending as I missed Frank from delivery of the initial v2.

-Tero

[1] https://marc.info/?l=linux-arm-kernel&m=153604844620162&w=2

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
