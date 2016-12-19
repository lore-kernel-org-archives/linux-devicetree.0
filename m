From: Quentin Schulz <quentin.schulz@free-electrons.com>
Subject: Re: [PATCH v2] ARM: dts: sun8i: add opp-v2 table for A33
Date: Mon, 19 Dec 2016 15:18:03 +0100
Message-ID: <8af4327f-b779-9d97-347f-bfe4b8303a60@free-electrons.com>
References: <20161215182754.33921-1-icenowy@aosc.xyz>
 <20161219084652.kiqdkiewu5tujlyd@lukather>
 <CAGb2v65YWntCrFHtSbxhtTWkt+UwkW3xoY-ae26MpH+-ULLXSQ@mail.gmail.com>
 <11975791482156406@web2g.yandex.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <11975791482156406@web2g.yandex.ru>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Icenowy Zheng <icenowy@aosc.xyz>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, linux-sunxi <linux-sunxi@googlegroups.com>, linux-clk <linux-clk@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 19/12/2016 15:06, Icenowy Zheng wrote:
> 
> After proper testing of A23 ccu, the operating points can also apply to A23.
> (According to A23 devices' fex)
> 

I disagree. I've looked into using the same operating points for A23 and
A33 for CPUfreq and I came to the conclusion that not all A23-based
boards share the same operating points. You can find the fex files for
the different boards here:
https://github.com/linux-sunxi/sunxi-boards/tree/master/sys_config/a23

After gathering all supported frequencies/voltages for each A23-based
boards, I found that only the following frequencies and voltages are
supported by all A23-based boards:

 - 1008 MHz, 1220 mV
 - 816 MHz, 1120 mV
 - 600 MHz, 1040 mV

Quentin

-- 
Quentin Schulz, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
