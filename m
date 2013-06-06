From: Stefan Monnier <monnier@iro.umontreal.ca>
Subject: Re: getting allwinner SoC support upstream (was Re:
	Uploading linux (3.9.4-1))
Date: Wed, 05 Jun 2013 21:56:39 -0400
Message-ID: <jwvd2s0qaex.fsf-monnier+gmane.comp.hardware.netbook.arm@gnu.org>
References: <CAPweEDx3mAy40BZrzrKPRbvg7vKMj7KevDQ3m_v4p6Yo50eSGg@mail.gmail.com>
	<CAKON4OxDD5orX2w-_+d5kawTGXbE3KKj2QLERo9m7=NiUSXhgQ@mail.gmail.com>
	<51AFA6DD.3000202@wwwdotorg.org>
	<CAPweEDz=hFxXW3XF9CSNZpEFSjayb5an1E8Xze1_uQcCZONVxg@mail.gmail.com>
Reply-To: Linux on small ARM machines <arm-netbook@lists.phcomp.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <arm-netbook-bounces@lists.phcomp.co.uk>
List-Unsubscribe: <http://lists.phcomp.co.uk/mailman/options/arm-netbook>,
	<mailto:arm-netbook-request@lists.phcomp.co.uk?subject=unsubscribe>
List-Archive: <http://lists.phcomp.co.uk/pipermail/arm-netbook/>
List-Post: <mailto:arm-netbook@lists.phcomp.co.uk>
List-Help: <mailto:arm-netbook-request@lists.phcomp.co.uk?subject=help>
List-Subscribe: <http://lists.phcomp.co.uk/mailman/listinfo/arm-netbook>,
	<mailto:arm-netbook-request@lists.phcomp.co.uk?subject=subscribe>
Errors-To: arm-netbook-bounces@lists.phcomp.co.uk
Sender: "arm-netbook" <arm-netbook-bounces@lists.phcomp.co.uk>
To: arm-netbook@lists.phcomp.co.uk
Cc: debian-arm@lists.debian.org, devicetree-discuss@ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, debian-kernel@lists.debian.org
List-Id: devicetree@vger.kernel.org

>  so the point is: if anyone wishes me to propose to allwinner that
> they convert over to devicetree, or any other proposal which involves
> significant low-level changes to their working practices that could
> potentially have a massive knock-on effect onto their
> multi-million-dollar clients, it had better be a damn good story.

AFAIK the only argument in favor of them following the mainline kernel's
practices is to ease up future development, and maintenance.
Apparently, they focus on the short term for now, so they may simply not
care (yet).

In that case, there isn't much we can do to convince them right away.
One way is to do the job for them, i.e. port the drivers over to DT and
write the various fex-to-DT and DOT-to-foo tools.

At some point, they'll see that it's cheaper for them to use the sunxi
(or mainline if/when it gets there) kernel than to keep hacking on their
mess.

Obviously, this has the disadvantage that someone needs to do the job
that Allwinner should do.


        Stefan
