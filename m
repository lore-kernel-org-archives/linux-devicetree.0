From: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Subject: Re: [PATCH v3 2/6] drivers: fsi: Add SBEFIFO FSI client device driver
Date: Sat, 30 Sep 2017 06:07:16 +0930
Message-ID: <1506717436.3240277.1122909192.402C1E9C@webmail.messagingengine.com>
References: <1506114362-492-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1506114362-492-3-git-send-email-eajames@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1506114362-492-3-git-send-email-eajames-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eddie James <eajames-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, bradleyb-r5pk2Da7Bxt8sGd51Jp2sdBPR1lH4CV8@public.gmane.org, jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, "Edward A. James" <eajames-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Eddie,

On Sat, 23 Sep 2017, at 06:35, Eddie James wrote:
> From: "Edward A. James" <eajames-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
> 
> IBM POWER9 processors contain some embedded hardware and software bits
> collectively referred to as the self boot engine (SBE).  One role of
> the SBE is to act as a proxy that provides access to the registers of
> the POWER chip from other (embedded) systems.
> 
> The POWER9 chip contains a hardware frontend for communicating with
> the SBE from remote systems called the SBEFIFO.  The SBEFIFO logic
> is contained within an FSI CFAM  and as such the driver implements an
> FSI bus device.
> 
> The SBE expects to communicate using a defined wire protocol; however,
> the driver knows nothing of the protocol and only provides raw access
> to the fifo device to userspace applications wishing to communicate with
> the SBE using the wire protocol.
> 
> The SBEFIFO consists of two hardware fifos.  The upstream fifo is used
> by the driver to transfer data to the SBE on the POWER chip, from the
> system hosting the driver.  The downstream fifo is used by the driver to
> transfer data from the SBE on the power chip to the system hosting the
> driver.
> 
> Signed-off-by: Brad Bishop <bradleyb-r5pk2Da7Bxt8sGd51Jp2sdBPR1lH4CV8@public.gmane.org>
> Signed-off-by: Edward A. James <eajames-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/fsi/Kconfig       |   7 +
>  drivers/fsi/Makefile      |   1 +
>  drivers/fsi/fsi-sbefifo.c | 861
>  ++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 869 insertions(+)
>  create mode 100644 drivers/fsi/fsi-sbefifo.c

My general feeling is the implementation is too complex by half for what
is required. I may be wrong and the solution genuinely needs the
complexity, but to test that I'll cook up a counter-proposal patch and
we can debate that. I'm away for the next few days, but I hope to send
something by the end of next week.

Cheers,

Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
