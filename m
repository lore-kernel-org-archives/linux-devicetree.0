From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 03/12] phylib: add a driver method for the SIOCSHWTSTAMP
	ioctl.
Date: Tue, 15 Jun 2010 10:49:56 -0600
Message-ID: <AANLkTilYe-TKxSnIweNt4laXLlhP6pCe9Hr4szqv_7TY@mail.gmail.com>
References: <cover.1276615626.git.richard.cochran@omicron.at>
	<77fe18d640e35dcbfad1e117a4321f935500d5ac.1276615626.git.richard.cochran@omicron.at>
	<AANLkTiml5FyHstY-0ZPHxFDvA349BZv3TeX9gXtURFFN@mail.gmail.com>
	<20100615163409.GA10668@riccoc20.at.omicron.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20100615163409.GA10668@riccoc20.at.omicron.at>
Sender: netdev-owner@vger.kernel.org
To: Richard Cochran <richardcochran@gmail.com>
Cc: netdev@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Krzysztof Halasa <khc@pm.waw.pl>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 15, 2010 at 10:34 AM, Richard Cochran
<richardcochran@gmail.com> wrote:
> On Tue, Jun 15, 2010 at 10:27:59AM -0600, Grant Likely wrote:
>> On Tue, Jun 15, 2010 at 10:08 AM, Richard Cochran
>> <richardcochran@gmail.com> wrote:
>> > This patch adds a phy driver method for configuring hardware time =
stamping.
>> > Drivers may optionally implement this function.
>> >
>> > Signed-off-by: Richard Cochran <richard.cochran@omicron.at>
>>
>> Adding an ioctl to the userspace ABI. =A0Make sure you cc: linux-ker=
nel
>> on the next spin of this series.
>
> Not sure what you mean. SIOCSHWTSTAMP is a standard socket option as
> of 2.6.30. The patch just makes it possible for PHY drivers to
> implement this option.

Ah, sorry.  I didn't go check that first.

g.
