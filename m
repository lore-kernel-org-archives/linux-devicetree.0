From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 00/14] add imx usb driver based on Greg next tree
Date: Mon, 30 Jul 2012 19:27:33 -0300
Message-ID: <CAOMZO5Bg11-ocEXoOd5W+0hEAHvuVqP6_6CW=rANySDTiNo6SA@mail.gmail.com>
References: <1340260875-21934-1-git-send-email-richard.zhao@freescale.com>
	<CAOMZO5BEVrPrgZ7E5xUE-_3zXb317mzqoZXaxXw1SNACuRzOPw@mail.gmail.com>
	<20120626023754.GJ2342@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120626023754.GJ2342-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jun 25, 2012 at 11:37 PM, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Mon, Jun 25, 2012 at 01:18:22PM -0300, Fabio Estevam wrote:
>> Any suggestions as to how to make the driver work on mx23?
>>
> I won't be able to test it on my imx23-evk board, because the board
> design is somehow odd on vbus supply, which probably requires a board
> rework.

Which board rework?

It looks like the 2.6.35 FSL kernel supports USB host on mx23evk
without the need of hardware rework.

Can we try getting USB to work on mx23 too?

Regards,

Fabio Estevam
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
