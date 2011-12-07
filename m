From: Alan Cox <alan-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org>
Subject: Re: [PATCH] RFC, watchdog: add generic wdt driver API
Date: Wed, 7 Dec 2011 17:23:11 +0000
Message-ID: <20111207172311.37b3358a@lxorguk.ukuu.org.uk>
References: <1322992423-21683-1-git-send-email-hs@denx.de>
 <20111204125928.GB5788@pengutronix.de>
 <20111204170810.8370625EA22@gemini.denx.de>
 <20111205122649.6fc6aed2@lxorguk.ukuu.org.uk>
 <4EDF099E.80207@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4EDF099E.80207-ynQEQJNshbs@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: hs-ynQEQJNshbs@public.gmane.org
Cc: linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Detlev Zundel <dzu-ynQEQJNshbs@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stefan Roese <sr-ynQEQJNshbs@public.gmane.org>, Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

>   A chain can request to kill the registering process if the interval
>   elapses.  In this case a restarted process can register with the
>   driver giving the same identifier and reset the chain.  This is the
>   main reason why there is no association between chains and processes
>   or open device files.

How do genuinely unused chains get automatically cleaned up

>   Possible chain actions:
>   - ACTION_SIGNAL: sends a configurable signal to the process
>   - ACTION_KILL: sends the SIGKILL signal to the process

These two are the same (detail)

> starting point to integrate it? As this "chain API" would controlled
> through ioctl() calls maybe drivers/watchdog/watchdog_dev.c would be
> a good place... or a drivers/watchdog/watchdog_chain.c which gets the
> ioctl calls, watchdog_dev.c couldn't parse ...

It doesn't actually seem to have any connection at all with the kernel
watchdog drivers. I don't mean that as a criticism but what you are
describing seems to be some kind of software timer groups.

If you wanted to link it to a real watchdog presumably you'd just put the
watchdog pinging user space process in a group and set it to get killed
if the group triggered.

I'm not sure I understand why it can't be done cleanly in userspace
either.

If you have a daemon accepting unix domain connections then it can get
the pid of the other end and can kill it, or monitor incoming packets and
requests from it. If that process is also the one pinging the hardware
watchdog it can provide reboot protection against its own crashing. It
can also do much more flexible and interesting policy things like only
pinging the watchdog each time all the clients check in.

Alan
