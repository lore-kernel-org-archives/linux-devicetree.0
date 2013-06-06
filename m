From: Henrik =?ISO-8859-1?Q?Nordstr=F6m?= <henrik@henriknordstrom.net>
Subject: Re: getting allwinner SoC support upstream (was Re:
 Uploading linux (3.9.4-1))
Date: Thu, 06 Jun 2013 02:23:44 +0200
Message-ID: <1370478224.20454.69.camel@localhost>
References: <CAPweEDx3mAy40BZrzrKPRbvg7vKMj7KevDQ3m_v4p6Yo50eSGg@mail.gmail.com>
	<CAKON4OxDD5orX2w-_+d5kawTGXbE3KKj2QLERo9m7=NiUSXhgQ@mail.gmail.com>
	<CAPweEDzDC87KmOQ=0hyPcjPtPsRuXHxNTs97vbEqVNNnix69rA@mail.gmail.com>
	<1370468873.18839.22.camel@localhost>
	<CAPweEDwrpoYCFuWJvF99Yua_TBoONeEH8UkTZvC7dTev6FAYfw@mail.gmail.com>
Reply-To: Linux on small ARM machines <arm-netbook@lists.phcomp.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <arm-netbook-bounces@lists.phcomp.co.uk>
In-Reply-To: <CAPweEDwrpoYCFuWJvF99Yua_TBoONeEH8UkTZvC7dTev6FAYfw@mail.gmail.com>
List-Unsubscribe: <http://lists.phcomp.co.uk/mailman/options/arm-netbook>,
	<mailto:arm-netbook-request@lists.phcomp.co.uk?subject=unsubscribe>
List-Archive: <http://lists.phcomp.co.uk/pipermail/arm-netbook/>
List-Post: <mailto:arm-netbook@lists.phcomp.co.uk>
List-Help: <mailto:arm-netbook-request@lists.phcomp.co.uk?subject=help>
List-Subscribe: <http://lists.phcomp.co.uk/mailman/listinfo/arm-netbook>,
	<mailto:arm-netbook-request@lists.phcomp.co.uk?subject=subscribe>
Errors-To: arm-netbook-bounces@lists.phcomp.co.uk
Sender: "arm-netbook" <arm-netbook-bounces@lists.phcomp.co.uk>
To: Linux on small ARM machines <arm-netbook@lists.phcomp.co.uk>
Cc: devicetree-discuss <devicetree-discuss@ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, debian-arm@lists.debian.org, "jonsmirl@gmail.com" <jonsmirl@gmail.com>, ARM Linux Mailing List <linux-arm-kernel@lists.infradead.org>, debian-kernel@lists.debian.org
List-Id: devicetree@vger.kernel.org

ons 2013-06-05 klockan 23:20 +0100 skrev luke.leighton:

>  ok: great.  so we have something that i can potentially propose to
> them.   now: what reason can i give that they should accept this?
> what's the biggest incentive for them, here, to make these changes?
> what would they gain?

Mainly a common infrastructure so they don't need to hack every driver
to work with their scheme.

But there is no way to escape from the fact that first round will be far
more complicated than just adding their own stuff as-is likely is. Many
of the upstreamed drivers are rewritten and far from their drivers.

And further complicated by their supported designs often using devices
(wifi modules, touch panels, nand chips, etc) where 3 year old barely
maintained vendor code actually works better than what is currently in
the upstream kernel. 

So no, I can not say that there is an easy road ahead,

Regards
Henri
