From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 RESEND 0/2] WM8505/WM8650 DT fixes for SD card controller
Date: Fri, 01 Jan 2016 22:53:33 +0100
Message-ID: <9863929.DgKyDlgJ1e@wuerfel>
References: <1451655492-2569-1-git-send-email-v1ron@mail.ru> <7786478.TezhYjHkEF@wuerfel> <20160101203230.1dc5e655@v1ron-s7>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20160101203230.1dc5e655@v1ron-s7>
Sender: stable-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Roman Volkov <v1ron@mail.ru>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, linux+armsoc@arm.linux.org.uk, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Tony Prisk <linux@prisktech.co.nz>, Rob Herring <robh+dt@kernel.org>, arm@kernel.org, Alexey Charkov <alchark@gmail.com>, Roman Volkov <rvolkov@v1ros.org>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Friday 01 January 2016 20:32:30 Roman Volkov wrote:
> > Applied both to next/dt, thanks a lot for following up!
> > 
> > Let me know if you think this should go into stable backports as well,
> > I did not apply it to the fixes branch as you don't have a
> > 'Cc: stable@vger.kernel.org' tag and it has never worked so far.
> 
> Yes, this must go into the stable too. Let me know if I must change
> something or resend.

I can put them in the fixes branch with the appropriate stable
tag myself, but please clarify whether we need just the first or
both patches there. It looks to me that the second one while
correct only addresses a cosmetic problem and everything works
without it.

	Arnd
