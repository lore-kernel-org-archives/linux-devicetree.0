From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: RE: [PATCH] arc: dts: use 'atmel' as manufacturer for at24 in
 axs10x_mb
Date: Mon, 5 Feb 2018 18:38:51 +0000
Message-ID: <4881796E12491D4BB15146FE0209CE646802914A@DE02WEMBXB.internal.synopsys.com>
References: <20180124213955.4975-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180124213955.4975-1-brgl@bgdev.pl>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Vineet Gupta <Vineet.Gupta1@synopsys.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Bartosz, all,

> -----Original Message-----
> From: Bartosz Golaszewski [mailto:brgl@bgdev.pl]
> Sent: Thursday, January 25, 2018 12:40 AM
> To: Rob Herring <robh+dt@kernel.org>; Mark Rutland <mark.rutland@arm.com>; Russell King <linux@armlinux.org.uk>; Alexey
> Brodkin <Alexey.Brodkin@synopsys.com>; Vineet Gupta <Vineet.Gupta1@synopsys.com>
> Cc: devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-snps-arc@lists.infradead.org; Bartosz Golaszewski
> <brgl@bgdev.pl>
> Subject: [PATCH] arc: dts: use 'atmel' as manufacturer for at24 in axs10x_mb
> 
> Using compatible strings without the <manufacturer> part for at24 is
> now deprecated. Use a correct 'atmel,<model>' value.

Even though I agree with this change itself I think it may worth
mentioning an explicit commit that deprecated manufacturer'less parts.

-Alexey
