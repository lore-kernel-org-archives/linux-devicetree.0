From: Alban <albeu-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH 05/10] MIPS: dts: qca: ar9132_tl_wr1043nd_v1.dts: drop
 unused alias node
Date: Mon, 15 Feb 2016 09:36:01 +0100
Message-ID: <20160215093601.1d1ae6c8@tock>
References: <1455400697-29898-1-git-send-email-antonynpavlov@gmail.com>
	<1455400697-29898-6-git-send-email-antonynpavlov@gmail.com>
	<56C0851D.5090105@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56C0851D.5090105-ynQEQJNshbs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Cc: Aban Bedel <albeu-GANU6spQydw@public.gmane.org>, Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Wills Wang <wills.wang-EMRzualFZlQ@public.gmane.org>, Daniel Schwierzeck <daniel.schwierzeck-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, 14 Feb 2016 14:46:05 +0100
Marek Vasut <marex-ynQEQJNshbs@public.gmane.org> wrote:

> On 02/13/2016 10:58 PM, Antony Pavlov wrote:
> > The TP-LINK TL-WR1043ND board has only one serial port,
> > so replacing the default of 0 with 0 does nothing useful.
> 
> I'd suggest to keep the aliases node, since it can be used by other
> non-Linux systems to access the serial port 0 . This might be useful in
> case you add some additional UART chip(s) too.

I have no strong preference, the DT people preferred to see it removed
has it had been never used. I agree other systems might need it, but if
you hack the board to add some stuff you will need your own DTS. So it
make no sense to take such eventual hack in consideration here.

Alban
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
