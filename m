From: Andrew Back <andrew@abopen.com>
Subject: Re: [PATCH] openrisc: Add DTS and defconfig for DE0-Nano
Date: Fri, 15 Nov 2013 10:04:04 +0000
Message-ID: <CADj1OPA0s1-MM97+Qyk4e8BSUNQLN1+sDL5jF-=_HEAQRED_tw@mail.gmail.com>
References: <1384029451-16555-1-git-send-email-geert@linux-m68k.org>
	<20131110055145.GA7947@chokladfabriken.org>
	<5285EED9.6090401@southpole.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-bounces@lists.openrisc.net>
In-Reply-To: <5285EED9.6090401@southpole.se>
List-Unsubscribe: <http://lists.openrisc.net/options/linux>,
	<mailto:linux-request@lists.openrisc.net?subject=unsubscribe>
List-Archive: <http://lists.openrisc.net/pipermail/linux>
List-Post: <mailto:linux@lists.openrisc.net>
List-Help: <mailto:linux-request@lists.openrisc.net?subject=help>
List-Subscribe: <http://lists.openrisc.net/listinfo/linux>,
	<mailto:linux-request@lists.openrisc.net?subject=subscribe>
Sender: linux-bounces@lists.openrisc.net
Errors-To: linux-bounces@lists.openrisc.net
To: Jonas Bonn <jonas@southpole.se>
Cc: devicetree@vger.kernel.org, linux@lists.openrisc.net, Kevin Mehall <contact@kevinmehall.net>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 15 November 2013 09:52, Jonas Bonn <jonas@southpole.se> wrote:
> On 11/10/2013 06:51 AM, Stefan Kristiansson wrote:
>>
>> On Sat, Nov 09, 2013 at 09:37:31PM +0100, Geert Uytterhoeven wrote:
>>>
>>> Notable changes:
>>>    - Change flash0 to spansion,s25sl064p, due to kernel message
>>>      m25p80 spi32766.0: found s25sl064p, expected m25p10
>>
>>
>> This is due to Altera changing the EPCS chip on newer revisions
>> of that board, older versions are "relabeled" m25p10 and
>> newer once s25sl064p.
>> The change is fine though, you have to pick one.
>
>
> Actually, you want two DTS's: one for each version of the board with a
> 'compatible' property to help select the right one.  What do the revision
> numbers for these boards look like?

The bottom of my board has the following text:

P012060013
94V-0
HL9-VO
1227 F

Plus a barcode sticker which I assume is the S/N.

Best,

Andrew

--
Principal, AB Open Ltd
http://abopen.com
