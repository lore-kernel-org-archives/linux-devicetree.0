From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: [PATCH v3] ARM: dts: bcm283x: Fix console path on RPi3
Date: Fri, 6 Oct 2017 20:13:40 +0200 (CEST)
Message-ID: <1740609206.57031.1507313620912@email.1und1.de>
References: <1507297972-10512-1-git-send-email-loic.poulain@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1507297972-10512-1-git-send-email-loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org, Loic Poulain <loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Loic,

> Loic Poulain <loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> hat am 6. Oktober 2017 um 15:52 geschrieben:
> 
> 
> Contrary to other RPi devices, RPi3 uses uart0 to communicate with
> the BCM43438 bluetooth controller. uart1 is then used for the console.
> Today, the console configuration is inherited from the bcm283x dtsi
> (bootargs) which is not the correct one for the RPi3. This leads to
> routing issue and confuses the Bluetooth controller with unexpected
> data.
> 
> This patch introduces chosen/stdout path to configure console to uart0
> on bcm283x family and overwrite it to uart1 in the RPi3 dts.
> 
> Create serial0/1 aliases referring to uart0 and uart1 paths.
> Remove unneeded earlyprintk.
> 
> Fixes: 4188ea2aeb6d ("ARM: bcm283x: Define UART pinmuxing on board level")
> Signed-off-by: Loic Poulain <loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

after changing serial0 to serial1 in my cmdline.txt, i can see the boot messages on my RPi Zero W.

Tested-by: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
