From: arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org (Arnaud Ebalard)
Subject: Re: [PATCHv1 1/3] arm: mvebu: add uartX labels for Armada SoC serial nodes
Date: Sun, 16 Nov 2014 13:34:10 +0100
Message-ID: <87h9xzb9z1.fsf@natisbad.org>
References: <cover.1416095841.git.arno@natisbad.org>
	<ee5646b8e097b266f51a68f489644256d7c3df33.1416095841.git.arno@natisbad.org>
	<20141116010933.GB15870@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141116010933.GB15870-g2DYL2Zd6BY@public.gmane.org> (Andrew Lunn's message of "Sun,
	16 Nov 2014 02:09:33 +0100")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Benoit Masson <yahoo-+V3Jd3LB6RBWk0Htik3J/w@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ben Peddell <klightspeed-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Andrew,

Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org> writes:

> On Sun, Nov 16, 2014 at 01:04:12AM +0100, Arnaud Ebalard wrote:
>> 
>> This patch adds uartX labels for Armada SoC serial nodes. This is
>> a preliminary work to be able to easily reference the serial lines
>> in Device Tree files. One expected future use is when providing
>> stdout-path property for barebox.
>> 
>> Signed-off-by: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
>
> Acked-by: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
>
> Not a must, but it would be nice to make use of these in
> armada-xp-lenovo-ix4-300d.dts, which currently has:
>
>       	     stdout-path = "/soc/internal-regs/serial@12000";

Will add a patch to the series to do that.

Thanks.

a+
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
