From: Chris Spencer <spencercw@gmail.com>
Subject: Re: [PATCH] arm64: dts: imx8mq: Fix boot from eMMC
Date: Fri, 25 Jan 2019 08:37:52 +0000
Message-ID: <CAGUNXRSBMnvgtWgUk1b83=x04T81Bw0h0Q5GahCR7htej8eoiw@mail.gmail.com>
References: <20190122165546.11712-1-ccaione@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190122165546.11712-1-ccaione@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Carlo Caione <ccaione@baylibre.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, s.hauer@pengutronix.de, abailon@baylibre.com, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, fabio.estevam@nxp.com, shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org, l.stach@pengutronix.de
List-Id: devicetree@vger.kernel.org

On Tue, 22 Jan 2019 at 16:57, Carlo Caione <ccaione@baylibre.com> wrote:
> The boot from eMMC is currently broken on the NXP i.MX8MQ EVK board.
> When trying to boot from eMMC it fails with:
>
> ...
> [    1.271938] mmc1: Tuning failed, falling back to fixed sampling clock
> [    1.287429] print_req_error: I/O error, dev mmcblk1, sector 1 flags 0
> [    1.306833] mmc1: Tuning failed, falling back to fixed sampling clock
> [    1.322325] print_req_error: I/O error, dev mmcblk1, sector 2 flags 0
> [    1.329559] Buffer I/O error on dev mmcblk1, logical block 0, async page read
> [    1.336714]  mmcblk1: unable to read partition table
> ...
>
> The problem is the result of a partial misconfiguration of the pins and
> the missing assigned clock rate.
>
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>

Tested on my i.MX8MQ-EVK. I'm still booting from the SD card, but I
can confirm it resolves the indicated I/O errors during boot and I can
now see and mount the partitions on the eMMC.

Tested-by: Chris Spencer <christopher.spencer@sea.co.uk>
