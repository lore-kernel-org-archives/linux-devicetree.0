From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/2] ARM: dts: Change dw-apb-timer-osc and dw-apb-timer-sp
 to just dw-apb-timer
Date: Tue, 18 Jun 2013 15:11:23 +0200
Message-ID: <201306181511.24004.arnd@arndb.de>
References: <1371514129-22801-1-git-send-email-dinguyen@altera.com>
 <1371514129-22801-2-git-send-email-dinguyen@altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1371514129-22801-2-git-send-email-dinguyen@altera.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: dinguyen@altera.com
Cc: dinh.linux@gmail.com, Pavel Machek <pavel@denx.de>, devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>, Olof Johansson <olof@lixom.net>, John Stultz <john.stultz@linaro.org>, Grant Likely <grant.likely@linaro.org>, Jamie Iles <jamie@jamieiles.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tuesday 18 June 2013, dinguyen@altera.com wrote:
> @@ -476,27 +476,31 @@
>                 };
>  
>                 timer0: timer0@ffc08000 {
> -                       compatible = "snps,dw-apb-timer-sp";
> +                       compatible = "snps,dw-apb-timer";
>                         interrupts = <0 167 4>;
>                         reg = <0xffc08000 0x1000>;
> +                       clocks = <&osc>;
>                 };
>  
>                 timer1: timer1@ffc09000 {
> -                       compatible = "snps,dw-apb-timer-sp";
> +                       compatible = "snps,dw-apb-timer";
>                         interrupts = <0 168 4>;
>                         reg = <0xffc09000 0x1000>;
> +                       clocks = <&osc>;
>                 };

I think it would make sense to fix the device name as well, they should
all be named "timer", not "timer0", so I would add


-                 timer0: timer0@ffc08000 {
+                 timer0: timer@ffc08000 {

for all the timers in the dts file here.

	Arnd
