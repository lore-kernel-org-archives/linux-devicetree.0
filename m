From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 00/16] Initial support for Marvell MMP3 SoC
Date: Thu, 5 Sep 2019 12:24:04 +0200
Message-ID: <CAK8P3a0Jq93AVYau_7odZz73ZL22buVCveiHoC6oGf=Oy6KEKQ@mail.gmail.com>
References: <20190830220743.439670-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190830220743.439670-1-lkundrak@v3.sk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lubomir Rintel <lkundrak@v3.sk>
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, "Cc : Rob Herring" <robh+dt@kernel.org>, "To : Olof Johansson" <olof@lixom.net>, Thomas Gleixner <tglx@linutronix.de>, Kishon Vijay Abraham I <kishon@ti.com>, linux-clk <linux-clk@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Sat, Aug 31, 2019 at 12:08 AM Lubomir Rintel <lkundrak@v3.sk> wrote:
>
> this is the third spin of a patch set that adds support for the Marvell
> MMP3 processor, that I'd eventually love to see land in the Arm SoC
> tree. MMP3 is used in OLPC XO-4 laptops, Panasonic Toughpad FZ-A1 tablet
> and Dell Wyse 3020/Tx0D thin clients.
>
> Compared to v2, there's a handful of fixes in response to reviews. Four
> irqchip patches have been removed because they've been applied to the
> irqchip-next tree. Details in individual patches.

I just looked at the series, looks great overall, but the timing means
this is going to be 5.5 material by now. Please send a pull request
to soc@kernel.org cc:lakml after -rc1 is out.

I replied with a couple of comments for details I noticed.

       Arnd
