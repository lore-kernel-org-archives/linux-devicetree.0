From: christo.radev@gmail.com
Subject: Re: [PATCH 1/1] ARM: dts: sunxi: Add a olinuxino-lime2-emmc
Date: Tue, 3 May 2016 00:12:06 -0700 (PDT)
Message-ID: <f3da30a6-9ac0-4d5e-8611-ebb80cb3589e@googlegroups.com>
References: <1461827998-12192-1-git-send-email-oliver@schinagl.nl>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="----=_Part_1164_1300126375.1462259526952"
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1461827998-12192-1-git-send-email-oliver@schinagl.nl>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-sunxi <linux-sunxi@googlegroups.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux@arm.linux.org.uk, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, dev@linux-sunxi.org, tsvetan@olimex.com, linux-kernel@vger.kernel.org, hdegoede@redhat.com, wens@csie.org, robh+dt@kernel.org, galak@codeaurora.org, maxime.ripard@free-electrons.com, oliver@schinagl.nl, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

------=_Part_1164_1300126375.1462259526952
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi to All,

I have already solved and tested this issue on Armbian build.
Find patches for both legacy (3.4.111) and mainline (4.5.2) kernels on:
http://forum.armbian.com/index.php/topic/853-armbian-customization/page-2#entry7494
There it is also described how to do eMMC bootable and much more.

About the board - Olimex already sold all 3 kinds after migration to their HW rev. E. One have to specify Lime2-eMMC as A20-Olinuxino-Lime2-eMMC instead of their old 2 options A20-Olinuxino-Lime2(-4GB).

Regards
Chris

------=_Part_1164_1300126375.1462259526952
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

------=_Part_1164_1300126375.1462259526952--
