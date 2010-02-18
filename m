From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Subject: Re: [Patch v2 1/2] 5200/mpc: improve i2c bus error recovery
Date: Thu, 18 Feb 2010 13:33:08 +0100
Message-ID: <OF3F226D2D.E543B45C-ONC12576CE.00360CA4-C12576CE.0044F3F3@transmode.se>
References: <OF3D88A7A0.9A4F1639-ONC12576CE.002C0FB9-C12576CE.002CCBBB@transmode.se>
	<1266433154.2322.0@antares>
	<33411516.1266484163759.JavaMail.ngmail@webmail09.arcor-online.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <33411516.1266484163759.JavaMail.ngmail@webmail09.arcor-online.net>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
To: =?ISO-8859-15?Q?Albrecht_Dre=DF?= <albrecht.dress@arcor.de>
Cc: linuxppc-dev@ozlabs.org, devicetree-discuss@lists.ozlabs.org, ben-linux@fluff.org, iws@ovro.caltech.edu
List-Id: devicetree@vger.kernel.org

"Albrecht Dre=DF" <albrecht.dress@arcor.de> wrote on 2010/02/18 10:09:23:
>
> Hi Joakim:
>
> > Does this reset sequence also send a START condition for every clock?
>
> Please see the attached scan from a scope output, showing the first two o=
ut of
> the 9 sequences at 375 kHz (that's what the 5200's divider makes from 400=
 kHz
> requested).  Resolution is 2us/div and 1V/div for both signals.  The wave=
form
> itself for each of the 9 sequences is exactly the same we had before with=
 the
> old solution, just the timing is faster and adjusted to the ii2c clock, i=
.e.
> the /relative/ waveforms look identical for slower clocks.
>
> Any insight if this is *really* correct would be great, as I'm not an i2c
> expert.  I can only say it reliably fixes the bus hangs I saw!

Looks like you do a STOP then START each time SCL is high so yes you
do a START each SCL and a STOP too. Don't think the STOP will hurt though.

Timing is OK for FAST-MODE(400kHz), cannot say for STANDARD-MODE though
need a 100Khz scope img for that.

The times to look for are:
tHD;STA, tSU;STA, tSU;STO and tBUF
at least that is what I have identified.

   Jocke
