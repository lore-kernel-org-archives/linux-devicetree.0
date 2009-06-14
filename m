From: Wolfgang Grandegger <wg-5Yr1BZd7O62+XT7JhA+gdA@public.gmane.org>
Subject: Re: [PATCH 2/2] uio: add an of_genirq driver
Date: Sun, 14 Jun 2009 21:36:53 +0200
Message-ID: <4A355155.4020500@grandegger.com>
References: <1244765062-14144-1-git-send-email-w.sang@pengutronix.de>	<1244765062-14144-3-git-send-email-w.sang@pengutronix.de>	<20090614122136.GD3639@local>	<20090614171406.GA1010@pengutronix.de>	<20090614183357.GE3639@local>	<20090614190533.GA7387@pengutronix.de>
	<20090614192359.GG3639@local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <20090614192359.GG3639@local>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: "Hans J. Koch" <hjk-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, Greg KH <gregkh-l3A5Bk7waGM@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hans J. Koch wrote:
> On Sun, Jun 14, 2009 at 09:05:33PM +0200, Wolfram Sang wrote:
>>> Anyway, 0 is a valid IRQ number, so it cannot be used as "no irq".
>> May I point you to this thread?
>>
>> http://lkml.org/lkml/2005/11/21/221
> 
> Linus is just plain wrong in this 4 year old mail.

See also this related thread.

http://groups.google.com/group/rtc-linux/browse_thread/thread/9816648d5a8a1c9e/9968968188b5ab5a?lnk=gst&q=rx8025#9968968188b5ab5a

> 
>> (The issue comes up once in a while as some archs still use NO_IRQ, some with
>> 0 some with -1)
>>
>>>> 	if (uioinfo->irq == NO_IRQ)
>>>> 		uioinfo->irq = UIO_IRQ_NONE;
>>> Sorry for my ignorance, but what is NO_IRQ? If I do

It's 0 on PowerPC but ARM seems still to use -1.

http://lxr.linux.no/linux+v2.6.30/arch/powerpc/include/asm/irq.h#L29

For x86 it's not defined at all. But as this code is for the PowerPC,
where using NO_IRQ seems still to be OK.

Wolfgang.
