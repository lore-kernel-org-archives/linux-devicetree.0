From: Luke Kenneth Casson Leighton <lkcl@lkcl.net>
Subject: Re: getting allwinner SoC support upstream (was Re:
	Uploading linux (3.9.4-1))
Date: Thu, 6 Jun 2013 00:46:14 +0100
Message-ID: <CAPweEDyiH_F24fV5_S=a17c=YW-j4gyVaOP030HNONayLGSy0A@mail.gmail.com>
References: <CAPweEDx3mAy40BZrzrKPRbvg7vKMj7KevDQ3m_v4p6Yo50eSGg@mail.gmail.com>
	<19865137.ey1FePPnmD@flatron>
	<CAPweEDzk0T+fZ1aW16D8K4XpvRR2GRrOFtfcjzstnmEJWxmREg@mail.gmail.com>
	<31150421.hoVuV4C56M@flatron>
Reply-To: Linux on small ARM machines <arm-netbook@lists.phcomp.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <arm-netbook-bounces@lists.phcomp.co.uk>
In-Reply-To: <31150421.hoVuV4C56M@flatron>
List-Unsubscribe: <http://lists.phcomp.co.uk/mailman/options/arm-netbook>,
	<mailto:arm-netbook-request@lists.phcomp.co.uk?subject=unsubscribe>
List-Archive: <http://lists.phcomp.co.uk/pipermail/arm-netbook/>
List-Post: <mailto:arm-netbook@lists.phcomp.co.uk>
List-Help: <mailto:arm-netbook-request@lists.phcomp.co.uk?subject=help>
List-Subscribe: <http://lists.phcomp.co.uk/mailman/listinfo/arm-netbook>,
	<mailto:arm-netbook-request@lists.phcomp.co.uk?subject=subscribe>
Errors-To: arm-netbook-bounces@lists.phcomp.co.uk
Sender: "arm-netbook" <arm-netbook-bounces@lists.phcomp.co.uk>
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: devicetree-discuss <devicetree-discuss@ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, debian-arm@lists.debian.org, "jonsmirl@gmail.com" <jonsmirl@gmail.com>, Linux on small ARM machines <arm-netbook@lists.phcomp.co.uk>, linux-arm-kernel@lists.infradead.org, debian-kernel@lists.debian.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 6, 2013 at 12:27 AM, Tomasz Figa <tomasz.figa@gmail.com> wrote:

>>  their sheer overwhelming success provides us with mass-volume
>> ultra-low cost hardware.  to not make an effort to accommodate them
>> would in this specific instance be a huge missed opportunity,

> OK, this is a large volume of hardware that can be used to run free
> software, point taken.

 as it's a shorter URL by 200% than the original it refers to here's a link:
   http://lists.phcomp.co.uk/pipermail/arm-netbook/2013-May/007532.html

 the key bit is a dec 2012 china visit by the author of that [insanely
long, even by my standards] report, where he does a double-take,
believing that he's mis-heard due to his poor understanding of
chinese, and he *literally* goes into shock when he works out that
he's been told that the 7in tablet being offered to him, even before
"haggling", is $USD 35, and yet its specification neither blows nor
sucks.

 with allwinner bringing out the A31, i really have absolutely no idea
how any other company is going to compete in this market, except by
adding extra value such as R.F. base-band and that's sewn up by
mediatek.  the only saving grace for the competition is that
allwinner, due to their inexperience, bought the imgtec kool-aid and
deployed PowerVR's latest SGX545MP2 offering [*1]


> I don't say that having mainline support for this platform wouldn't be
> nice. Sure, it would. But if the company doesn't want to cooperate and
> comply to existing rules, I don't think it can be helped.

 they've got no idea that there *are* any - they don't speak english!
(and the team has a manager who is a fucking dickhead, who amongst
other things has been responsible for disobeying the Director's
explicit instructions to be GPL-compliant as well as ordering the
team's engineers to create a script that destroys Allwinner Copyright
notices and replaces it with Copyright 2010-2017 reilllumatech.com,
but that's another story that's being addressed)

 ok it's very late here tomasz, i'll read more of this tomorrow: i've
started the discussion but i am actually completely overwhelmed so may
have to leave it to people to get back to me with some options for
proposals preferably by the beginning of next week (10th june) at the
latest, to give allwinner an opportunity to go over this early.

i'd greatly appreciate if people could run the gamut from one extreme
to the other: ideas such as "why not put script.fex verbatim as a blob
into a device-tree entry" all the way through to "why not rip
script.fex out completely and convert everything to devicetree for
them".

l.

[*1] http://www.youtube.com/watch?v=W-HCb55X_XU - 35 minutes in.  libv
talking about why for god's sake don't ever get involved with powervr.
