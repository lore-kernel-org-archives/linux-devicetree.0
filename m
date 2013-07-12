From: Daniel Drake <dsd@laptop.org>
Subject: Re: [PATCH V3 1/3] dts: change Marvell prefix to 'marvell'
Date: Fri, 12 Jul 2013 09:10:49 -0600
Message-ID: <CAMLZHHQGZvDssY-YxQ3ZW8FYhpG-H1-VbokOid33socRSPrMNw@mail.gmail.com>
References: <1373352166-10064-1-git-send-email-zhangwm@marvell.com>
	<1373352166-10064-2-git-send-email-zhangwm@marvell.com>
	<20130709124900.GG11908@titan.lakedaemon.net>
	<CAN1soZxiOh6TpbUOCUzK8gNwmvjbT3ihkUWaw8tuZ7md+NVA2g@mail.gmail.com>
	<20130710122433.GO11908@titan.lakedaemon.net>
	<CAN1soZzMvront1-jcBW6-uRKNs0OZNGnmiOjKGZSM28bViB_8A@mail.gmail.com>
	<20130710215041.GR11908@titan.lakedaemon.net>
	<CAN1soZzuiukY9qASFNcH0k=zH8=uT=71bKejPss44FCzNy=X-A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAN1soZzuiukY9qASFNcH0k=zH8=uT=71bKejPss44FCzNy=X-A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Haojian Zhuang <haojian.zhuang@gmail.com>
Cc: Jason Cooper <jason@lakedaemon.net>, Bergmann Arnd <arnd@arndb.de>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, Neil Zhang <zhangwm@marvell.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 11, 2013 at 5:54 PM, Haojian Zhuang
<haojian.zhuang@gmail.com> wrote:
>> Well, Daniel Drake spoke up for OLPC.  Does that count?
>
> We don't know they used DT on Marvell MMP2/MMP3. So they don't have DTS file
> in kernel, we could use both old name & new name in driver.

You are listed as one of the MMP maintainers in the MAINTAINERS file
and I have sent you several patches in the few 3 weeks which make
OLPC's usage of MMP + DT pretty obvious. As a maintainer I believe you
are supposed to review the patches too. hint hint ;)

My request to avoid breaking compatibility actually comes as a
two-prong request.

I would prefer to see these compatible properties stay the same as it
seems like changing them has little purpose/benefit - and there *will*
become a later point where changing them causes major breakage.

At the same time I see that there have been recent efforts to remove
MMP2 platform code and make it entirely DT-driven, which could also
generate some compatibility concerns. However, such movements are much
appreciated and I think they will become increasingly necessary as we
bring up the devices on the MMP3 SoC to a fuller extent, so please
continue :) I would not want to discourage you from breaking
compatibility when *that* type of work needs to be done.


So: breaking compatibility is actually OK from my standpoint, but only
for now (while we stabilise), and I would advise/appreciate that it
only be done in cases where there is a clear purpose and benefit.

Daniel
