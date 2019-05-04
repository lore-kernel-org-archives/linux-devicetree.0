From: Oleksij Rempel <linux@rempel-privat.de>
Subject: Re: [PATCH v3 0/3] MIPS: ath79: add ag71xx support
Date: Sat, 4 May 2019 19:45:45 +0200
Message-ID: <c46366ad-8202-76ef-99c9-dc86630208d1@rempel-privat.de>
References: <20190422064046.2822-1-o.rempel@pengutronix.de>
 <CAJsYDV+1dXfQ3qKMDkbbXa94UQ+DiNCQ3YQB=PTkeXJ19Xa8uQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJsYDV+1dXfQ3qKMDkbbXa94UQ+DiNCQ3YQB=PTkeXJ19Xa8uQ@mail.gmail.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Chuanhong Guo <gch981213@gmail.com>, Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Paul Burton <paul.burton@mips.com>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>, Rob Herring <robh+dt@kernel.org>, Jay Cliburn <jcliburn@gmail.com>, Chris Snook <chris.snook@gmail.com>, "David S. Miller" <davem@davemloft.net>, Mark Rutland <mark.rutland@arm.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, linux-mips@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

Am 04.05.19 um 18:01 schrieb Chuanhong Guo:
> Hi!
>
> On Mon, Apr 22, 2019 at 2:41 PM Oleksij Rempel <o.rempel@pengutronix.de>=
 wrote:
>> [...]
>> - most of deficetree bindings was removed. Not every thing made sense
>>   and most of it is SoC specific, so it is possible to detect it by
>>   compatible.
>
> I noticed that you've dropped all PLL and gmac-config stuff. These are
> board-specific properties and PLL registers should be changed
> accroding to negotiated ethernet speed. By dropping them, you rely on
> bootloader to configure everything corectly for you (which has been
> proven unreliable for many ath79 routers) and ethernet won't work if
> negotiated speed changed after u-boot's configuration.
Both of them should be properly implemented before mainlining. This is
the reason why they removed.

=2D-
Regards,
Oleksij
