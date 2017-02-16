From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 4/5] sprd_serial: switch comptible string to sc-uart
Date: Thu, 16 Feb 2017 14:31:38 +0100
Message-ID: <1761969.45NG6Q1Iyc@wuerfel>
References: <1487063952-7113-1-git-send-email-chunyan.zhang@spreadtrum.com>
 <1487063952-7113-5-git-send-email-chunyan.zhang@spreadtrum.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1487063952-7113-5-git-send-email-chunyan.zhang@spreadtrum.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, orson.zhai@spreadtrum.com, gregkh@linuxfoundation.org, will.deacon@arm.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, catalin.marinas@arm.com, Chunyan Zhang <chunyan.zhang@spreadtrum.com>
List-Id: devicetree@vger.kernel.org

On Tuesday, February 14, 2017 5:19:11 PM CET Chunyan Zhang wrote:
>  static const struct of_device_id serial_ids[] = {
> -       {.compatible = "sprd,sc9836-uart",},
> +       {.compatible = "sprd,sc-uart",},
>         {}

We really need this to be specific, in case Spreadtrum ever
makes a slightly different UART that is not 100% compatible
with this one. Also, you can't remove the string you already have,
only add to it.

Normally when you have a new chip that is compatible with one
we already have a driver for, we mark the device as compatible
with the old one and avoid having to change the driver, e.g.

	compatible = "sprd,sc9995-uart", "sprd,sc9836-uart";

This way, the driver could later be changed to handle anything
that is compatible with sc9995 differently from sc9836, but
by default it would match the original string.

	Arnd
