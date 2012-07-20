From: Alexey Charkov <alchark@gmail.com>
Subject: Re: [PATCH] ARM: vt8500: Minor updates to platform drivers for
 devicetree support
Date: Fri, 20 Jul 2012 17:24:37 +0200
Message-ID: <CABjd4YwmtyiSU9x=jTLCjR7S67qeDQjrCRbXJydX9gGsj-ctMA@mail.gmail.com>
References: <1342795183-7942-1-git-send-email-linux@prisktech.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1342795183-7942-1-git-send-email-linux@prisktech.co.nz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: vt8500-wm8505-linux-kernel@googlegroups.com
Cc: devicetree-discuss <devicetree-discuss@lists.ozlabs.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

2012/7/20 Tony Prisk <linux@prisktech.co.nz>:
> Updated the vt8500-rtc and vt8500-uart platform drivers for
> devicetree support.

Shouldn't these go as separate patches? Note also that you haven't
CC'd the relevant mailing lists on this one.

> diff --git a/Documentation/devicetree/bindings/rtc/vt8500-rtc.txt b/Documentation/devicetree/bindings/rtc/vt8500-rtc.txt
> new file mode 100644
> index 0000000..8cf6ce1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/vt8500-rtc.txt
> @@ -0,0 +1,14 @@
> +* SPEAr RTC

Looks like a copy-paste leftover.

Thanks,
Alexey
