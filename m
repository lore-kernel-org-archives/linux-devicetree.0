From: "Giuseppe Lippolis" <giu.lippolis-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: multi interface device
Date: Sun, 5 Feb 2017 12:17:23 +0100
Message-ID: <006001d27fa1$6cd5aa50$4680fef0$@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: de
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi All,
I'm going to investigate for a proslic device driver.
The proslic is a chip able to drive a regular phone.
It has 2 main interface, one spi interface used for control, one pcm
interface used to stream the audio.
In addition one irq is available.

Suppose that my soc have one spi controller (to connect the ctrl port), one
pcm controller (to connect the pcm port) and one gpio where to connect the
irq line, how shall I write the corresponding DT?

How then the init/probe phase for the module shall proceed?

Thanks.
Bye.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
