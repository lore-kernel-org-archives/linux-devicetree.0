From: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Subject: Re: [PATCH] drivers/rtc/rtc-isl12022.c: Device tree support
Date: Mon, 21 Jul 2014 16:25:42 -0700
Message-ID: <20140721162542.bad28d41502f7a2c57695412@linux-foundation.org>
References: <1405477705-16885-1-git-send-email-stuartl@vrt.com.au>
	<1405477705-16885-2-git-send-email-stuartl@vrt.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1405477705-16885-2-git-send-email-stuartl-EoQOJlg3kTYQrrorzV6ljw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stuart Longland <stuartl-EoQOJlg3kTYQrrorzV6ljw@public.gmane.org>
Cc: Roman Fietze <roman.fietze-rVvtEhYSWBkAey3BTtE3dg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 16 Jul 2014 12:28:25 +1000 Stuart Longland <stuartl-EoQOJlg3kTYQrrorzV6ljw@public.gmane.org> wrote:

> Add some support for configuring isl12020/isl12022 devices using the
> Device Tree blob.

checkpatch said

WARNING: DT compatible string "isl,isl12022" appears un-documented -- check ./Documentation/devicetree/bindings/
#50: FILE: drivers/rtc/rtc-isl12022.c:278:
+       { .compatible = "isl,isl12022" },
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
